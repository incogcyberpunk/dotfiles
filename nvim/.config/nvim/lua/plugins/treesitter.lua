return { 
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  lazy = false,
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
