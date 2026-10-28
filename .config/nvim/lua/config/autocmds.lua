vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
	callback = function(args)
		local path = vim.api.nvim_buf_get_name(args.buf)
		if vim.fn.isdirectory(path) ~= 1 then
			return
		end

		vim.schedule(function()
			if vim.api.nvim_get_current_buf() ~= args.buf then
				return
			end

			vim.cmd.enew()
			vim.api.nvim_buf_delete(args.buf, { force = true })
			Snacks.picker.files({ cwd = path })
		end)
	end,
})
