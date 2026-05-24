-- NOTE: use conform.nvim & nvim-lint for formatters and linters that don't have an LSP server
vim.lsp.enable { 'lua_ls', 'ts_ls', 'tailwindcss', 'pyright', 'clangd', 'bashls', 'jsonls', 'cssls', 'stylua', 'texlab' }

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
vim.keymap.set('n', '<leader>it', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { remap = false, desc = 'Toggle Inlay Hints' })

-- All buffer-local LSP setup lives here, runs once per buffer per server attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local buf = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    -- Navigation
    map('n', 'gd', vim.lsp.buf.definition, 'Go to Definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to Declaration')

    -- Info
    map('n', 'K', vim.lsp.buf.hover, 'Hover Docs')
    map({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')

    -- Format
    map({ 'n', 'v' }, '<leader>ff', function()
      vim.lsp.buf.format()
    end, 'Format Buffer/Selection')

    -- Document highlight: highlight other usages of symbol under cursor
    if client and client:supports_method 'textDocument/documentHighlight' then
      local hl_group = vim.api.nvim_create_augroup('lsp_document_highlight_' .. buf, { clear = true })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = buf,
        group = hl_group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        buffer = buf,
        group = hl_group,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- Codelens: inline actionable info (e.g. "2 references", run test)
    if client and client:supports_method 'textDocument/codeLens' then
      vim.lsp.codelens.enable(true)
      map('n', '<leader>cl', vim.lsp.codelens.run, 'Run CodeLens')
      local cl_group = vim.api.nvim_create_augroup('lsp_codelens_' .. buf, { clear = true })
      vim.api.nvim_create_autocmd({ 'BufWritePost', 'CursorHold' }, {
        buffer = buf,
        group = cl_group,
        callback = function()
          vim.lsp.codelens.enable(true)
        end,
      })
    end

    -- Document color: show color swatches inline (e.g. in CSS/Tailwind)
    if client and client:supports_method 'textDocument/documentColor' then
      vim.lsp.document_color.enable(true, { bufnr = buf })
    end
  end,
})
