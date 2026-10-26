for i = 1, 10 do
	local number_row_key = i % 10
	hl.bind("SUPER + " .. number_row_key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. number_row_key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + M", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
