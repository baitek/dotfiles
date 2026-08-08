# Neovim Setup Plan

This plan keeps the configuration small, uses Neovim 0.12's native APIs where
possible, and implements each stage independently so it can be reviewed and
tested before the next stage begins.

## Scope

- LSP support: Lua, Go, Python, and Bash.
- Treesitter support: parsers installed on demand when a filetype is opened.
- Completion: `blink.cmp`.
- OpenCode integration: Snacks, `blink.cmp`, and Lualine.
- Debugging: start with Python and Go only.
- Formatting and linting: deferred.
- Format-on-save: explicitly not enabled.
- Plugin-specific mappings stay in the corresponding plugin file.

## Stage 1: Treesitter

Add `nvim-treesitter/nvim-treesitter` as a non-lazy plugin with `:TSUpdate` as
its build step.

Neovim 0.12 uses the current Treesitter rewrite. Its current API does not have
the older `auto_install` option, so do not use the old `master` branch just to
obtain that option. Instead:

- Call the current `nvim-treesitter` setup API.
- Do not define an `ensure_installed` parser list.
- Add a small `FileType` hook that attempts to start Treesitter for the
  detected filetype.
- If the parser is missing, start an asynchronous parser installation for that
  language and start Treesitter after installation completes.
- Report unsupported languages or installation failures without breaking the
  buffer.
- Enable highlighting and Treesitter folding where a parser is available.

Target file:

`.config/nvim/lua/plugins/treesitter.lua`

Acceptance checks:

- Opening Lua, Go, Python, and Bash files installs or uses their parsers.
- Opening JSON and TOML files also installs or uses their parsers without a
  configuration change.
- A missing or unsupported parser produces a notification instead of a startup
  error.

## Stage 2: Native LSP and Mason

Add:

- `mason-org/mason.nvim`
- `neovim/nvim-lspconfig`
- `mason-org/mason-lspconfig.nvim`

Configure Mason to ensure only these servers:

- `lua_ls`
- `gopls`
- `pyright`
- `bashls`

Use the modern Neovim API:

- `vim.lsp.config()` for local configuration and overrides.
- `vim.lsp.enable()` for enabling servers.

Do not use the deprecated `require("lspconfig").server.setup()` pattern.

Use `mason-lspconfig` for package-name translation and controlled server
installation/enabling. Do not enable every server installed in Mason.

Add buffer-local mappings from `LspAttach` in `lsp.lua` for:

- Go to definition.
- Go to declaration.
- Go to references.
- Go to implementation.
- Hover documentation.
- Rename symbol.
- Code actions.
- Diagnostic navigation.
- LSP information.

Do not add formatting mappings in this stage.

Target file:

`.config/nvim/lua/plugins/lsp.lua`

Acceptance checks:

- `:Mason` opens and can install the four configured servers.
- `:checkhealth vim.lsp` reports healthy clients.
- Each supported language attaches its expected server in a real project.
- Existing non-LSP buffers continue to work without warnings.

## Stage 3: Completion and Statusline

Add:

- `saghen/blink.cmp`, pinned to the stable `1.*` release line.
- `nvim-lualine/lualine.nvim`.

Configure `blink.cmp` for normal LSP completion, paths, snippets, and buffer
words. Configure its LSP source for OpenCode's `opencode_ask` filetype as well.

Configure Lualine with the existing Tokyo Night theme and retain useful basic
components such as mode, branch, diagnostics, filename, filetype, LSP status,
and location. OpenCode's status component will be added during Stage 4.

Target files:

- `.config/nvim/lua/plugins/completion.lua`
- `.config/nvim/lua/plugins/ui.lua`

Acceptance checks:

- LSP completion works in Lua, Go, Python, and Bash buffers.
- Completion does not interfere with Snacks input or normal command-line use.
- The statusline displays correctly in normal buffers and existing special
  buffers such as Oil.

## Stage 4: OpenCode

