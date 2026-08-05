local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local entry_display = require 'telescope.pickers.entry_display'
local make_entry = require 'telescope.make_entry'

-- Structured entry maker for git commits: hash | date | author | subject
local function git_commits_entry_maker(opts)
  opts = opts or {}
  local displayer = entry_display.create {
    separator = '  ',
    items = {
      { width = 8 }, -- short hash
      { width = 10 }, -- date (YYYY-MM-DD)
      { width = 12 }, -- author (username)
      { remaining = true }, -- subject
    },
  }
  local make_display = function(entry)
    return displayer {
      { entry.value, 'TelescopeResultsIdentifier' },
      { entry.date, 'TelescopeResultsComment' },
      { entry.author, 'TelescopeResultsVariable' }, -- username (email local-part)
      entry.msg,
    }
  end
  return function(line)
    if line == '' then
      return nil
    end
    local sha, date, author, msg = string.match(line, '([^\t]+)\t([^\t]+)\t([^\t]+)\t(.*)')
    if not sha then
      return nil
    end
    return make_entry.set_default_entry_mt({
      value = sha,
      ordinal = sha .. ' ' .. author .. ' ' .. msg,
      msg = msg,
      date = date,
      author = author,
      display = make_display,
    }, opts)
  end
end

local function git_commits_structured()
  builtin.git_commits {
    git_command = { 'git', 'log', '--pretty=format:%h\t%as\t%al\t%s', '--abbrev-commit' },
    entry_maker = git_commits_entry_maker(),
    layout_config = { preview_width = 0.60 },
  }
end

function TelescopeGitFileHistory()
  builtin.git_commits {
    git_command = { 'git', 'log', '--oneline', '--', vim.fn.expand '%' },
    attach_mappings = function(_, map)
      map('i', '<CR>', actions.select_default + actions.center)
      return true
    end,
  }
end

-- You can map this function to a keybinding
vim.api.nvim_set_keymap('n', '<leader>gh', ':lua TelescopeGitFileHistory()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]ind' })

vim.keymap.set('n', '<leader>sg', function()
  builtin.grep_string { search = vim.fn.input 'Grep > ' }
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]ind' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gc', git_commits_structured, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gg', builtin.git_stash, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gh', ':lua TelescopeGitFileHistory()<CR>', { noremap = true, silent = true })
