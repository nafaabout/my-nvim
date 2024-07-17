return {
  { "norcalli/nvim-colorizer.lua" },
  {  "folke/which-key.nvim", enabled = false },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({
            toggle = false,
            reveal_force_cwd = true,
            dir = LazyVim.root(),
          })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({
            toggle = false,
            reveal_force_cwd = true,
            dir = vim.uv.cwd(),
          })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = false })
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = false })
        end,
        desc = "Buffer Explorer",
      },
    },
    opts = function(_, opts)
      table.remove(opts, 2)
      table.remove(opts, 3)
      return opts
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "andymass/vim-matchup",
    enabled = true,
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- just a config for treesitter integrations

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "vue", "javascript", "typescript", "html", "css", "json", "yaml", "markdown", "lua" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    },
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
    },
  },
  -- { "github/copilot.vim" },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
  --     debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
  --     disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
  --     language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
  --     -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
  --   },
  --   build = function()
  --     vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  --   end,
  --   event = "VeryLazy",
  --   keys = {
  --     { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
  --     { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
  --     {
  --       "<leader>ccT",
  --       "<cmd>CopilotChatVsplitToggle<cr>",
  --       desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
  --     },
  --     {
  --       "<leader>ccv",
  --       ":CopilotChatVisual",
  --       mode = "x",
  --       desc = "CopilotChat - Open in vertical split",
  --     },
  --     {
  --       "<leader>ccx",
  --       ":CopilotChatInPlace<cr>",
  --       mode = "x",
  --       desc = "CopilotChat - Run in-place code",
  --     },
  --     {
  --       "<leader>ccf",
  --       "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
  --       desc = "CopilotChat - Fix diagnostic",
  --     },
  --     {
  --       "<leader>ccr",
  --       "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
  --       desc = "CopilotChat - Reset chat history and clear buffer",
  --     },
  --   },
  -- },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {},
  --   -- stylua: ignore
  --   keys = {
  --     { "s", mode = { "x", "o" },      function() require("flash").jump() end,       desc = "Flash" },
  --     { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --     { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
  --     {
  --       "R",
  --       mode = { "o", "x" },
  --       function() require("flash").treesitter_search() end,
  --       desc =
  --       "Treesitter Search"
  --     },
  --     {
  --       "<c-s>",
  --       mode = { "c" },
  --       function() require("flash").toggle() end,
  --       desc =
  --       "Toggle Flash Search"
  --     },
  --   },
  -- },

  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = { { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" } },
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
