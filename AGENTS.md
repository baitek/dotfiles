# Repository Instructions

- This is a GNU Stow home-directory package, not an application. Repository paths mirror files under `$HOME`.
- From the repository root, deploy the package with `stow --target="$HOME" .`; edit the repository files rather than deployed symlink targets.
- There is no build system, automated test suite, lint configuration, formatter, code generator, or CI workflow in this repository.
- Shell startup is split between `.zshenv` (environment and editor setup) and `.zshrc` (Oh My Zsh, fzf, and automatic herdr attachment).
- `.config/sway/config` is the compositor entrypoint and includes every `.config/sway/conf.d/*.conf`; Sway startup changes may therefore live outside the main file.
- Voxtype spans `.config/voxtype/config.toml`, Sway bindings and modes, the user service, and Waybar status. Changes to its output or key handling should be checked across those files.
- Neovim starts at `.config/nvim/init.lua`; plugin declarations are under `.config/nvim/lua/plugins/`, and `lazy.nvim` is bootstrapped by `.config/nvim/lua/plugin.lua`.
- For focused validation, run `git diff --check`, `sh -n .config/sway/lockman.sh`, `bash -n .config/sway/status.sh`, `luac -p .config/nvim/init.lua .config/nvim/lua/*.lua .config/nvim/lua/plugins/*.lua`, and `jq empty .config/waybar/config.jsonc`.
- After deploying, validate Sway with `sway -C -c "$HOME/.config/sway/config"`; use `swaymsg reload`, `systemctl --user restart voxtype.service`, or `nvim --headless '+qa'` for the affected runtime.
