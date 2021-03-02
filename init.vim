set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source~/.vimrc


set nocompatible
"--------------------------------plugin managment----------------------
call plug#begin()
" disable certain polyglots
let g:polyglot_disabled = ['elm', 'elixir', 'ruby', 'rust', 'python']
" Language plugins
Plug 'vim-ruby/vim-ruby'
Plug 'slashmili/alchemist.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }

Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-surround'
Plug 'lifepillar/vim-mucomplete'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'Chiel92/vim-autoformat'
" Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'kaicataldo/material.vim'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tpope/vim-commentary'
Plug 'Olical/conjure', {'tag': 'v4.14.1'}
Plug 'eraserhd/parinfer-rust'
Plug 'luochen1990/rainbow'
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

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" Back to normal in terminal
tnoremap <C-n> <C-w><S-n>

" Quick testing
nnoremap t<C-f> :TestFile<CR>
nnoremap t<C-n> :TestNearest<CR>
nnoremap t<C-v> :TestVisit<CR>
nnoremap t<C-l> :TestLast<CR>

"--------------------------------other vim settings------------------------
" setting tabsize for html
autocmd Filetype html setlocal ts=2 sw=2 expandtab
set backspace=indent,eol,start
set background=light
" Italics
let g:material_terminal_italics = 1
let g:material_theme_style = 'lighter'
colorscheme material
" set relativenumber
set number
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set splitbelow
set splitright
syntax enable
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Highlight the 80 character line
:set colorcolumn=80
"-------------------------auto commands------------------------------
augroup TrimTrailingWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" au BufWrite * :Autoformat

"----------------------------plugin settings -------------------------

" Lightline
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif
set noshowmode
let g:lightline = { 'colorscheme': 'material_vim' }

" Color
if (has("termguicolors"))
    set termguicolors
endif


" mu-complete
set completeopt-=preview
set completeopt+=longest,menuone,noselect

" ctrlp greptool
set grepprg=rg
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ALE
let g:ale_python_auto_pipenv = 1
let g:ale_python_autopep8_use_global = 1
let g:ale_linters = {'python': ['mypy']}
let g:ale_fixers = {'python': ['yapf', 'isort']}

" Markdown Preview
let g:mkdp_auto_close = 0

" vim-test
let test#strategy = 'vtr'
let test#java#runner = 'gradletest'

" CoC bindings
"GoTo
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
