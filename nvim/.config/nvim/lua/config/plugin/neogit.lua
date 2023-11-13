local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/neogit.fnl"
local _2amodule_name_2a = "config.plugin.neogit"
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
local neogit = autoload("neogit")
do end (_2amodule_locals_2a)["neogit"] = neogit
neogit.setup({})
return _2amodule_2a