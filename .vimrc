set nocompatible
"--------------------------------plugin managment----------------------
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'lifepillar/vim-mucomplete'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'sheerun/vim-polyglot'
Plug 'Chiel92/vim-autoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()


"---------------------------------Key bindings---------------------
" bind leader
let mapleader=","

" save file
nnoremap <leader>s :w<cr>

" binding for tabs
nnoremap th :tabprev<cr>
nnoremap tl :tabnext<cr>
nnoremap tn :tabnew

" bind for explore
noremap <leader>e :Lexplore<cr>

"--------------------------------other vim settings------------------------
" setting tabsize for html
autocmd Filetype html setlocal ts=2 sw=2 expandtab
set backspace=indent,eol,start
set background=dark
colorscheme solarized
" set relativenumber
set number
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
syntax enable
"-------------------------auto commands------------------------------
augroup TrimTrailingWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

au BufWrite * :Autoformat

"----------------------------plugin settings -------------------------

" Lightline
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif
set noshowmode

" mu-complete
set completeopt-=preview
set completeopt+=longest,menuone,noselect

" ctrlp greptool
set grepprg=rg


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
    execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
    execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
    let l:dir = s:opam_share_dir . "/merlin/vim"
    execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
    " Respect package order (merlin should be after ocp-index)
    if count(s:opam_available_tools, tool) > 0
        call s:opam_configuration[tool]()
    endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
