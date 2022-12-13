local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/theme.fnl"
local _2amodule_name_2a = "config.plugin.theme"
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
local nvim, theme = autoload("aniseed.nvim"), autoload("material.functions")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["theme"] = theme
nvim.g.colorscheme = "material"
theme.change_style("palenight")
return _2amodule_2a