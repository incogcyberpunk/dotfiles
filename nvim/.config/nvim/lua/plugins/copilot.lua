return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<leader>csa', -- key to accept ghost text
          next = '<leader>csn',   -- key to get next suggestion
          prev = '<leader>csp',   -- key to get previous suggestion
          dismiss = '<leader>csd' -- key to dismiss
        },
      },
    }
  end,
  keys = {
    {
      '<leader>ce',
      function()
        local ok, err = pcall(vim.cmd, 'Copilot enable')
        if ok then
          vim.notify('Copilot enabled', vim.log.levels.INFO)
        else
          vim.notify('Failed to enable Copilot: ' .. err, vim.log.levels.ERROR)
        end
      end,
      desc = 'Enable Copilot',
    },
    {
      '<leader>cd',
      function()
        local ok, err = pcall(vim.cmd, 'Copilot disable')
        if ok then
          vim.notify('Copilot disabled', vim.log.levels.INFO)
        else
          vim.notify('Failed to disable Copilot: ' .. err, vim.log.levels.ERROR)
        end
      end,
      desc = 'Disable Copilot',
    },
  },
}
