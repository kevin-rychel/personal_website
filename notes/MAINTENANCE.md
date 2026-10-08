# Website maintenance

Reusable guidance for maintaining the static site. Start with the [README](../README.md) for preview, validation, and deployment.

## Preview troubleshooting

The preview uses port 8001 by default. Its printed LAN address can change after switching networks or routers; restart the script to detect the current address.

- If address detection fails, find the Mac’s address in **System Settings → Wi-Fi → Details → TCP/IP**, then run `python3 scripts/preview_phone.py --bind YOUR_LAN_IP`.
- If Safari cannot connect, check that both devices use the same non-guest Wi-Fi and that a VPN or firewall is not blocking local connections. Accept a macOS incoming-network prompt if shown.
- If the port is occupied, pass `--port 8002`.
- For Mac-only use, pass `--bind 127.0.0.1`. A localhost address cannot be opened from the phone.

There is no automatic browser reload. Refresh after saving site edits. When adding a web asset, update `PUBLIC_FILES` in `scripts/preview_phone.py` and restart the preview. Notes and local masters are deliberately excluded from that allowlist.

## Image exports

The checked-in exports are served directly by GitHub Pages. Regeneration is an optional preparation step requiring macOS, Swift command-line tools, native AVIF encoder support, and the local originals:

- `images/masters/hd_colorectal_carcinoma.png`
- `images/masters/hd_kevinrychelpenn_dec2025_headshot.jpg`

These masters are ignored by Git. Keep them out of deployment assets if introducing a build or packaging step.

Run from the repository root:

```sh
swift scripts/export_images.swift
```

To export only microscopy images or a single family:

```sh
swift scripts/export_images.swift --microscopy-only
swift scripts/export_images.swift --family crc-work-banner
```

Exports are written to `images/<family>/<family>-<width>.<extension>` as AVIF and JPEG variants. The exporter records crop coordinates in original pixels measured from the top left and never overwrites the originals. It crops, resizes, and compresses supplied content without generating or retouching detail. Exports use sRGB, omit source EXIF/GPS metadata, and use even pixel heights for AVIF compatibility.

| Image family | Composition | Export widths (px) |
| --- | --- | --- |
| `crc-banner` | Opening tissue banner, wide crop | 800, 1600, 2400 |
| `crc-banner-mobile` | Opening tissue banner, phone crop | 640, 1280 |
| `crc-work-banner` | Selected-work tissue banner, wide crop | 800, 1600, 2400 |
| `crc-work-banner-mobile` | Selected-work tissue banner, phone crop | 640, 1280 |
| `kevin-portrait` | Square portrait | 400, 800, 1200 |

Desktop tissue crops are approximately 6:1; phone crops are 2:1. When changing image paths or variants, update the HTML, sharing-image URL where applicable, exporter, and preview allowlist together. Check image loading and crop composition at mobile and desktop widths.

To regenerate the SVG and 16/32/48px ICO favicon variants:

```sh
swift scripts/export_favicon.swift
```

## Content and asset conventions

- Keep the DAWN/DUSK and iModulonDB SVGs labeled as conceptual illustrations.
- Marketing permission for wide sharing of the supplied colorectal carcinoma image is confirmed. Final source/credit documentation remains to be completed; record the confirmed attribution here when available.
- `resume.pdf` is the approved public résumé. Keep private source files outside the repository.
- `notes/COPY_REVIEW.md` is a review document; apply requested edits manually to `index.html`.
- Preserve the existing `#about`, `#phd`, and `#personal` anchors when updating page structure.
- Keep historical assets tracked in `archive/`; their former paths are documented in `archive/README.md`. The old homepage is recoverable from Git history.

The preview’s asset exclusions do not control GitHub Pages publication. In particular, the `archive/` directory remains part of the root publishing source unless a deployment exclusion is configured. Keep all tracked documentation suitable for public reading.

## Deferred maintenance

- Enhanced analytics measurement and résumé download tracking remain deferred.
- Use `https://kevinrychel.com/` as the canonical address. The optional `www` DNS configuration is left to Kevin; check its current status before changing it.
