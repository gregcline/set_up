local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/lightspeed.fnl"
local _2amodule_name_2a = "config.plugin.lightspeed"
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
local lightspeed, util = autoload("lightspeed"), autoload("config.util")
do end (_2amodule_locals_2a)["lightspeed"] = lightspeed
_2amodule_locals_2a["util"] = util
lightspeed.setup({ignore_case = true})
util.map("n", "s", "<Plug>Lightspeed_omni_s")
util.map("n", "gs", "<Plug>Lightspeed_omni_gs")
return _2amodule_2a