local mapOpts = { silent = true, remap = false }
local function mergedOpts(descOpt)
  return vim.tbl_extend("force", mapOpts, { desc = descOpt })
end

vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN]  = 'W',
    },
  },
  -- Show source server name in float
  float = { source = true, border = 'rounded' },
})

-- Override the defaults to also show the float on jump
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end,
  mergedOpts('Go to previous diagnostic'))
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end,
  mergedOpts('Go to next diagnostic'))

-- Error-only jumps (not provided by defaults)
vim.keymap.set('n', '[e',
  function() vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR }) end,
  mergedOpts('Go to previous error'))
vim.keymap.set('n', ']e',
  function() vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR }) end,
  mergedOpts('Go to next error'))


vim.keymap.set('n', '<leader>dg', vim.diagnostic.open_float, mergedOpts('Open floating diagnostic message'))
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, mergedOpts('Open diagnostics list'))
