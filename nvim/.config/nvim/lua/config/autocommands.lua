-- Auto-format on save
local save_group = vim.api.nvim_create_augroup('SaveGroup', { clear = true })
vim.api.nvim_create_autocmd('BufWrite', {
  pattern = '*',
  group = save_group,
  callback = function(e)
    local ft = vim.bo[e.buf].filetype
    local bt = vim.bo[e.buf].buftype

    local ignore_filetypes = { 'oil', 'markdown', 'text', 'NvimTree', 'hyprlang' }

    -- if the filetype is in the ignore list, return
    for _, file in ipairs(ignore_filetypes) do
      if bt == 'acwrite' then
        return
      end

      if ft == file then
        return
      end
    end

    -- Check if any LSP client other than 'copilot' is attached
    local clients = vim.lsp.get_clients { bufnr = 0 }
    local has_lsp = false

    for _, client in pairs(clients) do
      if client.name ~= 'copilot' then
        has_lsp = true
        break
      end
    end

    if not has_lsp then
      return
    end

    vim.lsp.buf.format { async = false }
  end,
  group = save_group,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Remove 'r' and 'o' from formatoptions globally
local format_group = vim.api.nvim_create_augroup('FormatOptions', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  group = format_group,
  callback = function()
    vim.opt_local.formatoptions:remove { 'r', 'o' }
  end,
})

