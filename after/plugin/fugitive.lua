vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

vim.keymap.set('n', '<C-l>', '<Cmd>diffget //2<CR>', { desc = 'Accept current changes (left)' })
vim.keymap.set('n', '<C-r>', '<Cmd>diffget //3<CR>', { desc = 'Accept incoming changes (right)' })

vim.keymap.set('n', '<leader>bb', function()
  local blame_open = vim.fn.bufname() == 'fugitiveblame'

  if blame_open then
    vim.cmd 'q'
  else
    vim.cmd 'Gblame'
  end
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>bb', function()
  local blame_open = vim.fn.bufname() == 'Git blame'

  if blame_open then
    vim.cmd 'q'
  else
    vim.cmd 'Git blame'
  end
end, { noremap = true, silent = true })
