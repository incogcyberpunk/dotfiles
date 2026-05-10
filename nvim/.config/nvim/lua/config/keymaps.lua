-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local mapOpts = { silent = true, remap = false }
local function mergedOpts(descOpt)
  return vim.tbl_extend("force", mapOpts, { desc = descOpt })
end
-- delete single character without copying into register by making use of the black hole register
vim.keymap.set('n', 'x', '"_x', mapOpts)

-- Vertical scroll and center using `zz`
vim.keymap.set('n', '<C-d>', '<C-d>zz', mapOpts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', mapOpts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', mapOpts)
vim.keymap.set('n', 'N', 'Nzzzv', mapOpts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize +2<CR>', mapOpts)
vim.keymap.set('n', '<Down>', ':resize -2<CR>', mapOpts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', mapOpts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', mapOpts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', mapOpts)      -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', mapOpts)      -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', mapOpts)     -- make split windows equal width & height
vim.keymap.set('n', '<leader>cs', ':close<CR>', mapOpts) -- close current split window

-- Tab management
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', mapOpts)
vim.keymap.set('n', '<leader>tp', ':tabprev<CR>', mapOpts)
vim.keymap.set('n', '<leader>te', ':tabnew<CR>', mapOpts)
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', mapOpts)

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', mapOpts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', mapOpts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', mapOpts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', mapOpts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', mapOpts)

-- Better indenting with stay in visual mode
vim.keymap.set('v', '<', '<gv', mapOpts)
vim.keymap.set('v', '>', '>gv', mapOpts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', mapOpts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, mergedOpts('Go to previous diagnostic message'))
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, mergedOpts('Go to next diagnostic message'))
vim.keymap.set('n', '<leader>dg', vim.diagnostic.open_float, mergedOpts('Open floating diagnostic message'))
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, mergedOpts('Open diagnostics list'))

-- Undo all changes to the file and revert to the last write state to the file
vim.keymap.set('n', '<leader>ud', ':e!<CR>', mergedOpts('Undo all changes to the file since the last write.'))

-- Keymap to open a terminal
vim.keymap.set('n', '<leader>tr', ':terminal<CR>', mergedOpts('Open a new terminal in a tab'))

-- Keymap to check if the file has been modified outside of Neovim
vim.keymap.set('n', '<leader>sy', '<cmd>checktime<CR>',
  mergedOpts('Check if the file has been modified outside of Neovim'))
-- Keymap to yank whole file
vim.keymap.set('n', '<leader>ya', '<cmd>%y<CR>', mergedOpts('Yank the whole file'))

-- Keymap to delete whole file
vim.keymap.set('n', '<leader>da', '<cmd>%d<CR>', mergedOpts('Delete the whole file'))

-- Keymap to change whole file
vim.keymap.set('n', '<leader>ca', '<cmd>%c<CR>', mergedOpts('Change the whole file'))
