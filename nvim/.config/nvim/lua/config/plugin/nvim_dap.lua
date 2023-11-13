local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/nvim_dap.fnl"
local _2amodule_name_2a = "config.plugin.nvim_dap"
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
local a, dap, dap_vscode_js, dap_vtext, dapui = autoload("aniseed.core"), autoload("dap"), autoload("dap-vscode-js"), autoload("nvim-dap-virtual-text"), autoload("dapui")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["dap"] = dap
_2amodule_locals_2a["dap-vscode-js"] = dap_vscode_js
_2amodule_locals_2a["dap-vtext"] = dap_vtext
_2amodule_locals_2a["dapui"] = dapui
dap_vscode_js.setup({adapters = {"pwa-node"}})
dap.configurations.javascript = {{type = "pwa-node", request = "launch", name = "Debug Jest Tests", runtimeExecutable = "node", runtimeArgs = {"./node_modules/jest/bin/jest.js", "--runInBand"}, rootPath = "${workspaceFolder}", cwd = "${workspaceFolder}", console = "integratedTerminal", internalConsoleOptions = "neverOpen"}, {type = "pwa-node", request = "launch", name = "Launch file", program = "${file}", cwd = "${workspaceFolder}"}}
dap_vtext.setup({})
dapui.setup({})
return _2amodule_2a