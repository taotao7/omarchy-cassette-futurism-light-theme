#!/bin/bash
# Point fcitx5 at this theme's palette and keep it updated on later switches.
# Omarchy does not run scripts shipped in a theme, so this is the one command
# a fresh install needs. After that, the theme-set hook repaints fcitx5 from
# whatever palette is active, including the other Cassette Futurism variant.

set -euo pipefail

here=$(cd "$(dirname "$0")" && pwd)
root=$(cd "$here/.." && pwd)
hook_src="$here/cassette-futurism-fcitx5"
hook_dst="$HOME/.config/omarchy/hooks/theme-set.d/cassette-futurism-fcitx5"
font_src="$root/fonts/LXGWWenKai-Regular.ttf"
font_dst="$HOME/.local/share/fonts/LXGWWenKai-Regular.ttf"

if [[ -f $font_src ]]; then
  mkdir -p "$(dirname "$font_dst")"
  if [[ ! -f $font_dst ]] || ! cmp -s "$font_src" "$font_dst"; then
    cp "$font_src" "$font_dst"
    fc-cache -f "$(dirname "$font_dst")" >/dev/null 2>&1 || true
  fi
fi

mkdir -p "$(dirname "$hook_dst")"
if [[ ! -f $hook_dst ]] || ! cmp -s "$hook_src" "$hook_dst"; then
  omarchy hook install theme-set "$hook_src"
fi

# Earlier revisions of this skin installed a second hook under another name.
rm -f "$HOME/.config/omarchy/hooks/theme-set.d/omarchy-fcitx5-theme.hook"

exec python3 "$here/apply.py"
