return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      lua = { 'luacheck' },
      python = { 'ruff' },
      cpp = { 'cpplint' },
      tex = { 'chktex' },
      sh = { 'shellcheck' },
      javascript = { 'biome' },
      typescript = { 'biome' },
      json = { 'jsonlint' },
      yaml = { 'yamllint' },
      toml = { 'tombi' },
      markdown = { 'markdownlint' },
    }

    -- NOTE: Run linters on save
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      callback = function()
        local ft = vim.bo.filetype
        if lint.linters_by_ft[ft] then
          lint.try_lint()
        end
      end,
    })
  end,
}
