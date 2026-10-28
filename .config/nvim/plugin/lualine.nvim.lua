------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("lualine").setup({
	options = {
		disabled_filetypes = {
			statusline = {
				"snacks_dashboard",
				"snacks_picker_input",
				"snacks_picker_list",
				"snacks_picker_preview",
				"snacks_terminal",
			},
		},
	},
	sections = { lualine_x = { "filetype" } },
})
