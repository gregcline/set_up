local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/neotest.fnl"
local _2amodule_name_2a = "config.plugin.neotest"
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
local jest, neotest, util = autoload("neotest-jest"), autoload("neotest"), autoload("config.util")
do end (_2amodule_locals_2a)["jest"] = jest
_2amodule_locals_2a["neotest"] = neotest
_2amodule_locals_2a["util"] = util
local function _1_(path)
  return vim.fn.getcwd()
end
neotest.setup({quickfix = {enabled = false}, output = {open_on_run = true}, adapters = {jest({jestCommand = "npm test --", cwd = _1_})}})
local output_window = "<Cmd>lua require(\"neotest\").output_panel.open()<CR>"
_2amodule_2a["output-window"] = output_window
util.noremap("n", "<leader>tn", "<Cmd>lua require(\"neotest\").run.run()<CR>")
util.noremap("n", "<leader>tf", "<Cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<CR>")
util.noremap("n", "<leader>tl", "<Cmd>lua require(\"neotest\").run.run_last()<CR>")
util.noremap("n", "<leader>td", "<Cmd>lua require(\"neotest\").run.run({strategy = \"dap\"})<CR>")
util.noremap("n", "<leader>to", output_window)
return _2amodule_2a