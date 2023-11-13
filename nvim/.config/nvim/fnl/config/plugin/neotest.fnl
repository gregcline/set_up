(module config.plugin.neotest
  {autoload {neotest neotest
             jest neotest-jest
             util config.util}})

(neotest.setup {:quickfix {:enabled false}
                :output {:open_on_run true}
                :adapters [(jest {:jestCommand "npm test --"
                                  :cwd (fn [path] (vim.fn.getcwd))})]})

(def output-window
  "<Cmd>lua require(\"neotest\").output_panel.open()<CR>")

(util.noremap :n :<leader>tn (.. "<Cmd>lua require(\"neotest\").run.run()<CR>"))
(util.noremap :n :<leader>tf (.. "<Cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<CR>"))
(util.noremap :n :<leader>tl (.. "<Cmd>lua require(\"neotest\").run.run_last()<CR>"))
(util.noremap :n :<leader>td (.. "<Cmd>lua require(\"neotest\").run.run({strategy = \"dap\"})<CR>"))
(util.noremap :n :<leader>to output-window)

