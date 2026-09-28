------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
	},
	format_on_save = {},
})
