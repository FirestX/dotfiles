-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.o.showtabline = 2

-- Only show filename in tabs
function _G.custom_tabline()
  local s = ""
  for i = 1, vim.fn.tabpagenr("$") do
    local winnr = vim.fn.tabpagewinnr(i)
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    local label = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"

    if i == vim.fn.tabpagenr() then
      s = s .. "%#TabLineSel#"
    else
      s = s .. "%#TabLine#"
    end
    s = s .. " " .. label .. " "
  end
  s = s .. "%#TabLineFill#"
  return s
end

vim.o.tabline = "%!v:lua.custom_tabline()"

vim.lsp.enable("roslyn_ls")
vim.lsp.config("roslyn_ls", {
  filetypes = { "razor", "cs" },

  settings = {
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostic_scope = "openFiles",
      dotnet_compiler_diagnostic_scope = "openFiles",
    },
  },
})
vim.lsp.config("html", {
  filetypes = { "html", "razor", "cshtml" },
})
vim.lsp.config("emmet_language_server", {
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
    "razor",
    "cshtml",
  },
})
