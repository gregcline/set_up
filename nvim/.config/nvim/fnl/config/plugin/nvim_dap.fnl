(module config.plugin.nvim_dap
  {autoload {a aniseed.core
             dap dap
             dap-vtext nvim-dap-virtual-text
             dapui dapui
             dap-vscode-js dap-vscode-js}})

(dap-vscode-js.setup {:adapters [:pwa-node]})

(set dap.configurations.javascript
 [{:type "pwa-node"
   :request "launch"
   :name "Debug Jest Tests"
   ; -- trace = true, -- include debugger info
   :runtimeExecutable "node"
   :runtimeArgs ["./node_modules/jest/bin/jest.js"
                 "--runInBand"]
   :rootPath "${workspaceFolder}"
   :cwd "${workspaceFolder}"
   :console "integratedTerminal"
   :internalConsoleOptions "neverOpen"}
  {:type "pwa-node"
   :request "launch"
   :name "Launch file"
   :program "${file}"
   :cwd "${workspaceFolder}"}])
  ; {:type "pwa-node"
  ;  :request "attach"
  ;  :name "Attach"
  ;  :processId (dap.utils)
  ;  :cwd "${workspaceFolder}"}])

(dap-vtext.setup {})
(dapui.setup {})
