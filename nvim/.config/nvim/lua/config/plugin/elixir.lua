local _2afile_2a = "/Users/greg/.config/nvim/fnl/config/plugin/elixir.fnl"
local _2amodule_name_2a = "config.plugin.elixir"
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
local elixir, nvim = autoload("elixir"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["elixir"] = elixir
_2amodule_locals_2a["nvim"] = nvim
local function _1_(client, bufnr)
  local opts = {noremap = true}
  nvim.buf_set_keymap(bufnr, "n", "<localleader>r", "<Cmd> lua vim.lsp.codelens.run()<CR>", opts)
  nvim.buf_set_keymap(bufnr, "n", "<localleader>fp", ":ElixirFromPipe<CR>", opts)
  nvim.buf_set_keymap(bufnr, "n", "<localleader>tp", ":ElixirToPipe<CR>", opts)
  nvim.buf_set_keymap(bufnr, "v", "<localleader>em", ":ElixirExpandMacro<CR>", opts)
  nvim.buf_set_keymap(bufnr, "n", "gd", "<Cmd>Lspsaga peek_definition<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "K", "<Cmd>Lspsaga hover_doc<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>Lspsaga rename<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>la", ":Lspsaga code_action<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "v", "<leader>la", ":Lspsaga range_code_action<CR>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true})
  nvim.buf_set_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
  return nvim.buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
end
elixir.setup({settings = elixir.settings({enableTestLenses = true}), on_attach = _1_})
return _2amodule_2a