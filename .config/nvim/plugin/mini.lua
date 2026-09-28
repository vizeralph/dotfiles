------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("mini.diff").setup({
	view = {
		style = "sign",
		signs = {
			add = "+",
			change = "~",
			delete = "-",
		},
	},
})
local hipatterns = require("mini.hipatterns")

hipatterns.setup({
	highlighters = {
		fixme = {
			pattern = "%f[%w]()FIXME()%f[%W]",
			group = "MiniHipatternsFixme",
		},
		hack = {
			pattern = "%f[%w]()HACK()%f[%W]",
			group = "MiniHipatternsHack",
		},
		todo = {
			pattern = "%f[%w]()TODO()%f[%W]",
			group = "MiniHipatternsTodo",
		},
		note = {
			pattern = "%f[%w]()NOTE()%f[%W]",
			group = "MiniHipatternsNote",
		},

		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
require("mini.map").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
