------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

-------------------
-- CONFIGURATION --
-------------------
local signs = {
	add = { text = "▎" },
	change = { text = "▎" },
	delete = { text = "" },
	topdelete = { text = "" },
	changedelete = { text = "▎" },
	untracked = { text = "▎" },
}
require("gitsigns").setup({
	signs = signs,
	signs_staged = signs,
})
