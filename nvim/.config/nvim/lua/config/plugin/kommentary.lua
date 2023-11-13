local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/kommentary.fnl"
local _2amodule_name_2a = "config.plugin.kommentary"
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
local k_config = autoload("kommentary.config")
do end (_2amodule_locals_2a)["k-config"] = k_config
k_config.configure_language("clojure", {prefer_single_line_comments = true})
return _2amodule_2a