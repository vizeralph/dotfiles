------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("lualine").setup({ option = { globalStatus = true } })
