local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/spaceline.fnl"
local _2amodule_name_2a = "config.plugin.spaceline"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, condition, gl, nvim = autoload("aniseed.core"), autoload("galaxyline.condition"), autoload("galaxyline"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["condition"] = condition
_2amodule_locals_2a["gl"] = gl
_2amodule_locals_2a["nvim"] = nvim
local gls = gl.section
_2amodule_locals_2a["gls"] = gls
local colors = {bg = "#282c34", yellow = "#fabd2f", cyan = "#008080", darkblue = "#081633", green = "#afd700", orange = "#FF8800", purple = "#5d4d7a", magenta = "#d16d9e", grey = "#c0c0c0", blue = "#0087d7", red = "#ec5f67"}
_2amodule_locals_2a["colors"] = colors
local left_elements
local function _1_()
  local alias = {n = "NORMAL", i = "INSERT", c = "COMMAND", v = "VISUAL", V = "VISUAL LINE", ["\22"] = "VISUAL BLOCK"}
  return ("  " .. a.get(alias, nvim.fn.mode()) .. " ")
end
local function _2_()
  if not condition.buffer_not_empty() then
    return colors.purple
  else
    return colors.darkblue
  end
end
local function _4_()
  return "  "
end
local function _5_()
  return "  \238\156\165 "
end
local function _6_()
  return " "
end
local function _7_()
  return " "
end
left_elements = {{ViMode = {provider = _1_, separator_highlight = {colors.purple, _2_}, highlight = {colors.darkblue, colors.purple, "bold"}}}, {FileIcon = {provider = {_4_, "FileIcon"}, condition = condition.buffer_not_empty, highlight = {a.get(require("galaxyline.provider_fileinfo"), "get_file_icon_color"), colors.darkblue}}}, {FileName = {provider = {"FileName"}, condition = condition.buffer_not_empty, separator_highlight = {colors.purple, colors.darkblue}, highlight = {colors.magenta, colors.darkblue}}}, {GitIcon = {provider = _5_, condition = condition.buffer_not_empty, highlight = {colors.orange, colors.purple}}}, {GitBranch = {provider = {"GitBranch", _6_}, condition = condition.buffer_not_empty, highlight = {colors.grey, colors.purple}}}, {DiffAdd = {provider = "DiffAdd", condition = condition.checkwidth, icon = " \239\145\151 ", highlight = {colors.green, colors.purple}}}, {DiffModified = {provider = "DiffModified", condition = condition.checkwidth, icon = "\239\145\153 ", highlight = {colors.orange, colors.purple}}}, {DiffRemove = {provider = "DiffRemove", condition = condition.checkwidth, icon = "\239\145\152 ", highlight = {colors.red, colors.purple}}}, {DiagnosticError = {provider = "DiagnosticError", icon = "  \239\129\151 ", highlight = {colors.red, colors.bg}}}, {Space = {provider = _7_}}, {DiagnosticWarn = {provider = "DiagnosticWarn", icon = " \239\129\177 ", highlight = {colors.blue, colors.bg}}}}
_2amodule_locals_2a["left-elements"] = left_elements
local right_elements
local function _8_()
  return " "
end
right_elements = {{FileFormat = {provider = "FileFormat", separator = "\238\130\188", separator_highlight = {colors.bg, colors.purple}, highlight = {colors.grey, colors.purple}}}, {LineInfo = {provider = "LineColumn", separator = " | ", separator_highlight = {colors.darkblue, colors.purple}, highlight = {colors.grey, colors.purple}}}, {PerCent = {provider = {_8_, "LinePercent"}, separator_highlight = {colors.darkblue, colors.purple}, highlight = {colors.grey, colors.darkblue}}}, {ScrollBar = {provider = "ScrollBar", highlight = {colors.yellow, colors.purple}}}}
_2amodule_locals_2a["right-elements"] = right_elements
local function add_elements(section, elements)
  for i, element in pairs(elements) do
    a.assoc(section, i, element)
  end
  return nil
end
_2amodule_locals_2a["add-elements"] = add_elements
add_elements(gls.left, left_elements)
add_elements(gls.right, right_elements)
return _2amodule_2a