local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/lsp_saga.fnl"
local _2amodule_name_2a = "config.plugin.lsp_saga"
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
local nvim, saga, util = autoload("aniseed.nvim"), autoload("lspsaga"), autoload("config.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["saga"] = saga
_2amodule_locals_2a["util"] = util
saga.init_lsp_saga({})
return _2amodule_2a