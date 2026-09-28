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
	presets = {
		command_palette = true,
	},
})
