require('git-worktree').setup()

-- Telescope integration (lists worktrees, <CR> switches, <c-d> deletes, <c-f> force deletes)
require('telescope').load_extension 'git_worktree'

local worktree = require('telescope').extensions.git_worktree

vim.keymap.set('n', '<leader>gw', worktree.git_worktrees, { desc = '[G]it [W]orktrees (switch/delete)' })
vim.keymap.set('n', '<leader>gW', worktree.create_git_worktree, { desc = '[G]it [W]orktree create' })

-- Hook example: run code after switching worktrees
-- local Worktree = require 'git-worktree'
-- Worktree.on_tree_change(function(op, metadata)
--   if op == Worktree.Operations.Switch then
--     print('Switched from ' .. metadata.prev_path .. ' to ' .. metadata.path)
--   end
-- end)
