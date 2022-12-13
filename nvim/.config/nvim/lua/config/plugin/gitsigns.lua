local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/gitsigns.fnl"
local _2amodule_name_2a = "config.plugin.gitsigns"
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
local gitsigns, util = autoload("gitsigns"), autoload("config.util")
do end (_2amodule_locals_2a)["gitsigns"] = gitsigns
_2amodule_locals_2a["util"] = util
local gs_config
local function _1_(bufnr)
  util.noremap("n", "<leader>hj", ":Gitsigns next_hunk<CR>")
  util.noremap("n", "<leader>hk", ":Gitsigns prev_hunk<CR>")
  util.noremap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
  util.noremap("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
  util.noremap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
  util.noremap("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
  util.noremap("n", "<leader>hS", ":Gitsigns stage_buffer<CR>")
  util.noremap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
  util.noremap("n", "<leader>hR", ":Gitsigns reset_buffer<CR>")
  util.noremap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
  util.noremap("n", "<leader>hb", ":lua require'gitsigns'.blame_line{preview_hunkfull=true}<CR>")
  util.noremap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>")
  util.noremap("n", "<leader>hd", ":Gitsigns diffthis<CR>")
  util.noremap("n", "<leader>hD", ":Gitsigns lua require'gitsigns'.diffthis('~')<CR>")
  return util.noremap("n", "<leader>td", ":Gitsigns toggle_deleted<CR>")
end
gs_config = {on_attach = _1_}
_2amodule_2a["gs-config"] = gs_config
gitsigns.setup(gs_config)
return _2amodule_2a