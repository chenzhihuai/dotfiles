" basic setting{{{
source $VIMRUNTIME/defaults.vim

let g:mapleader = " "
set background=dark
" colorscheme habamax
if has('gui_running')
  set background=light
  colorscheme default
endif
set hidden 
set nu
set autoread
set modeline
" search
set smartcase
set ignorecase
" indent
set autoindent
set smarttab	
set shiftwidth=4
" wrap
set linebreak
set breakindent
" wildmenu
set wildoptions+=fuzzy

set formatoptions+=jMm
set shortmess-=S "show search index

if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
  set undodir=/tmp,.
end
nmap <space><space> :w<cr>:so %<cr>


"}}}
" vpack {{{
"Pack 'noscript/elevator.vim'
"Pack 'machakann/vim-highlightedyank'
"Pack 'ervandew/supertab'
"Pack 'scrooloose/nerdtree'
"Pack 'skywind3000/asyncrun.vim'
"Pack 'junegunn/vim-peekaboo'
"Pack 'mg979/vim-visual-multi'
"Pack 'moll/vim-bbye'
"Pack 'scrooloose/nerdcommenter'
"Pack 'godlygeek/tabular'
"Pack 'liuchengxu/vista.vim'
"Pack 'yegappan/mru'
"Pack 'fholgado/minibufexpl.vim'
"Pack 'jeetsukumaran/vim-buffergator'
" }}}
" keymap {{{
nnoremap Y y$
vnoremap < <gv
vnoremap > >gv
vnoremap . :normal .<CR>

noremap H ^
noremap L $

imap <c-backspace> <c-w>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Delete>
cmap cwd cd %:h
cmap mm MRU 

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <leader>e  :e .<cr>

command! W w !sudo tee % > /dev/null
map g1 1<c-w>w
map g2 2<c-w>w
map g3 3<c-w>w
map g4 4<c-w>w
map g5 5<c-w>w
nnoremap Q          :Bdelete<cr>
nnoremap <leader>q  :clo<cr>
" }}}
" plug.conf{{{
let g:SuperTabDefaultCompletionType = "context"
" }}}
" statusline {{{
set statusline=

set statusline+=%F                            " current file path
set statusline+=\                             " blank space
set statusline+=%y                            " filetype
set statusline+=\                             " blank space
set statusline+=%m                            " modified flag [+]
set statusline+=\                             " blank space

set statusline+=%=                            " right-align from now on

set statusline+=%{PasteForStatusline()}       " paste flag
set statusline+=\[%{mode()}\]                 " current mode
set statusline+=\                             " blank space
set statusline+=%v                            " column number
set statusline+=\:                            " colon separator
set statusline+=%l                            " row number
set statusline+=\/                            " slash separator
set statusline+=%L                            " number of rows
set statusline+=\                             " blank space
set statusline+=%{winnr()}                    " buffer number

function! PasteForStatusline()
    let paste_status = &paste
    if paste_status == 1
	return " [paste] "
    else
	return ""
    endif
endfunction
" set statusline+=%#warningmsg#                 " Syntastic error flag
" set statusline+=%{SyntasticStatuslineFlag()}  " Syntastic error flag
" set statusline+=%*                            " Syntastic error flag
" }}}
" vim: fdm=marker fmr={{{,}}} sw=2
