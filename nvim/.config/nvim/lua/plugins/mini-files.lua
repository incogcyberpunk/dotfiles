return {
  'echasnovski/mini.files',
  enabled = true,
  -- mini.icons supplies the file/folder glyphs shown in the explorer.
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },

  opts = {
    windows = {
      preview = true, -- show a preview of the entry under the cursor
      width_preview = 40, -- width (in columns) of that preview window
    },
    mappings = {
      -- Use the stock l/h for go_in/go_out; only override go_in_plus.
      go_in_plus = '<CR>', -- step in / open file and close the explorer
      go_out_plus = '', -- unmapped (default H); not needed
    },
    options = {
      -- Send deletions to the OS trash instead of removing permanently.
      permanent_delete = false,
    },
  },
}
