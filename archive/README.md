# Archived website assets

These assets are retained for reference and possible reuse. The current landing
page does not load them. Files were moved without changing their contents after
checkpoint commit `c427543` on October 6, 2026.

- `legacy-site/images/`: 23 images, logos, library icons, and the original DNA
  favicon. Their former paths were `images/<filename>`.
- `legacy-site/teaching/`: the two teaching-evaluation PDFs,
  `Rychel_Kevin_Student_IA_Evaluation_WI20.pdf` and
  `Rychel_Kevin_Student_IA_Evaluation_WI21.pdf`, formerly at the repository root.

Keep these files tracked in Git. SHA-256 comparisons verified that all 25 moves
preserved their bytes. The previous folder arrangement is also available in
checkpoint `c427543`. The historical homepage is available in earlier Git
commits; this folder contains assets rather than a second live website.

Current banner/portrait exports live in family folders under `images/`;
conceptual SVGs and favicons retain their paths. Kevin requested archiving the teaching PDFs and retiring
their former root paths. The two superseded low-resolution JPEGs and six unused
square tissue crops from the new-site draft were deleted rather than archived.
This folder retains historical material; unused draft outputs are not kept.
Full-resolution image masters are local, ignored inputs in `images/masters/`;
they remain sources for the active exports and are not archived web assets.

The phone preview excludes this entire directory. An `archive/` name alone does
not exclude files from GitHub Pages publication. This cleanup does not change
publishing configuration; verify the Pages source before choosing deployment
exclusions. Moving legacy images changes their old image URLs when deployed.
