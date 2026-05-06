return {
  'stevearc/oil.nvim',
  enabled = true,
  opts = {},
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  lazy = true,
  keys = {
    {
      '-', function() require('oil').open_float() end, { desc = 'Open oil.nvim from normal mode using keybinds' },
    },
  },
  config = function()
    require('oil').setup {
      -- Set to false to disable oil.nvim to open when opening a directory
      default_file_explorer = false,
      -- Skip confirmation for simple edits
      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      prompt_save_on_select_new_entry = true,
      columns = {
        'icon',
      },
      -- See `:h oil-actions` for a list of all actions
      keymaps = {
        -- Close the oil buffer
        ['q'] = { 'actions.close', opts = { exit_if_last_buf = true }, mode = 'n' },
        -- Show help for oil keymaps
        ['g?'] = { 'actions.show_help', mode = 'n' },
        -- Go up a directory
        ['h'] = { 'actions.parent', mode = 'n' },
        -- Go down into the directory under the cursor
        ['l'] = {'actions.select',mode = 'n' },
        -- Open the selected file in a vertical split
        ['\\v'] = { 'actions.select', opts = { vertical = true } },
        -- Open the selected file in a horizontal split
        ['\\h'] = { 'actions.select', opts = { horizontal = true } },
        -- Open the selected file in a new tab
        ['T'] = { 'actions.select', opts = { tab = true } },
        -- Preview the selected file
        ['<C-p>'] = {'actions.preview',mode = 'n' },
        -- Refresh the directory listing
        ['<C-r>'] = {'actions.refresh',mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        -- Cd to the current oil directory
        ['`'] = { 'actions.cd', mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        -- Toggle hidden files
        ['.'] = { 'actions.toggle_hidden', mode = 'n' },
        -- Toggle the trash folder
        ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
      },
      -- Configuration for the floating keymaps help window
      keymaps_help = {
        border = 'rounded',
      },
    }
  end,
}
