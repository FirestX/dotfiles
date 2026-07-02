return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local function get_tab_list()
      return harpoon:list("tab_" .. vim.api.nvim_get_current_tabpage())
    end

    vim.keymap.set("n", "<leader>a", function()
      get_tab_list():add()
    end, { desc = "Harpoon: Add file" })

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(get_tab_list())
    end, { desc = "Harpoon: Menu" })

    for i = 1, 5 do
      vim.keymap.set("n", "<leader>" .. i, function()
        get_tab_list():select(i)
      end, { desc = "Harpoon: Jump to file " .. i })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "HarpoonMenuOpen",
      callback = function()
        vim.keymap.set("n", "<C-e>", function()
          harpoon.ui:toggle_quick_menu(get_tab_list())
        end, { buffer = true, desc = "Harpoon: Menu" })
      end,
    })
  end,
}
