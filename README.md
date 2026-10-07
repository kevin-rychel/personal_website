# KevinRychel.com
This is the source code for KevinRychel.com, Kevin Rychel-Penn’s professional portfolio in computational biology, spatial biology, multi-omics, quantitative imaging, and scientific software.

Visit the site at [KevinRychel.com](https://www.kevinrychel.com)

## Local development

This is a static HTML/CSS site. No Node installation, package manager, or build step is required. The page works without JavaScript; the small analytics script runs only on the existing public domain.

From the repository root, start a local server:

```sh
python3 -m http.server 8000 --bind 127.0.0.1
```

Open <http://127.0.0.1:8000> in your browser. Refresh after saving changes, and press Control+C in the terminal to stop the server. This previews the page; it does not reproduce GitHub Pages processing or verify deployment settings.

In current VS Code, **Command Palette → Browser: Open Integrated Browser** can display the same address beside the code. A desktop browser also works.

### iPhone preview over Wi-Fi

In VS Code, use **Terminal → Run Task → Preview on iPhone**, or run:

```sh
python3 scripts/preview_phone.py
```

The script uses the Mac’s current Wi-Fi IPv4 address on `en0` and prints a URL such as `http://192.168.1.69:8001/`. Open that exact URL in Safari on an iPhone connected to the same Wi-Fi. Keep the Mac awake and the terminal running. This uses the existing Python installation and Safari; no app or additional dependency is required.

The preview serves a temporary copy of an explicit list of public assets. It excludes Git files, Markdown notes, private sibling folders, and both full-resolution image masters. Saved HTML/CSS changes appear when you refresh Safari; there is no automatic browser reload. Editing `COPY_REVIEW.md` still requires applying those edits to the HTML first. Add future web assets to `PUBLIC_FILES` in the script, then restart the preview to load that list. Control+C stops the server and removes the temporary copy. The server handles concurrent browser connections and replaces copied assets atomically.

If address detection fails or Wi-Fi uses a different interface, find the Mac’s address in **System Settings → Wi-Fi → Details → TCP/IP**, then run:

```sh
python3 scripts/preview_phone.py --bind YOUR_LAN_IP
```

The existing desktop preview on port 8000 can stay running. `127.0.0.1` is local to each device, so use the printed LAN address for the phone. If Safari cannot connect, check that both devices are on the same non-guest Wi-Fi, accept a macOS incoming-network prompt if shown, and check whether a VPN or firewall blocks local connections. If port 8001 is occupied, pass `--port 8002`.

## Project structure

- `index.html`: semantic page markup and curated publication links.
- `styles.css`: responsive layouts, shared design tokens, and focus styles.
- `analytics.js`: existing Google Analytics ID, disabled on local previews.
- `new_images/`: responsive microscopy crops and portrait exports, plus preserved small originals. Full-resolution masters are local and excluded from Git.
- `images/`: original conceptual SVGs and preserved legacy research assets.
- `resume.pdf`: the public résumé selected by Kevin; private source files remain outside this repository.
- `favicon.svg` and `favicon.ico`: cyan DNA helix on a dark circular background, with vector and 16/32/48px fallback versions. The original icon is preserved in `images/favicon-original.ico` for the later archive pass.
- The two teaching PDFs retain their existing assets and URLs.
- `CNAME`: existing custom domain, `kevinrychel.com`.
- `AGENTS.md`: instructions for working with Codex in this repository.
- `COPY_REVIEW.md`: editable snapshot of page copy, link labels, captions, and layout notes. Changes are applied manually to the HTML in a later review pass.
- `scripts/preview_phone.py` and `.vscode/tasks.json`: public-asset Wi-Fi preview and its VS Code task, using Python’s standard library.
- `scripts/export_images.swift`: optional macOS image-export utility; the website serves the already-exported assets without running it.
- `scripts/export_favicon.swift`: optional native macOS exporter for the matching SVG/ICO favicon. Run `swift scripts/export_favicon.swift` from the repository root; no website build step is needed.

## Validation and publishing

Before publishing, check the page at mobile and desktop widths, navigate links and controls with the keyboard, and verify local assets and outbound links. Run `git diff --check` for whitespace errors. There is currently no automated test suite or production build command.

The site uses GitHub Pages. Confirm the publishing source in the repository's **Settings → Pages** before changing deployment behavior; those account settings are not represented in this clone. Preserve `CNAME` when introducing any future build output.

Keep private career notes and application materials outside this public repository.

## Current local draft

The October 2026 draft is a single complete landing page with selected work, four first-author publications, a personal introduction, and contact links. Plain CSS replaces the old Bootstrap and Font Awesome dependencies, and system fonts avoid a remote font dependency. Existing Google Analytics is retained for the public hostname.

The two new SVGs are original conceptual illustrations, not dataset results or software screenshots. Kevin confirmed marketing permission for wide sharing of the supplied colorectal carcinoma image on October 5, 2026. Record the final source/credit with the image exports. Kevin explicitly selected the Singular-labelled résumé PDF for the public résumé link.

The October copy review is applied, including Kevin’s revised descriptions, communication specialty, personal text, and the agreed publication/scope wording. The October 6 layout uses two edge-to-edge microscopy banners at the same displayed height. On phones, the portrait is centered horizontally and vertically inside the opening banner; on larger screens it sits beside the introduction. The selected-work introduction sits to the left below the second banner. The first project’s diagram appears left of its text on larger screens and above it on phones. The conceptual diagrams reflect the reviewed workflow and regulator-to-gene relationships.

The final polish adds periods to every page heading and a short, horizontal RNAseq connector centered on the matrix, stopping before the first module’s dotted boundary. No validation was repeated for these minor edits, at Kevin’s request.

### Image exports

The supplied `new_images/hd_colorectal_carcinoma.png` is an 18,415×15,184-pixel, approximately 494 MB master. The new headshot, `new_images/hd_kevinrychelpenn_dec2025_headshot.jpg`, is 9,000×5,803 pixels. Both remain local and are excluded from Git and the phone preview. They are not page assets.

The page uses AVIF with JPEG fallbacks and responsive image sizes. Each of the two microscopy banners has separate desktop and mobile crop families: a wide opening view of mixed orange, blue, and yellow tissue, and a lower-right view with cyan tissue at the left edge and pink cells among the orange and blue structures. Desktop crops are approximately 6:1 and mobile crops are 2:1. The second banner loads lazily. Cropping, resizing, and compression preserve the supplied image content; no detail is generated or retouched. Exports use sRGB and omit the source EXIF/GPS metadata. The previous square tissue-detail exports remain preserved but are no longer used on the page.

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

Legacy assets are retained during review. The old homepage remains recoverable from Git history; no publicly browsable archive is needed. Existing `#about`, `#phd`, and `#personal` anchors still resolve.

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
