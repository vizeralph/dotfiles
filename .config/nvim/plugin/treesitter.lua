------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-------------------
-- CONFIGURATION --
-------------------
require("nvim-treesitter").install({
	"lua",
	"nix",
})
