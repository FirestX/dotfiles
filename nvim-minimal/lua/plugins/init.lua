return {
  -- Treesitter for syntax highlighting (override NvChad defaults)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc" },
    },
  },

  -- Mason for LSP server management
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
      },
    },
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  },

  -- Oil for file exploration
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
    opts = {},
  },
}
