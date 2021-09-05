(module config.plugin.theme
  {autoload {theme material.functions
             nvim aniseed.nvim}})

(set nvim.g.colorscheme "material")

(theme.change_style "palenight")
