--============================================================================--
--                               CORE COMPONENT                               --
--============================================================================--

---------------
-- FILE SIZE --
---------------
function Linemode:file_size()
  local cha = self._file.cha
  if cha.is_dir then
    return ""
  end

  local size = self._file:size()
  return size and ya.readable_size(size) or ""
end

------------------------
-- STATUS BAR SYMLINK --
------------------------
Status:children_add(function(self)
  local hovered = self._current.hovered
  if not (hovered and hovered.link_to) then
    return ""
  end

  return " -> " .. tostring(hovered.link_to)
end, 3300, Status.LEFT)

---------------------------
-- STATUS BAR USER/GROUP --
---------------------------
Status:children_add(function()
  local hovered = cx.active.current.hovered
  if not hovered or ya.target_family() ~= "unix" then
    return ""
  end

  local user  = ya.user_name(hovered.cha.uid) or tostring(hovered.cha.uid)
  local group = ya.group_name(hovered.cha.gid) or tostring(hovered.cha.gid)
  return ui.Line {
    ui.Span(user):fg("magenta"),
    ":",
    ui.Span(group):fg("magenta"),
    " ",
  }
end, 500, Status.RIGHT)

--============================================================================--
--                                  PLUGINS                                   --
--============================================================================--

-----------------
-- FULL BORDER --
-----------------
require("full-border"):setup {
  type = ui.Border.ROUNDED,
}
