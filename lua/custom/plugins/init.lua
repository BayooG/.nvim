-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'nvim-treesitter/playground' },
  { 'tpope/vim-fugitive' },
  { 'mbbill/undotree' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'kablamo/vim-git-log' },
  { 'ThePrimeagen/vim-be-good' },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'rbong/vim-flog',
    lazy = true,
    cmd = { 'Flog', 'Flogsplit', 'Floggit' },
    dependencies = {
      'tpope/vim-fugitive',
    },
  },
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    config = function()
      require('tailwindcss-colorizer-cmp').setup {
        color_square_width = 2,
      }
    end,
  },
  {
    'jfryy/keytrail.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'OXY2DEV/markview.nvim',
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },
  {
    'ThePrimeagen/git-worktree.nvim',
  },
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   version = '*',
  --   lazy = false,
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function()
  --     require('nvim-tree').setup {}
  --   end,
  -- },
}
