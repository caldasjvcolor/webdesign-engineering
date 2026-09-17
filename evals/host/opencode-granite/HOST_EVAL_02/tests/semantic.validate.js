"use strict";

const assert = require("node:assert/strict");
const { selectEligible } = require("../src/score");

const items = [
  { id: "boundary", score: 80, label: "Ready" },
  { id: "high", score: 95, label: "Ready" },
  { id: "below", score: 79.99, label: "Ready" },
  { id: "unknown", score: 99, label: "Unknown" },
  { id: "invalid", score: Infinity, label: "Ready" }
];
const snapshot = JSON.stringify(items);
const result = selectEligible(items, 80);

assert.deepEqual(result.map((item) => item.id), ["boundary", "high"]);
assert.equal(JSON.stringify(items), snapshot);
assert.ok(result.every((item) => item.score >= 80));
assert.ok(result.every((item) => item.label !== "Unknown"));
console.log("semantic: PASS");
