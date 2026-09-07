return {
  'echasnovski/mini.files',
  enabled = true,
  -- mini.icons supplies the file/folder glyphs shown in the explorer.
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },

  -- Lazy-load: the plugin is only pulled in the first time one of these keys
  -- is pressed, so it adds nothing to startup time.
  keys = {
    {
      '-',
      function()
        -- Open focused on the directory of the current file (with that file
        -- pre-selected). Unnamed buffers have no path, so fall back to cwd.
        local buf_name = vim.api.nvim_buf_get_name(0)
        local path = buf_name ~= '' and buf_name or vim.uv.cwd()
        require('mini.files').open(path, true)
      end,
      desc = 'Open mini.files (at current file)',
    },
    {
      '_',
      function()
        -- Always open at the current working directory (project root).
        require('mini.files').open(vim.uv.cwd(), true)
      end,
      desc = 'Open mini.files (cwd)',
    },
  },

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

  config = function(_, opts)
    local mf = require 'mini.files'
    mf.setup(opts)

    -- Listen for mini.files' plugin-defined `User` event, fired whenever it
    -- creates an explorer buffer. The callback below makes `:w` synchronize
    -- that buffer with the filesystem; the default `=` mapping still invokes
    -- the same action directly.
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf = args.data.buf_id
        -- Explorer buffers are scratch (buftype=nofile), where `:w` errors
        -- with E382 and no write autocmd fires. 'acwrite' makes the buffer
        -- writable but delegates the actual write to a BufWriteCmd event.
        vim.bo[buf].buftype = 'acwrite'
        vim.api.nvim_create_autocmd('BufWriteCmd', {
          buffer = buf,
          callback = function()
            mf.synchronize()
          end,
        })
      end,
    })
  end,
}
