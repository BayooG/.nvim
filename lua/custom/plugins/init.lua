-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'nvim-treesitter/playground' },
  { 'tpope/vim-fugitive' },
  { 'mbbill/undotree' },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'github/copilot.vim',
    config = function()
      -- Optional: Configure Copilot settings here
      vim.g.copilot_no_tab_map = true -- disable default <Tab> mapping
      vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  { 'kablamo/vim-git-log' },
  { 'ThePrimeagen/vim-be-good' },
  { 'nvim-tree/nvim-tree.lua' },
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
  { 'nvim-treesitter/nvim-treesitter-context' },
}
