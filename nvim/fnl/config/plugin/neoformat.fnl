(module config.plugin.neoformat
  {autoload {nvim aniseed.nvim
             util config.util
             a aniseed.core}})

(set nvim.g.neoformat_try_node_exe 1)

(nvim.set_keymap :n :<leader>lf "<Cmd>Neoformat prettier<cr>" {:noremap true})

