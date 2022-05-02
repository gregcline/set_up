(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             ts-utils nvim-lsp-ts-utils
             a aniseed.core
             configs lspconfig.configs
             cmplsp cmp_nvim_lsp}})

(def lsp-installer (require "nvim-lsp-installer"))

;symbols to show for lsp diagnostics
; (vim.fn.sign_define "DiagnosticsSignError" {:text ""})
; (vim.fn.sign_define "DiagnosticsSignWarning" {:text ""})
; (vim.fn.sign_define "DiagnosticsSignInformation" {:text ""})
; (vim.fn.sign_define "DiagnosticsSignHint" {:text ""})

(defn lsp-bindings [bufnr]
  (do
    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" {:noremap true})
    ;telescope
    (nvim.buf_set_keymap bufnr :n :<leader>la ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :v :<leader>la ":lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lsb ":lua require('telescope.builtin').lsp_document_symbols()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lsw ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>" {:noremap true})))

(vim.fn.sign_define "DiagnosticSignError" {:text ""})
(vim.fn.sign_define "DiagnosticSignWarn" {:text ""})
(vim.fn.sign_define "DiagnosticSignInfo" {:text ""})
(vim.fn.sign_define "DiagnosticSignHint" {:text ""})

;server features
(def clojure-config {:handlers {"textDocument/publishDiagnostics"
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
                     :capabilities (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
                     :on_attach (fn [client bufnr]
                                  (lsp-bindings bufnr)
                                  (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.formatting()<CR>" {:noremap true}))})

; TS
(def null-ls (require :null-ls))
(null-ls.setup {:sources [null-ls.builtins.diagnostics.eslint_d]})

(def ts-config {:on_attach (fn [client bufnr]
                             (do
                               ; (set client.resolved_capabilities.document_formatting false)
                               ; (set client.resolved_capabilities.document_range_formatting false)

                               (ts-utils.setup {:enable_formatting false
                                                :enable_import_on_completion true
                                                :eslint_enable_diagnostics true
                                                :eslint_bin "eslint_d"})
                               (ts-utils.setup_client client)

                               (lsp-bindings bufnr)

                               (nvim.buf_set_keymap bufnr :n :<leader>lio "<Cmd>TSLspOrganize<CR>" {:noremap true})
                               (nvim.buf_set_keymap bufnr :n :<leader>lia "<Cmd>TSLspImportAll<CR>" {:noremap true})))
                :capabilities (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
                :handlers {"textDocument/publishDiagnostics"
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
                :settings {:typescript {:format {:indentSize 2
                                                 :baseIndentSize 2
                                                 :tabSize 2}}}})

(lsp-installer.on_server_ready
  (fn [server]
    (let [server-configs {:clojure_lsp clojure-config
                          :tsserver ts-config}]
      (server:setup (a.get server-configs server.name)))))
