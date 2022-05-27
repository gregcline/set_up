(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#mapping#doc_word "K")
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
(set nvim.g.conjure#client#clojure#nrepl#test#runner "kaocha")
(set nvim.g.conjure#client#clojure#nrepl#test#call_suffix "{:kaocha/color? false, :kaocha/reporter [kaocha.report/dots]}")
(set nvim.g.conjure#client#clojure#nrepl#test#raw_out true)
