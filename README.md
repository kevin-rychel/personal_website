# KevinRychel.com
This is the source code for KevinRychel.com, a website I designed and implemented for sharing my professional experience as a systems biologist and data scientist.

Visit the site at [KevinRychel.com](https://www.kevinrychel.com)

## Local development

This is currently a static HTML site. No Node installation, package manager, or build step is required.

From the repository root, start a local server:

```sh
python3 -m http.server 8000 --bind 127.0.0.1
```

Open <http://127.0.0.1:8000> in your browser. Refresh after saving changes, and press Control+C in the terminal to stop the server. This previews the page; it does not reproduce GitHub Pages processing or verify deployment settings.

## Project structure

- `index.html`: page markup, inline styling, and external CDN dependencies.
- `images/` and `favicon.ico`: website assets.
- `CNAME`: existing custom domain, `kevinrychel.com`.
- `AGENTS.md`: instructions for working with Codex in this repository.

## Validation and publishing

Before publishing, check the page at mobile and desktop widths, navigate links and controls with the keyboard, and verify local assets and outbound links. Run `git diff --check` for whitespace errors. There is currently no automated test suite or production build command.

The site uses GitHub Pages. Confirm the publishing source in the repository's **Settings → Pages** before changing deployment behavior; those account settings are not represented in this clone. Preserve `CNAME` when introducing any future build output.

Keep private career notes and application materials outside this public repository.
