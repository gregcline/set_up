(module config.mappings
  {autoload {util config.util}})

;; Window navigation
(util.noremap :n :<C-h> :<C-w>h)
(util.noremap :n :<C-j> :<C-w>j)
(util.noremap :n :<C-k> :<C-w>k)
(util.noremap :n :<C-l> :<C-w>l)

;; Tab navigation
(util.noremap :n :th ":tabprev<CR>")
(util.noremap :n :tl ":tabnext<CR>")
(util.noremap :n :tn ":tabnew<CR>")

;; Git hunk navigation
(util.noremap :n :<leader>hj ":lua require\"gitsigns.actions\".next_hunk()<CR>")
(util.noremap :n :<leader>hk ":lua require\"gitsigns.actions\".prev_hunk()<CR>")
