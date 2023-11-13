local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/telescope.fnl"
local _2amodule_name_2a = "config.plugin.telescope"
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
local nvim, telescope, util = autoload("aniseed.nvim"), autoload("telescope"), autoload("config.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["telescope"] = telescope
_2amodule_locals_2a["util"] = util
telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--hidden"}}}})
util.noremap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
util.noremap("n", "<leader>/", ":lua require('telescope.builtin').live_grep()<CR>")
util.noremap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
util.noremap("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")
util.noremap("n", "<leader>fr", ":lua require('telescope.builtin').oldfiles()<CR>")
return _2amodule_2a