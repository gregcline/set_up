local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/indent_blankline.fnl"
local _2amodule_name_2a = "config.plugin.indent_blankline"
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
local a, indent_blankline, nvim = autoload("aniseed.core"), autoload("indent_blankline"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["indent_blankline"] = indent_blankline
_2amodule_locals_2a["nvim"] = nvim
local indent_colors = {"#E06C75", "#E5C07B", "#98C379", "#56B6C2", "#61AFEF", "#C678DD"}
_2amodule_2a["indent-colors"] = indent_colors
for index, color in pairs(indent_colors) do
  nvim.command(("highlight IndentBlankLineIndent" .. index .. " guifg=" .. color .. " blend=nocombine"))
end
indent_blankline.setup({space_char_blankline = " ", char_highlight_list = {}, enabled = false, show_current_context = false})
return _2amodule_2a