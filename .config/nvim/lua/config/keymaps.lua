local map = vim.keymap.set

map("n", "<leader>w", function()
	vim.opt.list = not vim.opt.list:get()
end, { desc = "Toggle visible whitespace" })

map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "Explorer" })

map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find files" })

map("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

map("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })

map("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent files" })

map("n", "<leader>up", function()
	vim.pack.update()
end, { desc = "Update plugins" })
