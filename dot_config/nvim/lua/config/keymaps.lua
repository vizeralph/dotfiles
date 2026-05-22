vim.keymap.set('n', '<leader>w', function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle visible whitespace" })
