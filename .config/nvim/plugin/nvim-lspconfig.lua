------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-------------------
-- CONFIGURATION --
-------------------
vim.lsp.config("sourcekit", { filetypes = { "swift" } })
vim.lsp.config("lemminx", {
	settings = {
		xml = { catalogs = { vim.fn.fnamemodify(vim.fn.stdpath("config"), ":h") .. "/fontconfig/catalog.xml" } },
	},
})

local servers = {
	"basedpyright",
	"bashls",
	"buf_ls",
	"clangd",
	"cmake",
	"csharp_ls",
	"cssls",
	"dartls",
	"dockerls",
	"elixirls",
	"elmls",
	"elp",
	"fish_lsp",
	"gleam",
	"gopls",
	"graphql",
	"hls",
	"html",
	"jdtls",
	"jsonls",
	"jsonnet_ls",
	"kdl_lsp",
	"kotlin_language_server",
	"lemminx",
	"lua_ls",
	"marksman",
	"metals",
	"nixd",
	"nushell",
	"ocamllsp",
	"phpactor",
	"qmlls",
	"r_language_server",
	"ruby_lsp",
	"rust_analyzer",
	"sourcekit",
	"sqls",
	"taplo",
	"terraformls",
	"texlab",
	"tinymist",
	"ts_ls",
	"vue_ls",
	"yamlls",
	"zls",
}

for _, server in ipairs(servers) do
	local config = vim.lsp.config[server]
	local cmd = config and config.cmd
	local executable = type(cmd) == "table" and cmd[1] or nil

	if server == "ts_ls" then
		executable = "typescript-language-server"
	end

	if executable and vim.fn.executable(executable) == 1 then
		vim.lsp.enable(server)
	end
end
