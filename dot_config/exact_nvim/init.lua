--------------------
-- USER INTERFACE --
--------------------
vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
-- vim.cmd("highlight StatusLine guibg=NONE ctermbg=NONE")
vim.cmd("highlight StatusLineNC guibg=NONE ctermbg=NONE")

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
