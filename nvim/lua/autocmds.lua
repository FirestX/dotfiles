require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "UIEnter", "ColorScheme" }, {
  pattern = "*",
  callback = function()
    local highlights = { "TabLine", "TabLineFill" }
    for _, hl in ipairs(highlights) do
      vim.api.nvim_set_hl(0, hl, { bg = "NONE", ctermbg = "NONE" })
    end
  end,
})
