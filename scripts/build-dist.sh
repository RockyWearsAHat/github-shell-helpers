#!/usr/bin/env bash

# Build script to assemble distributable artifacts for github-shell-helpers.
#
# Currently this just copies the standalone installer into dist/ so it can
# be uploaded as a release asset or CI artifact.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DIST_DIR="${SCRIPT_DIR}/dist"

mkdir -p "$DIST_DIR"

cp "${SCRIPT_DIR}/Git-Shell-Helpers-Installer.sh" "${DIST_DIR}/Git-Shell-Helpers-Installer.sh"
chmod +x "${DIST_DIR}/Git-Shell-Helpers-Installer.sh"

echo "[build-dist] Wrote dist/Git-Shell-Helpers-Installer.sh"
