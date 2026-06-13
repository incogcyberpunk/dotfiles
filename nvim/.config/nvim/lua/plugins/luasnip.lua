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
  end,
}
