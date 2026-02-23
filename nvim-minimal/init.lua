-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NvChad base46 cache
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46-minimal/"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy-minimal/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load options
require("config.options")

-- Load plugins
require("lazy").setup({
  -- NvChad base
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  
  -- Custom plugins
  { import = "plugins" },
}, {
  install = {
    colorscheme = { "nvchad" },
  },
  checker = {
    enabled = false,
  },
})

-- Load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load keymaps
require("config.keymaps")
