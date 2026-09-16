# Arch Linux + Hyprland dotfiles

My compact Hyprland desktop configuration for Arch Linux. It includes a dark
Waybar theme, a translucent Kitty terminal, keyboard-driven window management,
screenshots, media controls, and a small Neovim setup.

![Bundled wallpaper](hypr/wallpaper.png)

## Included configuration

- **Hyprland** — dwindle layout, animations, gaps, US/RU keyboard layouts, and
  laptop media/brightness shortcuts
- **Hyprpaper** — bundled 4K wallpaper with a user-independent path
- **Waybar** — workspaces, three-part clock, audio, memory, CPU, battery, disk,
  and tray modules
- **Kitty** — transparency and background blur
- **Neovim** — Packer, Oil, Mini Pick, Fugitive, color highlighting, and Pyright
- `packages.txt` — the minimal Arch package set required by these dotfiles

## Install

These commands are intended for Arch Linux. Review them before running, and
back up your existing dotfiles first.

### 1. Clone the repository

```bash
sudo pacman -S --needed git
git clone https://github.com/UraniumSlashBroomer/arch-config.git ~/.dotfiles
```

### 2. Install the desktop dependencies

All required packages are available from the official Arch repositories:

```bash
sudo pacman -S --needed - < ~/.dotfiles/packages.txt
```

Packer is needed by the Neovim configuration:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 3. Link the dotfiles

```bash
mkdir -p ~/.config

for directory in hypr kitty nvim waybar; do
  target="$HOME/.config/$directory"
  if [ -e "$target" ] || [ -L "$target" ]; then
    mv "$target" "$target.backup.$(date +%s)"
  fi
  ln -s "$HOME/.dotfiles/$directory" "$target"
done
```

Open Neovim and install its plugins:

```vim
:PackerSync
```

Log out and start a Hyprland session. If Hyprland is already running, reload it
with `hyprctl reload`; Waybar and Hyprpaper are started automatically on the
next session.

The monitor rule uses preferred resolution and automatic placement, so the
configuration works without a machine-specific output name. For a custom
multi-monitor layout, edit the `monitor` rule in `hypr/hyprland.conf`.

## Main key bindings

The main modifier is <kbd>Alt</kbd>.

| Shortcut | Action |
| --- | --- |
| <kbd>Alt</kbd> + <kbd>Enter</kbd> | Open Kitty |
| <kbd>Alt</kbd> + <kbd>D</kbd> | Open Wofi |
| <kbd>Alt</kbd> + <kbd>E</kbd> | Open Dolphin |
| <kbd>Alt</kbd> + <kbd>Q</kbd> | Close the active window |
| <kbd>Alt</kbd> + <kbd>F</kbd> | Toggle fullscreen |
| <kbd>Alt</kbd> + <kbd>V</kbd> | Toggle floating mode |
| <kbd>Alt</kbd> + <kbd>1–0</kbd> | Switch workspace |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>1–0</kbd> | Move window to workspace |
| <kbd>Alt</kbd> + <kbd>Print</kbd> | Copy an output screenshot |
| <kbd>Alt</kbd> + <kbd>P</kbd> | Copy a region screenshot |
| <kbd>Alt</kbd> + <kbd>L</kbd> | Mute audio and lock the session |

## Notes

- The Waybar style expects Hack and Font Awesome glyphs.
- `packages.txt` intentionally contains only packages used by this setup.
- The bundled wallpaper is intentionally stored next to `hyprpaper.conf`, and
  Hyprpaper loads it from `~/.config/hypr/wallpaper.png`.

## License

Configuration files are released under the [MIT License](LICENSE). The bundled
wallpaper is not covered by that license; verify that you have the right to
redistribute it before publishing a fork.
