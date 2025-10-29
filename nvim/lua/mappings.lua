require("nvchad.mappings")

local map = vim.keymap.set
vim.g.mapleader = " "

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "x", '"_x', { desc = "Delete without copying to register" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center cursor" })
map("n", "n", "nzzzv", { desc = "Next search and center" })
map("n", "N", "Nzzzv", { desc = "Previous search and center" })

-- FZF
local fzf = require("fzf-lua")

map("n", "<leader>ff", fzf.files, { noremap = true, silent = true, desc = "Find files (fzf)" })
map("n", "<leader>fg", fzf.live_grep, { noremap = true, silent = true, desc = "Live grep" })
map("n", "<leader>fb", fzf.buffers, { noremap = true, silent = true, desc = "Find buffers" })

-- Oil
map("n", "<leader>o", function() require("oil").open_float() end, { desc = "Open Oil file explorer" })

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Menu" })

for i = 1, 5 do
  map("n", "<leader>" .. i, function() harpoon:list():select(i) end, { desc = "Harpoon: Jump to file " .. i })
end

-- Copilot
vim.g.copilot_no_tab_map = true
map("i", "<M-Tab>", function()
  require("copilot.suggestion").accept_line()
end, { expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" })

-- Code Actions
map("n", "<leader>ca", function() require("tiny-code-action").code_action() end, { noremap = true, silent = true, desc = "Code Action" })
require("tiny-code-action").setup({
  picker = {
    "buffer",
    opts = {
      hotkeys = true, -- Enable hotkeys for quick selection of actions
      hotkeys_mode = "text_diff_based", -- Modes for generating hotkeys
      auto_preview = false, -- Enable or disable automatic preview
      auto_accept = false, -- Automatically accept the selected action (with hotkeys)
      position = "cursor", -- Position of the picker window
      winborder = "single", -- Border style for picker and preview windows
      keymaps = {
        preview = "K", -- Key to show preview
        close = { "q", "<Esc>" }, -- Keys to close the window (can be string or table)
        select = "<CR>", -- Keys to select action (can be string or table)
      },
      custom_keys = {
        { key = 'm', pattern = 'Fill match arms' },
        { key = 'r', pattern = 'Rename.*' }, -- Lua pattern matching
      },
    },
  },
})
