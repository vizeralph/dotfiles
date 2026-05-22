local current_path = ...

hl.config({
  animations = require(current_path .. ".animations"),
  cursor = require(current_path .. ".cursor"),
  decoration = require(current_path .. ".decoration"),
  dwindle = require(current_path .. ".dwindle"),
  ecosystem = require(current_path .. ".ecosystem"),
  general = require(current_path .. ".general"),
  gestures = require(current_path .. ".gestures"),
  input = require(current_path .. ".input"),
  master = require(current_path .. ".master"),
  misc = require(current_path .. ".misc"),
  scrolling = require(current_path .. ".scrolling"),
})
