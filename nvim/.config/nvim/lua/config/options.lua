vim.opt.number = true         -- Make line numbers default (default: false)
vim.opt.relativenumber = true -- Set relative numbered lines (default: false)

-- Sync clipboard between OS and Neovim. (default: '')
vim.opt.clipboard = 'unnamedplus'

vim.opt.wrap = true      -- Display lines as one long line (default: true)
vim.opt.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.opt.mouse =
'nv'                     -- Enable mouse mode (default: '') vim.opt.autoindent = true -- Copy indent from current line when starting new one (default: true)

-- Case related options
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Highlighting options
vim.opt.hlsearch = false
vim.opt.cursorline = true -- Highlight the current line

vim.opt.showmode = false
vim.opt.termguicolors = true   -- Set termguicolors to enable highlight groups (default: false)
vim.opt.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.opt.numberwidth = 4
vim.opt.smartindent = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.pumheight = 10
vim.opt.conceallevel = 0
vim.opt.signcolumn = 'yes'
vim.opt.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
vim.opt.cmdheight = 1
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Backup related options
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true

vim.opt.shortmess:append 'c'                         -- Don't give |ins-completion-menu| messages (default: does not include 'c')
vim.opt.iskeyword:append '-'                         -- Hyphenated words recognized by searches (default: does not include '-')
vim.opt.formatoptions:remove { 'c', 'r', 'o' }       -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)

-- Sync changes to the file outside of neovim
vim.opt.autoread = true
