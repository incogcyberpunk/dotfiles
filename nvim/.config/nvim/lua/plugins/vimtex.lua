return {
  'lervag/vimtex',
  ft = 'tex', -- load when a .tex file is opened
  init = function()
    vim.g.vimtex_view_method = 'sioyek'
  end,
}
