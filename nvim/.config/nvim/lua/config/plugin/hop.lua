local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/hop.fnl"
local _2amodule_name_2a = "config.plugin.hop"
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
local util = autoload("config.util")
do end (_2amodule_locals_2a)["util"] = util
util.noremap("n", "s", ":HopChar2<CR>")
util.noremap("n", "S", ":HopLine<CR>")
return _2amodule_2a