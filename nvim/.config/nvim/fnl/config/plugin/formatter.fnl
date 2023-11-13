(module config.plugin.formatter
  {autoload {util config.util
             formatter-util formatter.util
             formatter formatter
             javascript formatter.filetypes.javascript}})

(formatter.setup
  {:filetype {:javascript [javascript.prettier]
              :json [javascript.prettier]}})

(util.map :n "<leader>lf" ":Format<CR>")
