return {
  'nvim-tree/nvim-tree.lua',
  enabled = true,
  main = 'nvim-tree',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = { -- Lazy load the plugin when these keys are pressed
    { '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle the tree', noremap = true, silent = true } },
  },
  config = function()
    require('nvim-tree').setup {
      -- NOTE: This function runs when a buffer (like NvimTree) is attached to a window.
      on_attach = function(bufnumber)
        -- NOTE: Using the `nvim-tree-api` to create custom keybindings
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'NvimTree: ' .. desc, buffer = bufnumber, silent = true, noremap = true }
        end

        -- NOTE: Keeping all the default keybindings
        api.config.mappings.default_on_attach(bufnumber)

        -- Custom keybindings using the `nvim-tree-api` are  added here
        -- NOTE: These are keybindigs for buffer so we use vim.keymap.set

        vim.keymap.set('n', 'l', api.node.open.edit, opts 'Navigate Inside ')

        vim.keymap.set('n', 'L', api.tree.expand_all, opts 'Navigate Inside ')

        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close Parent')

        vim.keymap.set('n', 'H', api.tree.collapse_all, opts 'Collapse All')

        vim.keymap.set('n', '<C-h>', api.tree.toggle_hidden_filter, opts 'Toggle Dotfiles')
      end,

      hijack_cursor = true,
      disable_netrw = true,
      filters = {
        dotfiles = true,
        git_ignored = false,
      },
    }
  end,
}
