------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/folke/todo-comments.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("todo-comments").setup({
	signs = false,
	highlight = {
		before = "",
		keyword = "bg",
		after = "bg",
	},
})