Add `nickjvandyke/opencode.nvim`.

Integrate it with the existing Snacks configuration:

- Snacks input for asking questions.
- Snacks picker for selecting prompts and commands.
- Snacks terminal for starting or toggling `opencode --port`.

Integrate it with:

- `blink.cmp` for context and subagent completion in `opencode_ask`.
- Lualine using OpenCode's status component.

Keep all OpenCode mappings in `opencode.lua`. Use a dedicated `<leader>o...`
group, for example:

- `<leader>oa`: Ask OpenCode.
- `<leader>os`: Select an OpenCode action.
- `<leader>ot`: Toggle the OpenCode terminal.
- A visual-mode mapping to send the selected range.

Do not replace the existing OpenCode terminal workflow outside Neovim. The
plugin should connect to the existing executable or start its own server only
when needed.

Target file:

`.config/nvim/lua/plugins/opencode.lua`

Acceptance checks:

- Asking from normal mode includes the current context.
- Asking from visual mode includes the selected range.
- Context and subagent completion works in the Snacks prompt.
- OpenCode status appears in Lualine.
- Proposed edits can be reviewed, accepted, and rejected.
- External OpenCode edits reload in Neovim without losing the current workflow.

## Stage 5: Debugging

Start with Python and Go only. Lua and Bash debugging are not part of the first
debugger implementation because their adapter and launch behavior are less
uniform and there is no current requirement for them.

Add:

- `mfussenegger/nvim-dap`.
- `rcarriga/nvim-dap-ui`.
- `nvim-neotest/nvim-nio`.
- `jay-babu/mason-nvim-dap.nvim`.

Use Mason to manage:

- Python adapter: `debugpy`.
- Go adapter: `delve`.

Keep all debugger mappings and setup in `dap.lua`. Add a dedicated
`<leader>d...` group for:

- Toggle breakpoint.
- Continue.
- Step over.
- Step into.
- Step out.
- Stop or terminate.
- Toggle the DAP UI.
- Evaluate the expression under the cursor.

Open the DAP UI on attach or launch and close it on exit or termination.
Provide basic Python and Go launch configurations. Leave room for project
specific launch configurations rather than assuming one universal command.

Target file:

`.config/nvim/lua/plugins/dap.lua`

Acceptance checks:

- A Python program can be launched, paused, stepped, and inspected.
- A Go program can be launched, paused, stepped, and inspected.
- Breakpoints persist during a session and are visible in the DAP UI.
- Debugging does not affect startup when no adapter is installed.

## Stage 6: Formatting and Linting

Do not implement this stage initially.

When revisited later:

- Use manual formatting only unless explicitly requested otherwise.
- Do not add a format-on-save autocommand.
- Choose formatters and linters per language instead of enabling every Mason
  tool globally.

## File Organization

Expected plugin files after implementation:

- `.config/nvim/lua/plugins/treesitter.lua`
- `.config/nvim/lua/plugins/lsp.lua`
- `.config/nvim/lua/plugins/completion.lua`
- `.config/nvim/lua/plugins/opencode.lua`
- `.config/nvim/lua/plugins/dap.lua`

Lualine is added to the existing `.config/nvim/lua/plugins/ui.lua` because it
is general UI configuration. Its OpenCode-specific status component is wired
from `opencode.lua`.

`keys.lua` should remain limited to mappings that are not owned by a specific
plugin or feature.

## Validation

After each stage:

- Run `luac -p .config/nvim/init.lua .config/nvim/lua/*.lua .config/nvim/lua/plugins/*.lua`.
- Run `nvim --headless '+qa'`.
- Run `git diff --check`.
- Test the stage in a real project or representative configuration buffer.

After the full implementation:

- Run `:checkhealth vim.lsp`.
- Run `:checkhealth mason`.
- Run `:checkhealth opencode`.
- Verify the lazy lockfile contains the intended plugin versions.
- Deploy with `stow --target="$HOME" .` only after review.
