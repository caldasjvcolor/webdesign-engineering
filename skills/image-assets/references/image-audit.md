# Image audit reference

Use for asset planning, review, or a performance/accessibility audit.

## File and layout checks

- names are lowercase kebab-case and describe the asset;
- raster files have readable, non-zero dimensions;
- aspect ratio matches the component's intended crop or uses an explicit fit;
- likely LCP media has a deliberate priority and stable dimensions;
- below-the-fold media is not eager without a reason;
- local assets have ownership or reuse authorisation recorded in the project;
- alt text describes the image, not a marketing keyword target.

The deterministic audit checks file naming and dimensions where the format is
parseable. It cannot prove visual quality, licensing, focal-point correctness,
or whether alt text accurately describes a particular photograph.
