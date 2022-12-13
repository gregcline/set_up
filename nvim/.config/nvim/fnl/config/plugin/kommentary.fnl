(module config.plugin.kommentary
  {autoload {k-config kommentary.config}})

(k-config.configure_language
  :clojure
  {:prefer_single_line_comments true})
