return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
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
  config = function()
    require('copilot').setup ({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = '<C-.>', -- key to accept ghost text
          next = '<M-]>',   -- key to get next suggestion (DEFAULT)
          prev = '<M-[>',   -- key to get previous suggestion (DEFAULT)
          dismiss = '<C-,>' -- key to dismiss
        },
      },
    })
  vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuOpen",
    callback = function()
      vim.b.copilot_suggestion_hidden = true
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuClose",
    callback = function()
      vim.b.copilot_suggestion_hidden = false
    end,
  })
  end,
}
