for _, workspace in ipairs({ "w[tv1]", "f[1]" }) do
	hl.window_rule({
		match = {
			float = false,
			workspace = workspace,
		},

		border_size = 0,
		rounding = 0,
	})

	hl.workspace_rule({
		workspace = workspace,

		gaps_in = 0,
		gaps_out = 0,
	})
end
