#!/usr/bin/env python3
"""Preview the site's public assets on the local network, without dependencies."""

import argparse
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
from urllib.parse import unquote, urlsplit


ROOT = Path(__file__).resolve().parents[1]
# Add new publishable assets explicitly as the site grows.
PUBLIC_FILES = frozenset({
    "index.html",
    "styles.css",
    "analytics.js",
    "favicon.ico",
    "favicon.svg",
    "resume.pdf",
    "new_images/colorectal_carcinoma.jpeg",
    "new_images/kevin_headshot.jpeg",
    "images/workflow-overview.svg",
    "images/regulatory-modules.svg",
    "Rychel_Kevin_Student_IA_Evaluation_WI20.pdf",
    "Rychel_Kevin_Student_IA_Evaluation_WI21.pdf",
    *{
        "new_images/{}-{}.{}".format(family, width, suffix)
        for family, widths in (
            ("crc-banner", (800, 1600, 2400)),
            ("crc-banner-mobile", (640, 1280)),
            ("crc-work-banner", (800, 1600, 2400)),
            ("crc-work-banner-mobile", (640, 1280)),
            ("crc-detail", (480, 960, 1440)),
            ("kevin-portrait", (400, 800, 1200)),
        )
        for width in widths
        for suffix in ("avif", "jpg")
    },
})


def copy_public_file(name, destination):
    source = ROOT / name
    if source.is_symlink() or not source.resolve().is_relative_to(ROOT):
        raise ValueError("Preview assets must be regular files within the repository.")
    target = destination / name
    target.parent.mkdir(parents=True, exist_ok=True)
    # Atomic replacement keeps concurrent browser requests from seeing partial files.
    with tempfile.NamedTemporaryFile(dir=target.parent, delete=False) as staged:
        staged_name = staged.name
    try:
        shutil.copyfile(source, staged_name)
        os.replace(staged_name, target)
    finally:
        if os.path.exists(staged_name):
            os.unlink(staged_name)


class PreviewHandler(SimpleHTTPRequestHandler):
    extensions_map = {**SimpleHTTPRequestHandler.extensions_map, ".avif": "image/avif"}

    def send_head(self):
        name = unquote(urlsplit(self.path).path)
        if name == "/":
            name = "/index.html"
        if name not in {"/" + item for item in PUBLIC_FILES}:
            self.send_error(404, "This file is not part of the public preview.")
            return None
        try:
            # Refresh just this public file before serving; saved edits appear on reload.
            copy_public_file(name[1:], Path(self.directory))
        except (OSError, ValueError):
            self.send_error(404, "Preview asset is unavailable.")
            return None
        self.path = name
        return super().send_head()

    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()


def wifi_address():
    try:
        address = subprocess.check_output(
            ["/usr/sbin/ipconfig", "getifaddr", "en0"],
            text=True, stderr=subprocess.DEVNULL,
        ).strip()
    except (OSError, subprocess.CalledProcessError):
        address = ""
    if not address:
        raise ValueError("Cannot find Wi-Fi address; pass --bind YOUR_LAN_IP explicitly.")
    return address


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bind", help="LAN IPv4 address (default: Mac en0 Wi-Fi address)")
    parser.add_argument("--port", type=int, default=8001)
    args = parser.parse_args()
    try:
        address = args.bind or wifi_address()
        with tempfile.TemporaryDirectory(prefix="kevin-phone-preview-") as directory:
            destination = Path(directory)
            for name in PUBLIC_FILES:
                copy_public_file(name, destination)
            handler = partial(PreviewHandler, directory=directory)
            with ThreadingHTTPServer((address, args.port), handler) as server:
                print("Open in iPhone Safari on the same Wi-Fi:", flush=True)
                print("http://{}:{}/".format(address, args.port), flush=True)
                print("Refresh to see saved site edits. Stop with Control+C.", flush=True)
                try:
                    server.serve_forever()
                except KeyboardInterrupt:
                    print("\nPhone preview stopped.", flush=True)
    except (OSError, ValueError) as error:
        parser.exit(1, "Phone preview could not start: {}\n".format(error))


if __name__ == "__main__":
    main()
