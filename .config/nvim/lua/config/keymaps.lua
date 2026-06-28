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

-- Oil
map("n", "<leader>o", function()
  require("oil").open()
end, { desc = "Open Oil file explorer" })

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

local function get_tab_list()
  return harpoon:list("tab_" .. vim.api.nvim_get_current_tabpage())
end

map("n", "<leader>a", function()
  get_tab_list():add()
end, { desc = "Harpoon: Add file" })

map("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(get_tab_list())
end, { desc = "Harpoon: Menu" })

for i = 1, 5 do
  map("n", "<leader>" .. i, function()
    get_tab_list():select(i)
  end, { desc = "Harpoon: Jump to file " .. i })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "HarpoonMenuOpen",
  callback = function()
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(get_tab_list())
    end, { buffer = true, desc = "Harpoon: Menu" })
  end,
})

-- Copilot
vim.g.copilot_no_tab_map = true
map("i", "<M-a>", function()
  require("copilot.suggestion").accept_line()
end, { expr = true, replace_keycodes = false, desc = "Accept Copilot suggestion" })
