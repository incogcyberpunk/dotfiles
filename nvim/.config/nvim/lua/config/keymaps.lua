-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- delete single character without copying into register by making use of the black hole register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center using `zz`
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>cs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Better indenting with stay in visual mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>dg', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Undo all changes to the file and revert to the last write state to the file
vim.keymap.set('n', '<leader>ud', ':e!<CR>', { desc = 'Undo all changes to the file since the last write.' })

-- Keymap to open a terminal
vim.keymap.set('n', '<leader>te', ':terminal<CR>', { desc = 'Open a new terminal in a tab' })

-- Keymap to check if the file has been modified outside of Neovim
vim.keymap.set('n', '<leader>sy', '<cmd>checktime<CR>', { desc = 'Check if the file has been modified outside of Neovim' })

-- Keymap to yank whole file
vim.keymap.set('n', '<leader>ya', '<cmd>%y<CR>', { desc = 'Yank the whole file', noremap = true })

-- Keymap to delete whole file
vim.keymap.set('n', '<leader>da', '<cmd>%d<CR>', { desc = 'Delete the whole file', noremap = true })

-- Keymap to change whole file
vim.keymap.set('n', '<leader>ca', '<cmd>%c<CR>', { desc = 'Change the whole file', noremap = true })
