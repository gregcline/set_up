(module config.plugin.lightspeed
  {autoload {leap leap
             flit flit
             util config.util}})

(leap.add_default_mappings)
(vim.api.nvim_set_hl 0 :LeapBackdrop { :link :Comment})
(vim.api.nvim_set_hl 0 :LeapMatch {:fg :white  ; for light themes, set to 'black' or similar
                                   :bold true
                                   :nocombine true})

(set leap.opts.highlight_unlabeled_phase_one_targets true)
(flit.setup)

; (util.map :n :s "<Plug>Lightspeed_omni_s")
; (util.map :n :gs "<Plug>Lightspeed_omni_gs")
