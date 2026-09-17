"use strict";

const assert = require("node:assert/strict");
const { selectEligible } = require("../src/score");

const items = [
  { id: "boundary", score: 80, label: "Ready" },
  { id: "high", score: 95, label: "Ready" },
  { id: "below", score: 79, label: "Ready" },
  { id: "unknown", score: 99, label: "Unknown" }
];

const result = selectEligible(items, 80);
assert.deepEqual(result.map((item) => item.id), ["boundary", "high"]);
console.log("visible: PASS");
