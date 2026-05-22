-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    cmd = 'Todo',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'catgoose/nvim-colorizer.lua',
    ft = { 'css', 'scss', 'html', 'javascript', 'typescript' ,'markdown'},
    opts = {
      parsers = {
        tailwind = {enable = true, lsp = true},
      }
    },
  },
}
