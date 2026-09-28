#!/bin/bash
# Install the cassette screensaver wrapper and keep it updated on later
# theme switches. Omarchy does not run scripts shipped in a theme, so this
# is the one extra command a fresh install needs (or run the theme-root
# apply.sh, which calls this).

set -euo pipefail

here=$(cd "$(dirname "$0")" && pwd)
wrapper_src="$here/omarchy-screensaver"
wrapper_dst="$HOME/.local/bin/omarchy-screensaver"
hook_src="$here/cassette-futurism-screensaver"
hook_dst="$HOME/.config/omarchy/hooks/theme-set.d/cassette-futurism-screensaver"
hypr="$HOME/.config/hypr/hyprland.lua"
marker="cassette-futurism screensaver PATH"

if [[ ! -f $wrapper_src ]]; then
  echo "Missing screensaver wrapper: $wrapper_src" >&2
  exit 1
fi

mkdir -p "$(dirname "$wrapper_dst")"
cp "$wrapper_src" "$wrapper_dst"
chmod 755 "$wrapper_dst"

mkdir -p "$(dirname "$hook_dst")"
if [[ ! -f $hook_dst ]] || ! cmp -s "$hook_src" "$hook_dst"; then
  omarchy hook install theme-set "$hook_src"
fi

if [[ -f $hypr ]] && ! grep -q "$marker" "$hypr" && ! grep -q 'home \.\. "/.local/bin"' "$hypr"; then
  cat >> "$hypr" <<'LUA'

-- [[ cassette-futurism screensaver PATH ]]
-- Let ~/.local/bin wrappers win for compositor-spawned processes.
do
  local home = os.getenv("HOME") or ""
  local omarchy = os.getenv("OMARCHY_PATH") or "/usr/share/omarchy"
  local rest = os.getenv("PATH") or "/usr/local/bin:/usr/bin"
  hl.env("PATH", table.concat({
    home .. "/.local/bin",
    omarchy .. "/bin",
    rest,
  }, ":"))
end
-- [[ /cassette-futurism screensaver PATH ]]
LUA
fi

if command -v hyprctl >/dev/null 2>&1; then
  hyprctl reload >/dev/null 2>&1 || true
fi
