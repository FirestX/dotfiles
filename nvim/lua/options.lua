require "nvchad.options"

-- add yours here!

vim.o.relativenumber = true
vim.o.number = true
vim.o.autoread = true 
vim.o.showtabline = 2

-- Only show filename in tabs
function _G.custom_tabline()
  local s = ""
  for i = 1, vim.fn.tabpagenr "$" do
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
    s = s .. " " .. i .. ":" .. label .. " "
  end
  s = s .. "%#TabLineFill#"
  return s
end

vim.o.tabline = "%!v:lua.custom_tabline()"

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
