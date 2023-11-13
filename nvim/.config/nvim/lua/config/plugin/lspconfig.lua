local _2afile_2a = "/Users/eftqd/.config/nvim/fnl/config/plugin/lspconfig.fnl"
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
local a, cmplsp, configs, lsp, lspsaga, mason, mason_lspconfig, nvim = autoload("aniseed.core"), autoload("cmp_nvim_lsp"), autoload("lspconfig.configs"), autoload("lspconfig"), autoload("lspsaga"), autoload("mason"), autoload("mason-lspconfig"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["cmplsp"] = cmplsp
_2amodule_locals_2a["configs"] = configs
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["lspsaga"] = lspsaga
_2amodule_locals_2a["mason"] = mason
_2amodule_locals_2a["mason-lspconfig"] = mason_lspconfig
_2amodule_locals_2a["nvim"] = nvim
mason.setup({})
mason_lspconfig.setup({})
vim.fn.sign_define("DiagnosticSignError", {text = "\239\129\151"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "\239\129\177"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "\239\129\154"})
vim.fn.sign_define("DiagnosticSignHint", {text = "\239\129\153"})
do
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, underline = true, virtual_text = false, update_in_insert = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local on_attach
  local function _1_(client, bufnr)
    nvim.buf_set_keymap(bufnr, "n", "gd", "<Cmd>Lspsaga peek_definition<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "K", "<Cmd>Lspsaga hover_doc<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>Lspsaga rename<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>la", ":Lspsaga code_action<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "v", "<leader>la", ":Lspsaga range_code_action<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
    return nvim.buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
  end
  on_attach = _1_
  lspsaga.setup({})
  lsp.tsserver.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.terraformls.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.yamlls.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
end
return _2amodule_2a