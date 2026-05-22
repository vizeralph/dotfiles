------------
-- GLOBAL --
------------
vim.g.mapleader = " "

--------------------
-- USER INTERFACE --
--------------------
local ui_highlights = {
  "EndOfBuffer",
  "NonText",
  "Normal",
  "NormalNC",
  "SignColumn",
  "StatusLineNC",
  --"StatusLine"
}

for _, ui_highlight in ipairs(ui_highlights) do
  vim.api.nvim_set_hl(0, ui_highlight, { bg = "NONE", ctermbg = "NONE" })
end

-----------------
-- LINE NUMBER --
-----------------
vim.opt.number = true
vim.opt.relativenumber = true

----------------
-- WHITESPACE --
----------------
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.api.nvim_set_hl(0, "Whitespace", { fg = "#404040" })
vim.opt.list = true
vim.opt.listchars = {
  lead = '·',
  nbsp = '␣',
  space = '·',
  tab = '» ',
  trail = '×'
}
