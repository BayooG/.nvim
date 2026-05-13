vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>zig', '<cmd>LspRestart<cr>')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
vim.keymap.set('n', '<leader>tp', ':TSPlaygroundToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>tp', ':TSPlaygroundToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ce', function()
  vim.fn.setreg('+', vim.fn.expand '%:t')
end, { desc = 'Copy current file name to clipboard' })

vim.keymap.set('n', '<leader>cr', function()
  vim.fn.setreg('+', vim.fn.expand '%')
end, { desc = 'Copy relative file path to clipboard' })
