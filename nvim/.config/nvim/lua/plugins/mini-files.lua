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
    options = {
      -- Send deletions to the OS trash instead of removing permanently.
      permanent_delete = false,
    },
  },
}
