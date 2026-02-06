require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "vtsls", "svelte" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
vim.lsp.config("roslyn", {})

-- Configure emmet-language-server
vim.lsp.config("emmet_language_server", {
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "typescript",
    "typescriptreact",
    "vue",
  },
})
vim.lsp.enable("emmet_language_server")
