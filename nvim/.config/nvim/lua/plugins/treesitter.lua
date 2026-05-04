return {
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  lazy = false,
  build = ':TSUpdate',
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
}
