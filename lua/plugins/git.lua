return {
  { "rhysd/git-messenger.vim" },
  { "airblade/vim-gitgutter", enabled = true },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "lewis6991/gitsigns.nvim", enabled = false },
  { "APZelos/blamer.nvim" },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "tanvirtin/vgit.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- required
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "sindrets/diffview.nvim", -- optional
  --     "ibhagwan/fzf-lua", -- optional
  --   },
  --   config = true,
  -- },
}
