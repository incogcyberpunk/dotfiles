return {
  'lervag/vimtex',
  lazy = true, -- we don't want to lazy load VimTeX
  ft = 'tex',  -- load when a .tex file is opened
  init = function()
    vim.g.vimtex_view_method = 'sioyek'
  end,
}
