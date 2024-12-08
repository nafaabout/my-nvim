return {
  -- Typescript
  { "pangloss/vim-javascript" },
  { "leafgarland/typescript-vim" },
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { 'mattn/emmet-vim' },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        -- Enable all features
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
    config = function(_, opts)
      require("typescript-tools").setup(opts)
    end,
  }
}
