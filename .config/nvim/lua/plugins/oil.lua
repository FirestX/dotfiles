return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = {},
  keys = {
    {
      "<leader>o",
      function()
        require("oil").open()
      end,
      desc = "Open Oil file explorer",
    },
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
}