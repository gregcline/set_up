local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/lspconfig.fnl"
local _2amodule_name_2a = "config.plugin.lspconfig"
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
local cmplsp, configs, lsp, nvim = autoload("cmp_nvim_lsp"), autoload("lspconfig.configs"), autoload("lspconfig"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["cmplsp"] = cmplsp
_2amodule_locals_2a["configs"] = configs
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["nvim"] = nvim
local lsp_installer = require("nvim-lsp-installer")
do end (_2amodule_2a)["lsp-installer"] = lsp_installer
vim.fn.sign_define("DiagnosticSignError", {text = "\239\129\151"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "\239\129\177"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "\239\129\154"})
vim.fn.sign_define("DiagnosticSignHint", {text = "\239\129\153"})
do
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, underline = true, virtual_text = false, update_in_insert = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach
  local function _1_(client, bufnr)
    nvim.buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>la", ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "v", "<leader>la", ":lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<cr>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
    return nvim.buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
  end
  on_attach = _1_
  local function _2_(server)
    return server:setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  end
  lsp_installer.on_server_ready(_2_)
end
return _2amodule_2a