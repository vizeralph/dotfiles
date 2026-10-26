------------------
-- INSTALLATION --
------------------
vim.pack.add({
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/folke/noice.nvim",
})

-------------------
-- CONFIGURATION --
-------------------
require("noice").setup({
	lsp = { progress = { view = "lsp_notify" } },
	views = {
		lsp_notify = {
			view = "notify",
			replace = true,
		},
	},
	presets = { command_palette = true },
})
