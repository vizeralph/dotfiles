------------------
-- INSTALLATION --
------------------
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

-------------------
-- CONFIGURATION --
-------------------
require("snacks").setup({
	dashboard = {
		preset = {
			header = [[
 █████   █████    █████    ███████████    ██████████
░░███   ░░███    ░░███    ░█░░░░░░███    ░░███░░░░░█
 ░███    ░███     ░███    ░     ███░      ░███  █ ░ 
 ░███    ░███     ░███         ███        ░██████   
 ░░███   ███      ░███        ███         ░███░░█   
  ░░░█████░       ░███      ████     █    ░███ ░   █
    ░░███         █████    ███████████    ██████████
     ░░░         ░░░░░    ░░░░░░░░░░░    ░░░░░░░░░░ 
			]],
		},
		formats = {
			file = function(item)
				return {
					{
						vim.fn.fnamemodify(item.file, ":t"),
						hl = item.icon == "directory" and "dir" or "file",
					},
				}
			end,

			icon = function(item)
				local icon = item.file and Snacks.dashboard.icon(item.file, item.icon)
					or {
						item.icon,
						hl = "icon",
					}
				icon[1] = icon[1]:gsub("%s+$", "")
				icon.width = vim.api.nvim_strwidth(icon[1])
				return icon
			end,
		},
		sections = {
			{ section = "header" },
			{
				indent = 2,
				padding = 1,
				section = "recent_files",
				icon = " ",
				title = "Recent Files",
				limit = 8,
			},
			{
				indent = 2,
				padding = 1,
				section = "projects",
				icon = " ",
				title = "Projects",
				limit = 8,
				session = false,
			},
		},
	},

	indent = {
		animate = { enabled = false },
		scope = { enabled = false },
	},

	picker = {
		sources = {
			files = {
				matcher = { sort_empty = true },
				sort = {
					fields = {
						"score:desc",
						"file",
						"idx",
					},
				},
				hidden = true,
			},
		},
		layout = { fullscreen = true },
		win = { preview = { wo = { list = true } } },
	},

	terminal = {},
})
