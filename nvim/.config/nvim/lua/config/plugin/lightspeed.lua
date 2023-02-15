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
local flit, leap, util = autoload("flit"), autoload("leap"), autoload("config.util")
do end (_2amodule_locals_2a)["flit"] = flit
_2amodule_locals_2a["leap"] = leap
_2amodule_locals_2a["util"] = util
leap.add_default_mappings()
vim.api.nvim_set_hl(0, "LeapBackdrop", {link = "Comment"})
vim.api.nvim_set_hl(0, "LeapMatch", {fg = "white", bold = true, nocombine = true})
leap.opts.highlight_unlabeled_phase_one_targets = true
flit.setup()
return _2amodule_2a