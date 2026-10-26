------------
-- LEADER --
------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1

---------------
-- CLIPBOARD --
---------------
vim.opt.clipboard = "unnamedplus"

-----------------
-- INDENTATION --
-----------------
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.tabstop = 2

--------------
-- SPELLING --
--------------
vim.opt.spell = true
vim.opt.spelllang = "en_us"

----------------
-- APPEARANCE --
----------------
local highlight_groups = {
	"EndOfBuffer",
	"NonText",
	"Normal",
	"NormalNC",
	"SignColumn",
	"StatusLine",
	"StatusLineNC",
}
for _, highlight in ipairs(highlight_groups) do
	vim.api.nvim_set_hl(0, highlight, {
		bg = "NONE",
		ctermbg = "NONE",
		update = true,
	})
end
vim.opt.fillchars:append({ eob = " " })

------------------
-- LINE NUMBERS --
------------------
vim.opt.number = true
vim.opt.relativenumber = true

----------------
-- WHITESPACE --
----------------
vim.opt.list = true
vim.opt.listchars = {
	lead = "·",
	nbsp = "␣",
	space = "·",
	tab = "» ",
	trail = "×",
}
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#303030" })

-------------------
-- COLUMN GUIDES --
-------------------
vim.opt.colorcolumn = "80,120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#101010" })

----------------
-- STATUSLINE --
----------------
vim.opt.laststatus = 3
vim.opt.ruler = false
