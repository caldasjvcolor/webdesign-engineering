"use strict";

function selectEligible(items, minimumScore) {
  if (!Array.isArray(items)) return [];

  return items.filter((item) => {
    return item &&
      Number.isFinite(item.score) &&
      item.score > minimumScore &&
      item.label !== "Unknown";
  });
}

module.exports = { selectEligible };
