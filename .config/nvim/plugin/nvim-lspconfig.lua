------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-------------------
-- CONFIGURATION --
-------------------
vim.lsp.enable({
	"lua_ls",
	"nixd",
})
