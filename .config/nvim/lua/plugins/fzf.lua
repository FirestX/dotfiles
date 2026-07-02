return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<leader>fg",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Live grep",
    },
  },
}