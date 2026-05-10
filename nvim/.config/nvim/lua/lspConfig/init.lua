-- NOTE: use conform.nvim & nvim-lint for formatters and linters that don't have an LSP server
vim.lsp.enable { 'lua_ls', 'hyprls', 'ts_ls', 'tailwindcss', 'pyright', 'clangd', 'bashls' }

vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})

-- Enable the following line only when you need to debug, as log level DEBUG causes high disk usage and degraded performance
-- vim.lsp.log.set_level('debug')
