" basic setting{{{
source $VIMRUNTIME/defaults.vim

let g:mapleader = " "
set background=dark
" colorscheme habamax
if has('gui_running')
  colorscheme default
  set background=light
  set guioptions-=rL
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
nmap <leader>S :e $MYVIMRC<CR>


"}}}
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
nnoremap <leader>e  :e %:h<cr>

command! W w !sudo tee % > /dev/null
map g1 1<c-w>w
map g2 2<c-w>w
map g3 3<c-w>w
map g4 4<c-w>w
map g5 5<c-w>w
nnoremap Q          :Bdelete<cr>
nnoremap <leader>q  :clo<cr>
" }}}
" plugins {{{
"
let g:buffergator_viewport_split_policy='n'
let g:SuperTabDefaultCompletionType = "context"
let g:rainbow_active = 1
let g:buftabline_show=1
let g:buftabline_indicators=1
let g:buftabline_separators=1
let g:buftabline_numbers=2
"hi! link TabLine TabLineFill
"hi! link BufTabLineActive TabLineFill

"nmap <leader>1 <Plug>BufTabLine.Go(1)
"nmap <leader>2 <Plug>BufTabLine.Go(2)
"nmap <leader>3 <Plug>BufTabLine.Go(3)
"nmap <leader>4 <Plug>BufTabLine.Go(4)
"nmap <leader>5 <Plug>BufTabLine.Go(5)
"nmap <leader>6 <Plug>BufTabLine.Go(6)
"nmap <leader>7 <Plug>BufTabLine.Go(7)
"nmap <leader>8 <Plug>BufTabLine.Go(8)
"nmap <leader>9 <Plug>BufTabLine.Go(9)
"nmap <leader>0 <Plug>BufTabLine.Go(10)
"nmap <backspace> <Plug>BufTabLine.Go(-1)
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
" }}}
" vim: fdm=marker fmr={{{,}}} sw=2

