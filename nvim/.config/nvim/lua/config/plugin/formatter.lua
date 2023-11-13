local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/formatter.fnl"
local _2amodule_name_2a = "config.plugin.formatter"
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
local formatter, formatter_util, javascript, util = autoload("formatter"), autoload("formatter.util"), autoload("formatter.filetypes.javascript"), autoload("config.util")
do end (_2amodule_locals_2a)["formatter"] = formatter
_2amodule_locals_2a["formatter-util"] = formatter_util
_2amodule_locals_2a["javascript"] = javascript
_2amodule_locals_2a["util"] = util
formatter.setup({filetype = {javascript = {javascript.prettier}, json = {javascript.prettier}}})
util.map("n", "<leader>lf", ":Format<CR>")
return _2amodule_2a