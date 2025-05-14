local diffview = require 'diffview'

vim.keymap.set('n', '<leader>do', diffview.open, { desc = 'DiffViewOpen' })
vim.keymap.set('n', '<leader>dc', diffview.close, { desc = 'DiffViewClose' })
