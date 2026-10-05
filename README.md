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

For a future phone preview, serve a temporary copy containing only publishable site files, bind to the Mac’s LAN address, and open that address from the phone on the same Wi-Fi. `127.0.0.1` is local to each device. Do not serve the parent private career folder.

## Project structure

- `index.html`: semantic page markup and curated publication links.
- `styles.css`: responsive layouts, shared design tokens, and focus styles.
- `analytics.js`: existing Google Analytics ID, disabled on local previews.
- `new_images/`: supplied portrait and microscopy image.
- `images/`: original conceptual SVGs and preserved legacy research assets.
- `resume.pdf`: the public résumé selected by Kevin; private source files remain outside this repository.
- `favicon.ico` and the two teaching PDFs: preserved existing assets and URLs.
- `CNAME`: existing custom domain, `kevinrychel.com`.
- `AGENTS.md`: instructions for working with Codex in this repository.

## Validation and publishing

Before publishing, check the page at mobile and desktop widths, navigate links and controls with the keyboard, and verify local assets and outbound links. Run `git diff --check` for whitespace errors. There is currently no automated test suite or production build command.

The site uses GitHub Pages. Confirm the publishing source in the repository's **Settings → Pages** before changing deployment behavior; those account settings are not represented in this clone. Preserve `CNAME` when introducing any future build output.

Keep private career notes and application materials outside this public repository.

## Current local draft

The October 2026 draft is a single complete landing page with selected work, four first-author publications, a personal introduction, and contact links. Plain CSS replaces the old Bootstrap and Font Awesome dependencies, and system fonts avoid a remote font dependency. Existing Google Analytics is retained for the public hostname.

The two new SVGs are original conceptual illustrations, not dataset results or software screenshots. The supplied colorectal carcinoma image is approved for **local prototyping**; confirm reuse permission, credit, and a higher-resolution source before publishing it. Kevin explicitly selected the Singular-labelled résumé PDF for the public résumé link.

Legacy assets are retained during review. The old homepage remains recoverable from Git history; no publicly browsable archive is needed. Existing `#about`, `#phd`, and `#personal` anchors still resolve.

### Draft verification — October 5, 2026

- Headless Chrome: 1440×1000, 390×844, and 320×740 layouts inspected with screenshots; no horizontal overflow, missing images, console errors, or failed local asset requests.
- All page links traversed with Tab: visible focus and automatic scrolling at each viewport. Anchor targets and accessible link names checked. Reduced motion disables smooth scrolling.
- Main text and accent contrast exceeds 9:1 against the page background. Image alt text and dimensions are present.
- The public résumé is byte-for-byte identical to Kevin’s selected PDF. Custom domain, favicon, and teaching PDFs are preserved.
- Direct link checks: Bitesize Bio, Scholar, GitHub, iModulonDB, Cell Reports, and Nature respond successfully. The Oxford publication DOIs resolve to the expected publisher paths, whose pages block automated requests; LinkedIn also blocks automated requests. The SelectScience webinar page was read successfully.
- `git diff --check` passes. No build exists or is needed. Actual iPhone/Safari testing remains for a later pass.

These are manual/source and browser checks for this draft, not a checked-in automated test suite.
