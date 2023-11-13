local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/linter.fnl"
local _2amodule_name_2a = "config.plugin.linter"
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
local lint, util = autoload("lint"), autoload("config.util")
do end (_2amodule_locals_2a)["lint"] = lint
_2amodule_locals_2a["util"] = util
lint.linters_by_ft = {javascript = {"eslint"}}
util.map("n", "<leader>ll", ":lua require(\"lint\").try_lint()<CR>")
return _2amodule_2a