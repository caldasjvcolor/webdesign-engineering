#!/usr/bin/env python3
"""Validate the mechanical invariants of JSON-LD used by a web project."""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Any, Iterable


PLACEHOLDER = re.compile(
    r"(?:\bTODO\b|example\.com|lorem ipsum|your\s+(?:name|company|address))",
    re.IGNORECASE,
)
RICH_KEYS = {"review", "aggregaterating"}


def load_documents(path: Path) -> list[Any]:
    text = path.read_text(encoding="utf-8")
    blocks = re.findall(
        r"<script\b[^>]*type\s*=\s*[\"']application/ld\+json[\"'][^>]*>(.*?)</script>",
        text,
        flags=re.IGNORECASE | re.DOTALL,
    )
    if blocks:
        return [json.loads(block.strip()) for block in blocks]
    return [json.loads(text)]


def strings(value: Any) -> Iterable[str]:
    if isinstance(value, str):
        yield value
    elif isinstance(value, dict):
        for item in value.values():
            yield from strings(item)
    elif isinstance(value, list):
        for item in value:
            yield from strings(item)


def keys(value: Any) -> Iterable[str]:
    if isinstance(value, dict):
        for key, item in value.items():
            yield key
            yield from keys(item)
    elif isinstance(value, list):
        for item in value:
            yield from keys(item)


def validate_document(document: Any, allow_rich_reviews: bool) -> list[str]:
    errors: list[str] = []
    if not isinstance(document, (dict, list)):
        return ["top-level JSON-LD value must be an object or array"]

    nodes = document if isinstance(document, list) else [document]
    for root_index, root in enumerate(nodes, start=1):
        if not isinstance(root, dict):
            errors.append(f"document item {root_index} is not an object")
            continue
        context = root.get("@context")
        if context is not None:
            context_text = json.dumps(context).lower()
            if "schema.org" not in context_text:
                errors.append(f"document item {root_index} has no Schema.org @context")
        graph = root.get("@graph")
        graph_nodes = graph if isinstance(graph, list) else [root]
        if not isinstance(graph, list) and "@context" not in root:
            errors.append(f"document item {root_index} is missing @context")
        if isinstance(graph, list) and "@context" not in root:
            errors.append(f"document item {root_index} graph is missing @context")
        for node_index, node in enumerate(graph_nodes, start=1):
            if not isinstance(node, dict):
                errors.append(f"document item {root_index} graph item {node_index} is not an object")
                continue
            if "@type" not in node or not node["@type"]:
                errors.append(f"document item {root_index} graph item {node_index} is missing @type")

    if not allow_rich_reviews:
        for key in keys(document):
            if key.lower() in RICH_KEYS:
                errors.append(f"rich-review field '{key}' requires explicit reviewed evidence")
    for value in strings(document):
        if PLACEHOLDER.search(value):
            errors.append(f"obvious placeholder detected: {value!r}")
    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--file", required=True, type=Path, help="HTML or JSON-LD file")
    parser.add_argument(
        "--allow-rich-reviews",
        action="store_true",
        help="permit review or aggregateRating fields after explicit human review",
    )
    args = parser.parse_args()
    if not args.file.is_file():
        print(f"ERROR missing file: {args.file}", file=sys.stderr)
        return 2
    try:
        documents = load_documents(args.file)
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        print(f"ERROR cannot parse {args.file}: {exc}", file=sys.stderr)
        return 1
    errors: list[str] = []
    for index, document in enumerate(documents, start=1):
        errors.extend(f"document {index}: {error}" for error in validate_document(document, args.allow_rich_reviews))
    if errors:
        for error in errors:
            print(f"FAIL {error}")
        return 1
    print(f"PASS jsonld_documents={len(documents)} file={args.file}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
