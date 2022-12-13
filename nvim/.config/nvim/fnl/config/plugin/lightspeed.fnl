(module config.plugin.lightspeed
  {autoload {lightspeed lightspeed
             util config.util}})

(lightspeed.setup
  {:ignore_case true})

(util.map :n :s "<Plug>Lightspeed_omni_s")
(util.map :n :gs "<Plug>Lightspeed_omni_gs")
