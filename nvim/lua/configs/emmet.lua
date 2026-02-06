-- Emmet configuration
vim.g.user_emmet_install_global = 0
vim.g.user_emmet_install_only_markup = 1

-- Set up emmet for specific filetypes
vim.g.user_emmet_filetypes = {
  html = true,
  css = true,
  javascript = true,
  typescript = true,
  jsx = true,
  tsx = true,
  svelte = true,
  vue = true,
  xml = true,
  erb = true,
  php = true,
}

-- Custom keybindings for emmet
-- Default is <C-y>, to expand emmet abbreviation
vim.keymap.set({ "i", "n" }, "<C-y>,", "<plug>(emmet-expand-abbr)", { noremap = true })
vim.keymap.set("i", "<C-y>n", "<plug>(emmet-expand-word)", { noremap = true })
vim.keymap.set("i", "<C-y>u", "<plug>(emmet-update-tag)", { noremap = true })
vim.keymap.set("i", "<C-y>d", "<plug>(emmet-balance-tag-inward)", { noremap = true })
vim.keymap.set("i", "<C-y>D", "<plug>(emmet-balance-tag-outward)", { noremap = true })
vim.keymap.set("i", "<C-y>;", "<plug>(emmet-toggle-comment)", { noremap = true })
vim.keymap.set("i", "<C-y>j", "<plug>(emmet-split-join-tag)", { noremap = true })
vim.keymap.set("i", "<C-y>/", "<plug>(emmet-toggle-comment)", { noremap = true })
vim.keymap.set("i", "<C-y>a", "<plug>(emmet-anchorize-url)", { noremap = true })
vim.keymap.set("i", "<C-y>m", "<plug>(emmet-merge-lines)", { noremap = true })
vim.keymap.set("i", "<C-y>k", "<plug>(emmet-remove-tag)", { noremap = true })
vim.keymap.set("i", "<C-y>N", "<plug>(emmet-prev)", { noremap = true })
