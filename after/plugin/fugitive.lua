vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

vim.keymap.set('n', '<C-l>', '<Cmd>diffget //2<CR>', { desc = 'Accept current changes (left)' })
vim.keymap.set('n', '<C-r>', '<Cmd>diffget //3<CR>', { desc = 'Accept incoming changes (right)' })
