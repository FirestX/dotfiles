require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

vim.g.mapleader = " "
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- FZF
vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
map('n', '<leader>a', function() require('harpoon'):list():add() end, { desc = 'Harpoon: Add File' })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map('n', '<leader>1', function() require('harpoon'):list():select(1) end, { desc = 'Harpoon: Jump to File 1' })
map('n', '<leader>2', function() require('harpoon'):list():select(2) end, { desc = 'Harpoon: Jump to File 2' })
map('n', '<leader>3', function() require('harpoon'):list():select(3) end, { desc = 'Harpoon: Jump to File 3' })
map('n', '<leader>4', function() require('harpoon'):list():select(4) end, { desc = 'Harpoon: Jump to File 4' })

-- Copilot
vim.g.copilot_no_tab_map = true
map('i', '<S-Tab>', function() require("copilot.suggestion").accept() end, { expr = true, replace_keycodes = false })

-- Diagnostics
map('n', '<leader>da', vim.diagnostic.open_float, { desc = 'Open Diagnostics Float' })
