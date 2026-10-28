------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/folke/which-key.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("which-key").setup({
	icons = { group = "" },
	spec = {
		{
			"<leader>f",
			group = "Find",
		},
		{
			"<leader>t",
			group = "Toggle",
		},
		{
			"<leader>u",
			group = "Update",
			icon = {
				icon = "",
				color = "cyan",
			},
		},
		{
			"<leader>w",
			group = "Window",
		},
	},
})
