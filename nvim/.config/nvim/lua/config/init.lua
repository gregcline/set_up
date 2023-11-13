local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/init.fnl"
local _2amodule_name_2a = "config.init"
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
local core, nvim, str, util, _ = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("config.util"), nil
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["util"] = util
_2amodule_locals_2a["_"] = _
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
nvim.ex.set("nowrap")
do
  local options = {completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", splitright = true, splitbelow = true, list = true, listchars = "tab:\194\187\194\183,trail:\194\183,nbsp:\194\183", termguicolors = true, number = true}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
do
  nvim.ex.augroup("TrimTrailingWhitespace")
  nvim.ex.autocmd_()
  do
    nvim.ex.autocmd("BufWritePre", "*", "%s/\\s\\+$//e")
  end
  nvim.ex.augroup("END")
end
require("config.plugin")
require("config.mappings")
return _2amodule_2a