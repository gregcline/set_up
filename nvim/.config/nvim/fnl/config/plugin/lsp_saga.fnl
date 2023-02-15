(module config.plugin.lsp_saga
  {autoload {nvim aniseed.nvim
             util config.util
             saga lspsaga}})

(saga.init_lsp_saga {})

