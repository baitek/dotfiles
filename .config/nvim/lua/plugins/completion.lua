return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      keymap = { preset = 'default' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
          opencode_ask = { 'lsp', 'buffer' },
        },
        providers = {
          lsp = { fallbacks = {} },
        },
      },
    },
  },
}
