# Config backup — 2026-07-09 15:34 (pre wallpaper-theming changes)

Backup of every config file modified while wiring kitty + vim to follow the
noctalia (Material 3 monochrome) wallpaper palette. Each file below is the
ORIGINAL, pre-change version.

| Backup file                    | Restore to                                        |
|--------------------------------|---------------------------------------------------|
| kitty.conf                     | ~/.config/kitty/kitty.conf                         |
| colors.conf                    | ~/.config/kitty/colors.conf                        |
| config.toml                    | ~/.config/matugen/config.toml                      |
| kitty-colors.conf.tmpl         | ~/.config/matugen/templates/kitty-colors.conf      |
| my_configs.vim                 | ~/.vim_runtime/my_configs.vim                      |
| user-templates.toml            | ~/.config/noctalia/user-templates.toml             |

(kitty.conf.after-matugen-edit is an INTERMEDIATE state, not the original — ignore it.)

## Full restore (undo everything)

```sh
BK="$HOME/.config/matugen/_backups_20260709_153422"
cp "$BK/kitty.conf"            ~/.config/kitty/kitty.conf
cp "$BK/colors.conf"           ~/.config/kitty/colors.conf
cp "$BK/config.toml"           ~/.config/matugen/config.toml
cp "$BK/kitty-colors.conf.tmpl" ~/.config/matugen/templates/kitty-colors.conf
cp "$BK/my_configs.vim"        ~/.vim_runtime/my_configs.vim
cp "$BK/user-templates.toml"   ~/.config/noctalia/user-templates.toml

# Remove the files added by the change (no originals existed):
rm -f ~/.config/noctalia/templates/vim-m3.vim
rm -f ~/.vim_runtime/wallpaper_colors.vim
rm -f ~/.config/kitty/themes/noctalia.conf
rm -f ~/.config/kitty/current-theme.conf   # symlink

pkill -USR1 kitty 2>/dev/null   # reload kitty
```

Then, if you enabled them, turn OFF the "Kitty" and "User theming" toggles in
noctalia Settings → Color Scheme → Templates.
