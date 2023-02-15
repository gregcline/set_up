(module config.plugin.elixir
  {autoload {elixir elixir
             nvim aniseed.nvim}})

(elixir.setup
  {:settings (elixir.settings {:enableTestLenses true})
   :on_attach
   (fn [client bufnr]
      (let [opts {:noremap true}]
        (nvim.buf_set_keymap bufnr :n :<localleader>r "<Cmd> lua vim.lsp.codelens.run()<CR>" opts)
        (nvim.buf_set_keymap bufnr :n :<localleader>fp ":ElixirFromPipe<CR>" opts)
        (nvim.buf_set_keymap bufnr :n :<localleader>tp ":ElixirToPipe<CR>" opts)
        (nvim.buf_set_keymap bufnr :v :<localleader>em ":ElixirExpandMacro<CR>" opts)
        (nvim.buf_set_keymap bufnr :n :gd "<Cmd>Lspsaga peek_definition<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :K "<Cmd>Lspsaga hover_doc<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>Lspsaga rename<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format({async = true})<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>Lspsaga diagnostic_jump_next<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>Lspsaga diagnostic_jump_prev<CR>" {:noremap true})
        ;telescope
        (nvim.buf_set_keymap bufnr :n :<leader>la ":Lspsaga code_action<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :v :<leader>la ":Lspsaga range_code_action<CR>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
        (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))})
