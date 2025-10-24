require("nvchad.mappings")

local map = vim.keymap.set
vim.g.mapleader = " "

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

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
