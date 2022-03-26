(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string}
   require-macros [config.macros]})

;generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;colorscheme
(nvim.command "colorscheme nord")

;don't wrap lines
(nvim.ex.set :nowrap)

;sets a nvim global options
(let [options
      {;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"
       ; split right and below
       :splitright true
       :splitbelow true
       :list true
       :listchars "tab:»·,trail:·,nbsp:·"
       :termguicolors true
       :number true
       :colorcolumn "80"
       :scrolloff 4
       :tabstop 2
       :shiftwidth 2
       :expandtab true}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))


;trim trailing whitespace
(augroup TrimTrailingWhitespace
         (autocmd :BufWritePre :* "%s/\\s\\+$//e"))

;import plugin.fnl
(require :config.plugin)

; import mappings.fnl
(require :config.mappings)
