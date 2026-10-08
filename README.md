# KevinRychel.com

Source code for [KevinRychel.com](https://kevinrychel.com/), Kevin Rychel-Penn’s professional portfolio in computational biology, spatial biology, multi-omics, quantitative imaging, and scientific software. The landing page presents selected work, publications, a short bio, and professional links.

This is a static HTML/CSS site with system fonts and original SVG illustrations. No Node installation, package manager, or build step is required. The page works without JavaScript; Google Analytics runs only on the public hostname.

## Local preview

From the repository root, run:

```sh
python3 scripts/preview_phone.py
```

Alternatively, in VS Code choose **Terminal → Run Task → Preview on iPhone**. Open the printed URL on the Mac or in Safari on an iPhone connected to the same Wi-Fi. Keep the Mac awake and the terminal running, refresh after saving edits, and stop with Control+C.

For a Mac-only preview:

```sh
python3 scripts/preview_phone.py --bind 127.0.0.1
```

Open <http://127.0.0.1:8001/>. The preview serves an explicit list of website assets; add new assets to `PUBLIC_FILES` in the script and restart it. It excludes notes, archived assets, Git files, and local image masters, and does not reproduce GitHub Pages processing.

## Project structure

| Path | Purpose |
| --- | --- |
| `index.html`, `styles.css` | Page content, responsive layouts, and shared styles. |
| `analytics.js` | Analytics configuration, disabled on local previews. |
| `images/` | Conceptual SVG illustrations and responsive AVIF/JPEG exports, grouped by image family. |
| `images/masters/` | Local image originals, ignored by Git and excluded from preview. |
| `resume.pdf`, `favicon.svg`, `favicon.ico` | Public résumé and site icons. |
| `CNAME` | Custom domain configuration for `kevinrychel.com`. |
| `scripts/`, `.vscode/tasks.json` | Preview tools and optional macOS image/favicon exporters. |
| `notes/` | [Copy review](notes/COPY_REVIEW.md), [future design ideas](notes/Redesign_ideas.md), and [maintenance details](notes/MAINTENANCE.md). |
| `archive/` | Historical assets; see the [archive guide](archive/README.md). |
| `AGENTS.md` | Repository instructions for coding agents. |

## Validation and deployment

Before publishing:

- Review mobile and desktop layouts.
- Check keyboard navigation, visible focus, contrast, and image alt text.
- Verify local assets, anchor targets, and outbound links.
- Run `git diff --check`.

There is no automated test suite or production build command.

GitHub Pages publishes from `main` at the repository root. Work on a focused branch, push it, and merge a pull request into `main` to publish. Check the Pages workflow in **Actions** after merging. Preserve `CNAME`, and review **Settings → Pages** before changing deployment behavior.

## Maintenance notes

See [notes/MAINTENANCE.md](notes/MAINTENANCE.md) for preview troubleshooting, image-export commands, and asset conventions. Copy-review edits are applied manually to `index.html`.

Keep private career notes, application materials, and proprietary content outside this public repository. Files in `notes/` and `archive/` remain public on GitHub even though the local preview excludes them.
