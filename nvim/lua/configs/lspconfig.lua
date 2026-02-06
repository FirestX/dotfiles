require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "vtsls", "svelte", "jdtls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
vim.lsp.config("roslyn", {})
vim.lsp.config("jdtls", {})
