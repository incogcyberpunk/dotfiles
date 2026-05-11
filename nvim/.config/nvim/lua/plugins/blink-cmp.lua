return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'default',
      ['<C-h>'] = { 'snippet_backward', 'fallback' },
      ['<C-l>'] = { 'snippet_forward', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = { auto_show = false },
      ghost_text = { enabled = true }
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },
  signature = {
    enabled = true,
    window = {
      show_documentation = false,
    }
  }
}
