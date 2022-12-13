(module config.plugin.gitsigns
  {autoload {gitsigns gitsigns
             util config.util}})

(def gs-config
  {:on_attach
   (fn [bufnr]
     (util.noremap :n :<leader>hj ":Gitsigns next_hunk<CR>")
     (util.noremap :n :<leader>hk ":Gitsigns prev_hunk<CR>")

     (util.noremap :n :<leader>hs ":Gitsigns stage_hunk<CR>")
     (util.noremap :v :<leader>hs ":Gitsigns stage_hunk<CR>")
     (util.noremap :n :<leader>hr ":Gitsigns reset_hunk<CR>")
     (util.noremap :v :<leader>hr ":Gitsigns reset_hunk<CR>")
     (util.noremap :n :<leader>hS ":Gitsigns stage_buffer<CR>")
     (util.noremap :n :<leader>hu ":Gitsigns undo_stage_hunk<CR>")
     (util.noremap :n :<leader>hR ":Gitsigns reset_buffer<CR>")
     (util.noremap :n :<leader>hp ":Gitsigns preview_hunk<CR>")
     (util.noremap :n :<leader>hb ":lua require'gitsigns'.blame_line{preview_hunkfull=true}<CR>")
     (util.noremap :n :<leader>tb ":Gitsigns toggle_current_line_blame<CR>")
     (util.noremap :n :<leader>hd ":Gitsigns diffthis<CR>")
     (util.noremap :n :<leader>hD ":Gitsigns lua require'gitsigns'.diffthis('~')<CR>")
     (util.noremap :n :<leader>td ":Gitsigns toggle_deleted<CR>"))})

(gitsigns.setup gs-config)

; (gs-config.on_attach)

