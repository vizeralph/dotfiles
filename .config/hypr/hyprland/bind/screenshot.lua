---------------------
-- FOCUSED MONITOR --
---------------------
hl.bind(
	"PRINT",
	hl.dsp.exec_cmd([[
		output=$(hyprctl -j monitors | jq -r '.[] | select(.focused) | .name') &&
		[ -n "$output" ] &&
		grim -o "$output" - | tee "$HOME/Pictures/Screenshot-$(date +%Y%m%d-%H%M%S).png" | wl-copy --type image/png
	]])
)

--------------------
-- SELECT MONITOR --
--------------------
hl.bind(
	"CTRL + PRINT",
	hl.dsp.exec_cmd([[
		output=$(slurp -o -r -f '%o') &&
		[ -n "$output" ] &&
		grim -o "$output" - | tee "$HOME/Pictures/Screenshot-$(date +%Y%m%d-%H%M%S).png" | wl-copy --type image/png
	]])
)

-------------------
-- SELECT WINDOW --
-------------------
hl.bind(
	"ALT + PRINT",
	hl.dsp.exec_cmd([[
		geometry=$(hyprctl -j clients | jq -r '.[] | select(.mapped and (.hidden != true)) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1]) \(.class)"' | slurp -r) &&
		[ -n "$geometry" ] &&
		grim -g "$geometry" - | tee "$HOME/Pictures/Screenshot-$(date +%Y%m%d-%H%M%S).png" | wl-copy --type image/png
	]])
)

-------------------
-- SELECT REGION --
-------------------
hl.bind(
	"CTRL + ALT + PRINT",
	hl.dsp.exec_cmd([[
		geometry=$(slurp) &&
		[ -n "$geometry" ] &&
		grim -g "$geometry" - | tee "$HOME/Pictures/Screenshot-$(date +%Y%m%d-%H%M%S).png" | wl-copy --type image/png
	]])
)
