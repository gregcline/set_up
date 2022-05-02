(module config.plugin.indent_blankline
  {autoload {nvim aniseed.nvim
             a aniseed.core
             indent_blankline indent_blankline}})

(def indent-colors
  [:#E06C75
   :#E5C07B
   :#98C379
   :#56B6C2
   :#61AFEF
   :#C678DD])

(each [index color (pairs indent-colors)]
  (nvim.command
    (.. "highlight IndentBlankLineIndent" index " guifg=" color " blend=nocombine")))

(indent_blankline.setup
  {:space_char_blankline " "
   :use_treesitter true
   :enabled false
   ; :char_highlight_list (a.map-indexed
   ;                       (fn [[i _]] (.. "IndentBlankLineIndent" i))
   ;                       indent-colors)
   :char_highlight_list []
   :show_current_context false
   :enabled false})

