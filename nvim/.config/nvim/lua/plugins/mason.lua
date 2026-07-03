return {
  'mason-org/mason.nvim',
  init = function()
    -- Add the mason installed binaries to Neovim's internal PATH at lazy.nvim's startup whilst having Mason lazy loaded
    vim.env.PATH = vim.fn.stdpath 'data' .. '/mason/bin:' .. vim.env.PATH
  end,
  cmd = 'Mason',
  opts = {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  },
  config = function(_, opts)
    require('mason').setup(opts)

    local tools_to_install = {
      'lua-language-server',
      'typescript-language-server', -- JS/TS LSP server that also provides formatting capabilites
      'clangd',
      'pyright',
      'tailwindcss-language-server',
      'js-debug-adapter', -- JS/TS debugger
      'cpptools', -- C/C++/Rust debugger
      'texlab', -- LaTeX LSP server
      'bash-language-server', -- LSP server that provides LSP for PKGBUILD, makepkg.conf
      'stylua',
      'json-lsp',
      'css-lsp',
      'yaml-language-server',
      'docker-language-server',
      'gopls',
      'marksman', -- Markdown LSP server

      -- Linters
      'luacheck', -- Lua linter
      'ruff', -- Python linter written in Rust
      'eslint_d', -- JS/TS linter
      'shellcheck', -- Bash linter
      'cpplint', -- C/C++ linter
      'biome', -- Newer and Faster JS/TS linter & formatter written in Rust
      'jsonlint', -- JSON linter
      'yamllint', -- YAML linter
      'tombi', -- TOML linter
      'markdownlint', -- Markdown linter
      'hadolint', -- Dockerfile linter
      'golangci-lint', -- Go linter
    }

    -- NOTE: We are trying to use `mason-registry` api along with the `package` API returned by the package object returned when using `mason-registry` for various things
    local registry = require 'mason-registry'
    local function install_tool(package)
      package:install(nil, function(success)
        vim.schedule(function()
          if success then
            vim.notify('Successfully Installed ' .. package.name .. ' using Mason', vim.log.levels.INFO)
          else
            vim.notify('Failed to Install ' .. package.name .. ' using Mason', vim.log.levels.ERROR)
          end
        end)
      end)
    end

    local function check_if_installed(tool)
      if not registry.is_installed(tool) then
        local package = registry.get_package(tool)
        install_tool(package)
      end
    end

    -- NOTE: Check if the tools are installed, if not install them
    for _, tool in ipairs(tools_to_install) do
      check_if_installed(tool)
    end

    -- Remove any Mason packages not in tools_to_install list, to avoid cluttering the system with unused tools
    for _, pkg in ipairs(registry.get_installed_packages()) do
      if not vim.tbl_contains(tools_to_install, pkg.name) then
        pkg:uninstall(nil, function(success)
          vim.schedule(function()
            if success then
              vim.notify('Successfully Uninstalled ' .. pkg.name .. ' using Mason', vim.log.levels.INFO)
            else
              vim.notify('Failed to Uninstall ' .. pkg.name .. ' using Mason', vim.log.levels.ERROR)
            end
          end)
        end)
      end
    end
  end,
}
