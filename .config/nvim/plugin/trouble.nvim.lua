------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/folke/trouble.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("trouble").setup({
	focus = true,
	open_no_results = true,
})
