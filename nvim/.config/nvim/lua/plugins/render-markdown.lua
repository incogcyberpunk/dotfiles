return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  opts = {},
  config = function()
    require('render-markdown').setup {
      completions = { lsp = { enabled = true } },
      render_modes = { 'n', 'v', 't' },
      vim.keymap.set('n', '<leader>mt', '<cmd>RenderMarkdown toggle<CR>', { desc = 'Toggle Render Markdown' }),
    }
  end,
}
