-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- General
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "x", '"_x', { desc = "Delete without copying to register" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down and center cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up and center cursor" })
map("n", "n", "nzzzv", { desc = "Next search and center" })
map("n", "N", "Nzzzv", { desc = "Previous search and center" })

-- Commenting
map({ "n", "v" }, "<leader>/", "gc", { remap = true, desc = "Toggle Comment" })

-- Grep
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Grep" })

-- Tab navigation
map("n", "<S-h>", "gT", { desc = "Previous Tab" })
map("n", "<S-l>", "gt", { desc = "Next Tab" })
