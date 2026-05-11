vim.opt.completeopt = 'menuone,noselect,popup'

vim.opt.winborder = 'rounded'

-- Inlay hints toggle (not a default keymap)
vim.keymap.set('n', '<leader>it', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { remap = false, desc = 'Toggle Inlay Hints' })

-- Completions handled by blink.cmp
