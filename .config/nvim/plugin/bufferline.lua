------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "snacks_layout_box",
				text = "Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})
