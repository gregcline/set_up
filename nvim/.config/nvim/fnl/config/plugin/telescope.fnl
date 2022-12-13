(module config.plugin.telescope
  {autoload {nvim aniseed.nvim
             util config.util
             telescope telescope}})

(telescope.setup {:defaults {:file_ignore_patterns ["node_modules"]}
                  :pickers {:find_files {:find_command ["rg" "--files" "--iglob" "!.git" "--hidden"]}}})

(util.noremap :n :<leader>ff ":lua require('telescope.builtin').find_files()<CR>")
(util.noremap :n :<leader>/ ":lua require('telescope.builtin').live_grep()<CR>")
(util.noremap :n :<leader>fb ":lua require('telescope.builtin').buffers()<CR>")
(util.noremap :n :<leader>fh ":lua require('telescope.builtin').help_tags()<CR>")
(util.noremap :n :<leader>fr ":lua require('telescope.builtin').oldfiles()<CR>")
