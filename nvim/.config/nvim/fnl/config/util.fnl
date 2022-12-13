(module config.util
  {autoload {nvim aniseed.nvim}})

(defn noremap [mode from to]
  "Sets a mapping with {:noremap true}"
  (nvim.set_keymap mode from to {:noremap true}))

(defn map [mode from to]
  "Sets a mapping"
  (nvim.set_keymap mode from to {}))
