return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept_line = "<M-a>",
        accept = false,
      },
    },
    panel = { enabled = true },
    filetypes = {
      java = true,
      ["*"] = true,
    },
  },
  config = function(_, opts)
    -- 1. Explicitly run the setup using the opts table above
    require("copilot").setup(opts)
  end,
}