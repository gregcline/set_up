(module config.plugin.linter
  {autoload {util config.util
             lint lint}})

(set lint.linters_by_ft
     {:javascript [:eslint]})

(util.map :n "<leader>ll" ":lua require(\"lint\").try_lint()<CR>")
