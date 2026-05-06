-- Filetypes(associated with diff. lang.) for which to enable Treesitter highlighting and folding
local filetypes = {'lua','cpp','python','js','javascript','typescript','javascriptreact','tsx','html','css','rust','go','sh','markdown','yaml','toml'}

-- Autocommand to start Treesitter highlighting and folding for specific filetypes using vim.treesitter APIs
local treesitter_group = vim.api.nvim_create_augroup('TreesitterGroup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = treesitter_group,
  pattern = filetypes,
  callback = function(e)
      local ok, err = pcall(vim.treesitter.start)
      if ok then
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      else
        if err then
            vim.notify("Treesitter: " .. err, vim.log.levels.WARN)
        end
        vim.wo.foldmethod = 'indent' 
    end
  end,
})

-- Register the parser 'bash' to be used for 'sh' filetypes ; since no seperate 'sh' parser developed
vim.treesitter.language.register('bash','sh')
