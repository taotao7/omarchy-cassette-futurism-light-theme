# Omarchy Cassette Futurism Light Theme

An [Omarchy](https://omarchy.org/) theme based on the Cassette Futurism palette —
**Analog Dream: Beige Terminal**: light vintage workstation colors with deep
retro accents. Dark variant: [omarchy-cassette-futurism-theme](https://github.com/taotao7/omarchy-cassette-futurism-theme).

![preview](preview.png)

## Install

```bash
omarchy theme install https://github.com/taotao7/omarchy-cassette-futurism-light-theme.git
~/.config/omarchy/themes/cassette-futurism-light/apply.sh
```

`omarchy theme install` already applies the desktop theme. Omarchy does not run scripts shipped in a theme, so `apply.sh` is the one extra command a fresh install needs. It:

- restyles the idle screensaver as a beige cassette (analog dream / A-SIDE) instead of the stock Omarchy logo, and installs a user wrapper so idle/launch actually use it
- installs LXGW WenKai from `fonts/` into `~/.local/share/fonts` (no extra package) and paints the fcitx5 candidate window from this palette: paper background, amber border, selection pill, 8px corners, WenKai UI
- installs `theme-set` hooks so later switches — including to the dark variant — keep both extras in sync

Running `apply.sh` from either Cassette Futurism checkout is enough. Preview the screensaver with `omarchy launch screensaver`.

You can also run the extras separately:

```bash
~/.config/omarchy/themes/cassette-futurism-light/screensaver/apply.sh
~/.config/omarchy/themes/cassette-futurism-light/fcitx5/apply.sh
```

## Palette

| Role | Color |
|------|-------|
| Background | `#f5f0e8` |
| Foreground | `#2d2a27` |
| Accent (retro orange) | `#d65d0e` |
| Selection | `#d4c8b8` |
| Red | `#9d0006` |
| Yellow | `#b57614` |
| Green | `#79740e` |
| Cyan | `#458588` |
| Blue | `#076678` |
| Purple | `#b16286` |

The theme ships `colors.toml` plus a retro-futurism artwork background,
and hand-tuned `btop.theme` and
`helix.toml`, plus a `shell.controls.toml` section override that keeps buttons and other controls visible (stronger fills, amber accent borders). `screensaver.toml` and `screensaver.txt` are the cassette art and analog ttfx palette; they only take effect after `apply.sh` (or `screensaver/apply.sh`) installs the user wrapper. `fcitx5/apply.sh` paints the fcitx5 candidate window from the same palette. Terminal, Hyprland, shell, and editor configs are generated
from the palette by Omarchy's templates.

## Attribution

Based on the palette and theme direction from
[cassette-futurism-theme](https://github.com/taotao7/cassette-futurism-theme),
ported for Zed from [cassette-futurism](https://github.com/taotao7/cassette-futurism).

Background artwork: [wallhaven k8jk76](https://wallhaven.cc/w/k8jk76).

LXGW WenKai (霞鹜文楷) is bundled under `fonts/` under the [SIL Open Font License 1.1](fonts/OFL.txt), from [lxgw/LxgwWenKai](https://github.com/lxgw/LxgwWenKai).

## License

MIT
