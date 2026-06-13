return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  config = function()
    -- Load the friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
    -- Load custom snippets
    require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/snippets' }

    -- Extend filetypes
    require('luasnip').filetype_extend('javascriptreact', { 'javascript' })
    require('luasnip').filetype_extend('typescriptreact', { 'typescript', 'javascript' })
    require('luasnip').filetype_extend('typescript', { 'javascript' })
    require('luasnip').filetype_extend('javascript', { 'typescript' })

    -- Use <C-o> to use select_choice to choose between choices in a snippet
    vim.keymap.set({ 'i', 's' }, '<C-o>', function()
      require 'luasnip.extras.select_choice'()
    end)
  end,
}
