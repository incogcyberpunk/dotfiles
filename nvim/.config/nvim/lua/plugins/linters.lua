return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      lua = { 'luacheck' },
      python = { 'ruff' },
      cpp = { 'cpplint' },
      tex = { 'chktex' },
      sh = { 'shellcheck' },
      javascript = { 'biome' },
      javascriptreact = { 'biome' },
      typescript = { 'biome' },
      typescriptreact = { 'biome' },
      json = { 'jsonlint' },
      yaml = { 'yamllint' },
      toml = { 'tombi' },
      markdown = { 'markdownlint' },
      dockerfile = { 'hadolint' },
    }

    -- NOTE: Run linters on save
    local lintAuGroup = vim.api.nvim_create_augroup('Lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      group = lintAuGroup,
      callback = function()
        local ft = vim.bo.filetype
        if lint.linters_by_ft[ft] then
          lint.try_lint()
        end
      end,
    })
  end,
}
