#!/bin/bash
# One-shot extras install. Omarchy applies colors/templates itself; it does
# not run scripts shipped in a theme, so a fresh install needs this once.

set -euo pipefail

here=$(cd "$(dirname "$0")" && pwd)
"$here/screensaver/apply.sh"
exec "$here/fcitx5/apply.sh"
