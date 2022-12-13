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
