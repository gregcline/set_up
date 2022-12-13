(module config.plugin.hop
  {autoload {util config.util}})

(util.noremap :n :s ":HopChar2<CR>")
(util.noremap :n :S ":HopLine<CR>")
