require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "vtsls", "svelte" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
vim.lsp.config("roslyn", {})
