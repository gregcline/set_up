(module config.plugin.theme
  {autoload {theme material.functions
             nvim aniseed.nvim
             material material
             colors material.colors}})

(material.setup
  {:custom_highlights {:LineNr {:fg :#FFFFFF}}})

(set nvim.g.colorscheme "material")

(theme.change_style "palenight")
