" basic setting{{{
source $VIMRUNTIME/defaults.vim

let g:mapleader = " "
set background=dark
" colorscheme habamax
if has('gui_running')
  colorscheme default
  set background=light
endif
set hidden 
set nu
set autoread
set modeline
set belloff=all
" search
set smartcase
set ignorecase
" indent
set autoindent
set smarttab	
set shiftwidth=4
" wrap
set nowrap
set linebreak
set breakindent
" wildmenu
set wildoptions+=fuzzy

set formatoptions+=jMm
set shortmess-=S "show search index

set noswapfile
set autoread
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
  set undodir=/tmp,.
end
nmap <space><space> :w<cr>:so %<cr>


"}}}
" vpack {{{
"cat a.vim | grep '^"pack .*/.*' | awk '{print $2}' | xargs -l echo vpack install
"pack noscript/elevator.vim
"pack machakann/vim-highlightedyank
"pack ervandew/supertab
"pack scrooloose/nerdtree
"pack skywind3000/asyncrun.vim
"pack junegunn/vim-peekaboo
"pack mg979/vim-visual-multi
"pack moll/vim-bbye
"pack scrooloose/nerdcommenter
"pack godlygeek/tabular
"pack liuchengxu/vista.vim
"pack yegappan/mru
"pack fholgado/minibufexpl.vim
"pack jeetsukumaran/vim-buffergator
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
"filename
hi default link User1 Identifier
" flags
hi default link User2 Statement
" errors
hi default link User3 Error
set statusline=

set statusline+=♯%{winnr()}\                  " buffer number
set statusline+=%<
set statusline+=%F                            " current file path
set statusline+=\                             
set statusline+=%2*%h%w%m%r%*
set statusline+=\                             

set statusline+=%=                            " right-align from now on

set statusline+=%y                            " filetype
set statusline+=\                             
set statusline+=[%{&ff}%{strlen(&fenc)?'→'.&fenc:''}]
set statusline+=%{PasteForStatusline()}       " paste flag
" set statusline+=\[%{mode()}\]                 " current mode
set statusline+=\                             

set statusline+=%-10(\ L%l:C%c\ %)

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
