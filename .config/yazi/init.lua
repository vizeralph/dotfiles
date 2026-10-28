--============================================================================--
--                               CORE COMPONENT                               --
--============================================================================--

-----------------------
-- SYMLINK INDICATOR --
-----------------------
Entity:children_add(function(self)
	return self._file.link_to and " " or ""
end, 4500)

------------------------
-- STATUS BAR SYMLINK --
------------------------
Status:children_add(function(self)
	local hovered = self._current.hovered
	if not (hovered and hovered.link_to) then
		return ""
	end

	return " ➤ " .. tostring(hovered.link_to)
end, 3300, Status.LEFT)

---------------------------
-- STATUS BAR USER/GROUP --
---------------------------
Status:children_add(function()
	local hovered = cx.active.current.hovered
	if not hovered or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line({
		ui.Span(ya.user_name(hovered.cha.uid) or tostring(hovered.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(hovered.cha.gid) or tostring(hovered.cha.gid)):fg("magenta"),
		" ",
	})
end, 500, Status.RIGHT)

--============================================================================--
--                                  PLUGINS                                   --
--============================================================================--

-----------------
-- FULL BORDER --
-----------------
require("full-border"):setup()
