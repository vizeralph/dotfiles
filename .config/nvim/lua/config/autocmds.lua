vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "SnacksDashboardUpdatePost",
	callback = function()
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			local buf = vim.api.nvim_win_get_buf(win)

			if vim.bo[buf].filetype == "snacks_dashboard" then
				vim.api.nvim_win_call(win, function()
					local view = vim.fn.winsaveview()
					view.topline = 1
					vim.fn.winrestview(view)
				end)
			end
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		vim.schedule(function()
			if not vim.api.nvim_buf_is_valid(args.buf) then
				return
			end

			if vim.api.nvim_get_current_buf() ~= args.buf then
				return
			end

			if vim.bo[args.buf].filetype == "snacks_dashboard" then
				MiniMap.close()
			elseif vim.bo[args.buf].buftype == "" then
				MiniMap.open()
			end
		end)
	end,
})
