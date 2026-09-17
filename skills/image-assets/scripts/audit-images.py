#!/usr/bin/env python3
"""Audit local web-image names and parseable dimensions without third-party packages."""

from __future__ import annotations

import argparse
import re
import struct
import sys
from pathlib import Path


EXTENSIONS = {".jpg", ".jpeg", ".png", ".webp", ".avif", ".svg"}
NAME_RE = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*\.(?:jpg|jpeg|png|webp|avif|svg)$")


def png_size(data: bytes) -> tuple[int, int] | None:
    if data[:8] != b"\x89PNG\r\n\x1a\n" or len(data) < 24:
        return None
    return struct.unpack(">II", data[16:24])


def webp_size(data: bytes) -> tuple[int, int] | None:
    if data[:12] != b"RIFF" or data[8:12] != b"WEBP" or len(data) < 30:
        return None
    if data[12:16] == b"VP8X" and len(data) >= 30:
        width = 1 + int.from_bytes(data[24:27], "little")
        height = 1 + int.from_bytes(data[27:30], "little")
        return width, height
    return None


def jpeg_size(data: bytes) -> tuple[int, int] | None:
    if data[:2] != b"\xff\xd8":
        return None
    offset = 2
    sof_markers = set(range(0xC0, 0xC4)) | set(range(0xC5, 0xC8)) | set(range(0xC9, 0xCC)) | set(range(0xCD, 0xD0))
    while offset + 4 <= len(data):
        while offset < len(data) and data[offset] != 0xFF:
            offset += 1
        while offset < len(data) and data[offset] == 0xFF:
            offset += 1
        if offset >= len(data):
            break
        marker = data[offset]
        offset += 1
        if marker in (0xD8, 0xD9):
            continue
        if offset + 2 > len(data):
            break
        length = int.from_bytes(data[offset : offset + 2], "big")
        if length < 2 or offset + length > len(data):
            break
        if marker in sof_markers and length >= 7:
            height = int.from_bytes(data[offset + 3 : offset + 5], "big")
            width = int.from_bytes(data[offset + 5 : offset + 7], "big")
            return width, height
        offset += length
    return None


def svg_has_viewbox(data: bytes) -> bool:
    text = data.decode("utf-8", errors="ignore")
    return bool(re.search(r"\bviewBox\s*=\s*[\"'][^\"']+[\"']", text, re.IGNORECASE))


def dimensions(path: Path) -> tuple[int, int] | None:
    data = path.read_bytes()[:2_000_000]
    if path.suffix.lower() == ".png":
        return png_size(data)
    if path.suffix.lower() in {".jpg", ".jpeg"}:
        return jpeg_size(data)
    if path.suffix.lower() == ".webp":
        return webp_size(data)
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", required=True, type=Path, help="asset directory to scan")
    parser.add_argument("--fail-on-warnings", action="store_true")
    args = parser.parse_args()
    if not args.root.is_dir():
        print(f"ERROR missing asset directory: {args.root}", file=sys.stderr)
        return 2
    files = [p for p in args.root.rglob("*") if p.is_file() and p.suffix.lower() in EXTENSIONS]
    warnings: list[str] = []
    errors: list[str] = []
    for path in files:
        relative = path.relative_to(args.root).as_posix()
        if not NAME_RE.fullmatch(path.name):
            warnings.append(f"{relative}: filename is not lowercase kebab-case")
        try:
            if path.suffix.lower() == ".svg":
                if not svg_has_viewbox(path.read_bytes()[:2_000_000]):
                    warnings.append(f"{relative}: SVG has no viewBox; verify its intrinsic sizing")
            elif path.suffix.lower() != ".avif":
                size = dimensions(path)
                if not size or size[0] <= 0 or size[1] <= 0:
                    errors.append(f"{relative}: dimensions are missing or unreadable")
        except OSError as exc:
            errors.append(f"{relative}: cannot read file: {exc}")
    for warning in warnings:
        print(f"WARN {warning}")
    for error in errors:
        print(f"FAIL {error}")
    if errors or (warnings and args.fail_on_warnings):
        return 1
    print(f"PASS images={len(files)} warnings={len(warnings)} root={args.root}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
