local map = vim.keymap.set

--============================================================================--
--                                    FIND                                    --
--============================================================================--

map("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Find Buffer" })

map("n", "<leader>ff", function()
	Snacks.picker.resume({ source = "files" })
end, { desc = "Find File" })

map("n", "<leader>ft", function()
	Snacks.picker.grep()
end, { desc = "Find Text" })

--============================================================================--
--                                   TOGGLE                                   --
--============================================================================--

map("n", "<leader>tw", function()
	vim.o.list = not vim.o.list
end, { desc = "Toggle Whitespace" })

--============================================================================--
--                                   UPDATE                                   --
--============================================================================--

map("n", "<leader>up", function()
	vim.pack.update()
end, { desc = "Update Plugins" })

map("n", "<leader>ut", function()
	vim.cmd.TSUpdate()
end, { desc = "Update Treesitter" })

--============================================================================--
--                                   WINDOW                                   --
--============================================================================--

map("n", "<leader>wd", function()
	local terminal = Snacks.terminal.get(nil, { create = false })
	if terminal then
		terminal:hide()
	end

	require("trouble").toggle("diagnostics")
end, { desc = "Window Diagnostics" })

map("n", "<leader>wt", function()
	require("trouble").close("diagnostics")
	Snacks.terminal.toggle()
end, { desc = "Window Terminal" })
