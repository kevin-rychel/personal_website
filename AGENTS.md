# Kevin's professional website

## Purpose and first milestone

- Build a polished, responsive landing page presenting Kevin Rychel-Penn as a computational biologist and data scientist working across spatial biology, multi-omics, quantitative imaging, and scientific software.
- First release: professional identity, short bio, and key links. Add deeper case studies and interactive work incrementally.
- Keep public content accurate. Use public or sanitized project descriptions; do not publish proprietary code, customer data, internal documents, or unpublished collaborator findings.
- Private career handoffs and application materials live outside this repository in `../job_search`. Read those only when relevant; do not copy them here. Record private career decisions there.
- At the start of homepage/content work, read `../job_search/STATUS.md` and `../job_search/handoff_files/Kevin_Career_Resume_Website_Handoff_October_2026.md` for current decisions and source facts. These sibling files are not automatically loaded as repository instructions; request access if the session cannot read them.

## Current repository

- Static GitHub Pages site: `index.html`, `images/`, `favicon.ico`, and two linked teaching-evaluation PDFs.
- No package manager, lockfile, build step, or automated test suite exists yet.
- `CNAME` contains `kevinrychel.com`; preserve it and important existing links during updates.
- Existing HTML loads Bootstrap 5.3 alpha CSS/JS, Font Awesome, Google Fonts, and Google Analytics externally. Inspect usage before removing or replacing these dependencies.
- The GitHub Pages publishing source is an account setting and has not been verified from repository files. Do not assume that pushing a branch is safe from automatic deployment.

## Development workflow

- Check Git status before editing and preserve unrelated changes. Use focused branches and keep changes reviewable.
- Preview from the repository root with `python3 -m http.server 8000 --bind 127.0.0.1`; open `http://127.0.0.1:8000`. Stop with Control+C.
- Kevin approved HTML/CSS for the first landing page. The unfinished redesign on his work PC is optional; proceed with a fresh draft. Before adopting a framework later, explain how it supports the larger portfolio and preserves GitHub Pages compatibility.
- When tooling is added, use one package manager/lockfile, pin a supported runtime, and update this file and README with real commands.
- Validate mobile and desktop layouts, keyboard navigation, focus styles, contrast, image alt text, local assets, and outbound links. Run `git diff --check`. If a build is introduced, verify its production output as well.
- Report what was verified and any checks that could not run. Follow session authorization for publishing and external actions.
