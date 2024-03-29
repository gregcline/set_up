(module config.plugin.lspconfig
  {autoload {a aniseed.core
             nvim aniseed.nvim
             lsp lspconfig
             configs lspconfig.configs
             cmplsp cmp_nvim_lsp
             lspsaga lspsaga
             mason mason
             mason-lspconfig mason-lspconfig}})

(mason.setup {})
(mason-lspconfig.setup {})

;symbols to show for lsp diagnostics
(vim.fn.sign_define "DiagnosticSignError" {:text ""})
(vim.fn.sign_define "DiagnosticSignWarn" {:text ""})
(vim.fn.sign_define "DiagnosticSignInfo" {:text ""})
(vim.fn.sign_define "DiagnosticSignHint" {:text ""})

;server features
(let [handlers {"textDocument/publishDiagnostics"
                (vim.lsp.with
                  vim.lsp.diagnostic.on_publish_diagnostics
                  {:severity_sort true
                   :update_in_insert false
                   :underline true
                   :virtual_text false})
                "textDocument/hover"
                (vim.lsp.with
                  vim.lsp.handlers.hover
                  {:border "single"})
                "textDocument/signatureHelp"
                (vim.lsp.with
                  vim.lsp.handlers.signature_help
                  {:border "single"})}
      capabilities (cmplsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))
      on_attach (fn [client bufnr]
                  (do
                    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>Lspsaga peek_definition<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :K "<Cmd>Lspsaga hover_doc<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>Lspsaga rename<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" {:noremap true})
                    ; (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format({async = true})<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>Lspsaga diagnostic_jump_next<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>Lspsaga diagnostic_jump_prev<CR>" {:noremap true})
                    ;telescope
                    (nvim.buf_set_keymap bufnr :n :<leader>la ":Lspsaga code_action<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :v :<leader>la ":Lspsaga range_code_action<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))]

  ;; Clojure
  ; (lsp.clojure_lsp.setup {:on_attach on_attach
  ;                         :handlers handlers
  ;                         :capabilities capabilities
  ;                         :cmd ["clojure-lsp"]})
  ; (lsp-installer.on_server_ready
  ;   (fn [server]
  ;     (server:setup (a.get server_map server.name)))))

  (lspsaga.setup {})
  (lsp.tsserver.setup {:on_attach on_attach
                       :handlers handlers
                       :capabilities capabilities})
  (lsp.terraformls.setup {:on_attach on_attach
                          :handlers handlers
                          :capabilities capabilities})
  (lsp.yamlls.setup {:on_attach on_attach
                     :handlers handlers
                     :capabilities capabilities}))
