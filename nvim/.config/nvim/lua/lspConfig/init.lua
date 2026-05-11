-- NOTE: use conform.nvim & nvim-lint for formatters and linters that don't have an LSP server
vim.lsp.enable({ 'lua_ls', 'hyprls', 'ts_ls', 'tailwindcss', 'pyright', 'clangd', 'bashls' })

vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {})

-- Adding .git as a guaranteed fallback root marker, for all servers
vim.lsp.config('*', {
    root_markers = { '.git' },
})

-- Automatically fold imports when opening a file
vim.api.nvim_create_autocmd('LspNotify', {
    callback = function(ev)
        if ev.data.method == 'textDocument/didOpen' then
            vim.lsp.foldclose('imports', vim.fn.bufwinid(ev.buf))
        end
    end,
})

-- Keymap to toggle inlay-hints
vim.keymap.set('n', '<leader>it', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { remap = false, desc = "Toggle Inlay Hints" })
