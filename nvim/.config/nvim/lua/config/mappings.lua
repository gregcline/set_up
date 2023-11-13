local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/mappings.fnl"
local _2amodule_name_2a = "config.mappings"
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
util.noremap("n", "<C-h>", "<C-w>h")
util.noremap("n", "<C-j>", "<C-w>j")
util.noremap("n", "<C-k>", "<C-w>k")
util.noremap("n", "<C-l>", "<C-w>l")
util.noremap("n", "th", ":tabprev<CR>")
util.noremap("n", "tl", ":tabnext<CR>")
return _2amodule_2a