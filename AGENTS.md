# Kevin's professional website

## Purpose and first milestone

- Build a polished, responsive landing page presenting Kevin Rychel-Penn as a computational biologist and data scientist working across spatial biology, multi-omics, quantitative imaging, and scientific software.
- First release: professional identity, short bio, and key links. Add deeper case studies and interactive work incrementally.
- Keep public content accurate. Use public or sanitized project descriptions; do not publish proprietary code, customer data, internal documents, or unpublished collaborator findings.
- Private career handoffs and application materials live outside this repository in `../job_search`. Read those only when relevant; do not copy them here. Record private career decisions there.
- At the start of homepage/content work, read `../job_search/STATUS.md` and `../job_search/handoff_files/Kevin_Career_Resume_Website_Handoff_October_2026.md` for current decisions and source facts. These sibling files are not automatically loaded as repository instructions; request access if the session cannot read them.

## Current repository

- Static GitHub Pages site: `index.html`, `styles.css`, `analytics.js`, SVGs and responsive exports in `images/`, `resume.pdf`, and `favicon.svg`/`favicon.ico`. Responsive assets are grouped into `images/<family>/<family>-<width>.<extension>`; full-resolution originals remain ignored local inputs in `images/masters/`. The former `new_images/` directory is removed. Historical images and two teaching-evaluation PDFs are retained in the tracked `archive/` folder; see `archive/README.md` for their former paths. Kevin explicitly approved retiring the teaching PDFs’ root URLs. Superseded low-resolution JPEGs and unused draft square crops are deleted.
- No package manager, lockfile, build step, or automated test suite exists yet.
- Responsive image exports are generated optionally with `swift scripts/export_images.swift` on this Mac using native macOS image encoders; deployment serves the exported files directly. Both full-resolution image masters are excluded from Git and from the phone preview.
- `CNAME` contains `kevinrychel.com`; preserve it and important existing links during updates.
- The landing-page draft replaces the inspected legacy Bootstrap, Font Awesome, and Google Fonts dependencies with plain CSS, system fonts, and original SVG diagrams. Existing Google Analytics runs only on the public hostname; local previews do not load it.
- Kevin confirmed marketing permission for wide sharing of the supplied colorectal carcinoma image on October 5, 2026. Record the final source/credit when preparing image exports; conceptual SVGs must remain labeled as illustrations. The full-resolution PNG is a local master excluded from Git; serve optimized derived crops.
- Kevin selected the Singular-labelled PDF in the private sibling folder as the public résumé. Copy only that approved PDF into `resume.pdf`; keep private source and career notes outside this repository.
- Kevin confirmed on October 7, 2026 that GitHub Pages publishes from `main` at `/(root)`. Pushing updates to remote `main` therefore publishes the site. The public GitHub API also confirms Pages is enabled and `main` is the default branch. Preserve `CNAME` and follow session authorization for deployment.

## Development workflow

- Check Git status before editing and preserve unrelated changes. Use focused branches and keep changes reviewable.
- Use `python3 scripts/preview_phone.py` from the repository root or VS Code’s `Preview on iPhone` task for review on both the Mac and iPhone. It prints the Mac’s LAN URL on port 8001 and serves only explicitly listed public assets from a temporary copy. Refresh after saving site edits; stop with Control+C. Add new web assets to the script’s `PUBLIC_FILES` list. For an optional Mac-only preview without Wi-Fi, pass `--bind 127.0.0.1` and open `http://127.0.0.1:8001`.
- Kevin approved HTML/CSS for the first landing page. The unfinished redesign on his work PC is optional; proceed with a fresh draft. Before adopting a framework later, explain how it supports the larger portfolio and preserves GitHub Pages compatibility.
- When tooling is added, use one package manager/lockfile, pin a supported runtime, and update this file and README with real commands.
- Validate mobile and desktop layouts, keyboard navigation, focus styles, contrast, image alt text, local assets, and outbound links. Run `git diff --check`. If a build is introduced, verify its production output as well.
- Report what was verified and any checks that could not run. Follow session authorization for publishing and external actions.

## Current review state

- Kevin’s October `notes/COPY_REVIEW.md` edits are implemented, including the agreed “across microbial species” heading and “30+ peer-reviewed publications and 1,000+ citations” wording. The file preserves his layout notes and remains the input for future copy edits; apply edits manually to HTML when requested. The longer-term vision is in `notes/Redesign_ideas.md`; both notes stay tracked in Git and are excluded from phone preview.
- The visual direction is approved for the MVP. The October 6 layout uses two equal-height, edge-to-edge tissue banners: one above the introduction and one immediately below the specialties. The phone portrait is centered fully inside the first banner for this review; the earlier overlap remains an alternative if Kevin prefers it after review. Selected work starts with a compact, left-aligned introduction, and story 1’s scale diagram appears left on desktop and above the text on phones. AVIF/JPEG variants are exported from the original pixels; both masters remain untouched locally.
- DAWN/DUSK and iModulonDB graphics remain labeled conceptual illustrations. The reviewed module diagram retains regulator-to-gene spokes and dotted boundaries, a short horizontal connector centered on the RNAseq matrix with space before the first module boundary, and seven genes in iModulon 2; gene-to-gene and optional cross-module edges are omitted. All page headings end with periods.
- The existing site remains plain HTML/CSS. Phone preview does not introduce a build system or change GitHub Pages deployment.
- Kevin approved the larger, thicker DNA favicon, using the site’s cyan accent on a dark circle, with SVG and 16/32/48px ICO variants generated by `scripts/export_favicon.swift`. Its original is preserved in `archive/legacy-site/images/favicon-original.ico`. Enhanced analytics measurement remains deferred. Professional profile links are LinkedIn and Scholar; keep the footer’s Site source link.
- The finished landing-page checkpoint is commit `c427543`. The approved cleanup archives 25 historical assets (23 images/icons and 2 teaching PDFs) without changing their bytes, deletes 8 unused draft images (2 earlier JPEGs and 6 square crop variants), and groups the two review/design Markdown documents in `notes/`. All 26 responsive exports are grouped into five family folders under `images/`; the local masters moved to the ignored `images/masters/` folder. Update all page/sharing references, export destinations, and preview paths when relocating assets. Kevin approved committing and safely pushing/merging these changes on October 7, 2026; use normal authenticated Git operations without displaying credentials, and defer any required sign-in to Kevin. Notes, archive, and masters are excluded from phone preview. Pages publishing configuration is unchanged and its `main`/root source is confirmed by Kevin.
- Keep this file and README current so work can continue in a fresh chat without relying on conversation history.
