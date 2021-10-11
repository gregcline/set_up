(module config.plugin.kommentary
  {autoload {kommentary kommentary.config}})

(kommentary.configure_language :clojure {:prefer_single_line_comments true})
