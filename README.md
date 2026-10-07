# KevinRychel.com
This is the source code for KevinRychel.com, Kevin Rychel-Penn’s professional portfolio in computational biology, spatial biology, multi-omics, quantitative imaging, and scientific software.

Visit the site at [KevinRychel.com](https://www.kevinrychel.com)

## Preview on Mac and iPhone

This is a static HTML/CSS site. No Node installation, package manager, or build step is required. The page works without JavaScript; the small analytics script runs only on the existing public domain.

Use one preview server for both devices. In VS Code, choose **Terminal → Run Task → Preview on iPhone**, or run this from the repository root:

```sh
python3 scripts/preview_phone.py
```

Open the printed URL in your Mac’s browser or in Safari on an iPhone connected to the same Wi-Fi. The current network address is <http://192.168.1.69:8001/>; it can change after switching networks or routers. Restart the script to get the new address. Keep the Mac awake and the terminal running, refresh after saving changes, and stop with Control+C.

The preview serves only explicitly listed website assets, excluding Git files, `notes/`, `archive/`, private sibling folders, and full-resolution image masters. Add future web assets to `PUBLIC_FILES` in the script and restart it. There is no automatic browser reload; edits to `notes/COPY_REVIEW.md` still need to be applied manually to the HTML. This preview does not reproduce GitHub Pages processing or verify deployment settings.

For an optional Mac-only preview without Wi-Fi, use the same script:

```sh
python3 scripts/preview_phone.py --bind 127.0.0.1
```

Open <http://127.0.0.1:8001/> on the Mac; this address cannot be used from the phone. You do not need a separate localhost server for the usual Wi-Fi workflow.

If Wi-Fi address detection fails, find the Mac’s address in **System Settings → Wi-Fi → Details → TCP/IP** and pass `--bind YOUR_LAN_IP`. If Safari cannot connect, check that both devices use the same non-guest Wi-Fi and that a VPN or firewall is not blocking local connections; accept a macOS incoming-network prompt if shown. If the port is occupied, pass `--port 8002`.

## Project structure

- `index.html`: semantic page markup and curated publication links.
- `styles.css`: responsive layouts, shared design tokens, and focus styles.
- `analytics.js`: existing Google Analytics ID, disabled on local previews.
- `images/`: the two conceptual SVGs and responsive exports grouped by family: `crc-banner/`, `crc-banner-mobile/`, `crc-work-banner/`, `crc-work-banner-mobile/`, and `kevin-portrait/`. For example, `images/crc-banner/crc-banner-800.avif`.
- `images/masters/`: full-resolution local originals, ignored by Git and excluded from the preview.
- `archive/`: tracked historical images, logos, the original favicon, and teaching PDFs, with their previous locations documented in `archive/README.md`. The phone preview excludes this directory.
- `resume.pdf`: the public résumé selected by Kevin; private source files remain outside this repository.
- `favicon.svg` and `favicon.ico`: cyan DNA helix on a dark circular background, with vector and 16/32/48px fallback versions. The original icon is preserved in `archive/legacy-site/images/favicon-original.ico`.
- The two teaching PDFs are preserved in `archive/legacy-site/teaching/`; their former root paths are retired.
- `CNAME`: existing custom domain, `kevinrychel.com`.
- `AGENTS.md`: instructions for working with Codex in this repository.
- `notes/COPY_REVIEW.md`: editable snapshot of page copy, link labels, captions, and layout notes. Changes are applied manually to the HTML in a later review pass.
- `notes/Redesign_ideas.md`: the longer-term website vision, retained for future development.
- `scripts/preview_phone.py` and `.vscode/tasks.json`: public-asset Wi-Fi preview and its VS Code task, using Python’s standard library.
- `scripts/export_images.swift`: optional macOS image-export utility; the website serves the already-exported assets without running it.
- `scripts/export_favicon.swift`: optional native macOS exporter for the matching SVG/ICO favicon. Run `swift scripts/export_favicon.swift` from the repository root; no website build step is needed.

## Validation and publishing

Before publishing, check the page at mobile and desktop widths, navigate links and controls with the keyboard, and verify local assets and outbound links. Run `git diff --check` for whitespace errors. There is currently no automated test suite or production build command.

The site uses GitHub Pages. Confirm the publishing source in the repository's **Settings → Pages** before changing deployment behavior; those account settings are not represented in this clone. Preserve `CNAME` when introducing any future build output.

Kevin confirmed on October 7, 2026 that Pages uses **Deploy from a branch → main → /(root)**. Commit changes, push the feature branch, and merge a pull request into `main`; GitHub Pages then publishes the updated remote branch. A merge performed only on this Mac needs a subsequent push to `origin/main`. Check the Pages workflow in **Actions** after merging. The public GitHub API also confirms Pages is enabled and `main` is the default branch. See [GitHub’s publishing-source guide](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

Keep private career notes and application materials outside this public repository.

## Current local draft

The October 2026 draft is a single complete landing page with selected work, four first-author publications, a personal introduction, and contact links. Plain CSS replaces the old Bootstrap and Font Awesome dependencies, and system fonts avoid a remote font dependency. Existing Google Analytics is retained for the public hostname.

The two new SVGs are original conceptual illustrations, not dataset results or software screenshots. Kevin confirmed marketing permission for wide sharing of the supplied colorectal carcinoma image on October 5, 2026. Record the final source/credit with the image exports. Kevin explicitly selected the Singular-labelled résumé PDF for the public résumé link.

The October copy review is applied, including Kevin’s revised descriptions, communication specialty, personal text, and the agreed publication/scope wording. The October 6 layout uses two edge-to-edge microscopy banners at the same displayed height. On phones, the portrait is centered horizontally and vertically inside the opening banner; on larger screens it sits beside the introduction. The selected-work introduction sits to the left below the second banner. The first project’s diagram appears left of its text on larger screens and above it on phones. The conceptual diagrams reflect the reviewed workflow and regulator-to-gene relationships.

The final polish adds periods to every page heading and a short, horizontal RNAseq connector centered on the matrix, stopping before the first module’s dotted boundary. No validation was repeated for these minor edits, at Kevin’s request.

### Image exports

The supplied `images/masters/hd_colorectal_carcinoma.png` is an 18,415×15,184-pixel, approximately 494 MB master. The new headshot, `images/masters/hd_kevinrychelpenn_dec2025_headshot.jpg`, is 9,000×5,803 pixels. Both remain local and are excluded from Git and the phone preview. They are not page assets. Each export is written into `images/<family>/<family>-<width>.<extension>`.

The page uses AVIF with JPEG fallbacks and responsive image sizes. Each of the two microscopy banners has separate desktop and mobile crop families: a wide opening view of mixed orange, blue, and yellow tissue, and a lower-right view with cyan tissue at the left edge and pink cells among the orange and blue structures. Desktop crops are approximately 6:1 and mobile crops are 2:1. The second banner loads lazily. Cropping, resizing, and compression preserve the supplied image content; no detail is generated or retouched. Exports use sRGB and omit the source EXIF/GPS metadata. Unused square tissue crops and superseded low-resolution source JPEGs have been removed; the active JPEG fallbacks remain.

To reproduce exports on this Mac with the installed Swift command-line tools (Apple Swift 6.3.3) and native AVIF encoder:

```sh
swift scripts/export_images.swift
```

To regenerate only microscopy exports, add `--microscopy-only`. To regenerate one image family, use `--family`, for example:

```sh
swift scripts/export_images.swift --microscopy-only
swift scripts/export_images.swift --family crc-work-banner
```

This optional preparation step is macOS-specific, has no package dependencies, and is not part of a website build or deployment. Other contributors can use the checked-in exports without these tools. The script records crop coordinates in original pixels measured from the top left; originals are never overwritten. Export heights are rounded to even pixels for AVIF encoder/browser compatibility.

| Asset family | Export widths | AVIF file sizes |
| --- | --- | --- |
| Opening banner (`crc-banner`) | 800, 1600, 2400 | 39, 112, 196 KB |
| Opening mobile crop (`crc-banner-mobile`) | 640, 1280 | 67, 185 KB |
| Selected-work banner (`crc-work-banner`) | 800, 1600, 2400 | 57, 172, 302 KB |
| Selected-work mobile crop (`crc-work-banner-mobile`) | 640, 1280 | 105, 314 KB |
| Portrait, square (`kevin-portrait`) | 400, 800, 1200 | 14, 56, 131 KB |

Keep master files out of deployment assets if introducing a build or packaging step later.

Legacy assets are retained in the tracked `archive/` folder. The old homepage remains recoverable from Git history. Responsive images now live in family folders under `images/`; page references, the sharing-image URL, the exporter, and the preview allowlist use those paths. At Kevin’s request, the teaching PDFs are archived and their former root URLs will be retired when this cleanup is deployed; archived images likewise move to new paths. Existing `#about`, `#phd`, and `#personal` anchors still resolve. This reorganization does not change the GitHub Pages publishing configuration. The archive is excluded from the phone preview; it remains part of the root publishing source unless a deployment exclusion is configured.

### Draft verification — October 5, 2026

- Headless Chrome: 1440×1000, 390×844, and 320×740 layouts inspected with screenshots; no horizontal overflow, missing images, console errors, or failed local asset requests.
- All page links traversed with Tab: visible focus and automatic scrolling at each viewport. Anchor targets and accessible link names checked. Reduced motion disables smooth scrolling.
- Main text and accent contrast exceeds 9:1 against the page background. Image alt text and dimensions are present.
- The public résumé is byte-for-byte identical to Kevin’s selected PDF. Custom domain, favicon, and teaching PDFs are preserved.
- Direct link checks: Bitesize Bio, Scholar, GitHub, iModulonDB, Cell Reports, and Nature respond successfully. The Oxford publication DOIs resolve to the expected publisher paths, whose pages block automated requests; LinkedIn also blocks automated requests. The SelectScience webinar page was read successfully.
- `git diff --check` passes. No build exists or is needed. Actual iPhone/Safari testing remains for a later pass.

These are manual/source and browser checks for this draft, not a checked-in automated test suite.

### Copy/layout revision verification — October 5, 2026

- Headless Chrome: desktop 1440×1000, tablet 820×1180, and phones 390×844 and 320×740, including Retina image selection. Screenshots inspected; no horizontal overflow, broken assets/anchors, console errors, or failed local requests.
- All links show visible keyboard focus and scroll into view. Reduced-motion preference is honored. Mobile portrait overlap and both SVG layouts inspected.
- All 11 AVIF variants decode with opaque pixels and expected image content; JPEG fallbacks are present. The opening banner and portrait transfer approximately 112 KB on the tested desktop and 162 KB on the tested 390px Retina phone; the detail crop loads lazily.
- LAN preview serves all 33 public files, handles concurrent requests alongside an idle browser connection, and excludes both masters, Markdown notes, Git files, and private paths.
- Local asset paths, image descriptions/dimensions, anchor targets, Python/JSON/SVG syntax, and `git diff --check` pass. The résumé still matches the approved source byte for byte; domain, favicon, existing links, and teaching PDFs remain intact.

The revised page still needs Kevin’s visual review on his actual iPhone/Safari. Outbound destinations are unchanged from the earlier draft check. No public deployment was performed.

### Banner/layout revision verification — October 6, 2026

- Headless Chrome: 320×740, 375×667, 390×844, 430×932, 820×1180, and 1440×1000. No horizontal overflow, broken images/anchors, console errors, or failed local requests; keyboard focus remains visible and scrolls into view.
- Both banner image bands have equal heights at every viewport. Phone portraits are fully contained and vertically centered; specialty pairs remain intact. Story 1’s diagram appears left on larger screens and above its text on phones. The revised SVG has an aligned arc arrow and seven peripheral genes in iModulon 2.
- All 16 AVIF variants decode with opaque image content. The restarted LAN preview serves all 43 allowlisted public files with the expected content and excludes Markdown, Git, private paths, and both masters.
- The contact button fits within the tested 390×844 and 430×932 viewports even allowing 100px for browser bars. The shorter/narrower 375×667 and 320×740 layouts may need a little scrolling with browser bars visible. Actual iPhone/Safari review is still needed.
- HTML structure, image descriptions/dimensions, local asset paths, anchors, SVG/Python syntax, and `git diff --check` pass. Page copy and outbound destinations are unchanged. No public deployment was performed.
