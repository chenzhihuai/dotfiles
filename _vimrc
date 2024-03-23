"=== Key Binding ===
" ctrl-w }  : open tag in preview window
" zz        : save session and quit
" <space>be : openbufexplorer
" Q         : del buffer without close window
" <space>q  : close window
" g{num}    : focus on window <num>
" <space>bn : buf next
" ]b        : buf next
" <space>bp : buf previous
" [b        : buf previous
" <space>bd : buf delete
" <space>e  : file explorer
" <space>F  : fzf files
" <space>H  : fzf history
" <space>B  : fzf buffers
" @: or @;  : repeat last command
" <leader>: : repeat last command
"
" gr or grr : replace with register
" <c-down>  : multi-cursor 
"=== Keymap ===

let g:mapleader=' '
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h

" align entire buffer
nnoremap =a gg=G''
" save session and quit
nnoremap zz :mks!<cr>:wqa!<cr>

" buffers
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>e :e .<cr>
nnoremap Q :Bdelete<cr>
nnoremap <leader>q :clo<cr>

" jump
map <leader><space> <plug>(easymotion-bd-f)
"nmap s <plug>(easymotion-s2)
"map <Leader>; <Plug>(easymotion-next)
"map <Leader>, <Plug>(easymotion-prev)
map g1 1<c-w>w
map g2 2<c-w>w
map g3 3<c-w>w
map g4 4<c-w>w
map g5 5<c-w>w
map g6 6<c-w>w

command! W w !sudo tee % > /dev/null
nnoremap <leader>cd :lcd %:p:h<cr>
nnoremap <leader>: @:
nnoremap <leader>; @:
nnoremap <leader>E :e $MYVIMRC<cr>
nnoremap <leader>T :so $MYVIMRC<cr>
nmap <leader>S :Startify<cr>

" fzf
nmap <leader>H :History<cr>
nmap <leader>F :Files<cr>
nmap <leader>B :Buffers<cr>
nmap <leader>rg :Rg<cr>

" coc
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>R <Plug>(coc-rename)
nmap <silent> <leader>D :CocList diagnostics<cr>
nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<cr>

nnoremap <silent> <Leader>sc :nohlsearch<CR>
nnoremap <silent> <Leader>tp :setlocal paste!<CR>

" === Plugs ===
" Install vim-plug if not found
if !exists('$VIMHOME')
    if has('nvim')
        let $VIMHOME=stdpath('data')
    elseif has('win32') || has ('win64')
        let $VIMHOME=$HOME.'/vimfiles'
    else
        let $VIMHOME=$HOME.'/.vim'
    endif
endif
if empty(glob($VIMHOME. '/autoload/plug.vim'))
    silent execute '!curl -fLo '.$VIMHOME.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif


call plug#begin($VIMHOME. '/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'chenzhihuai/vim-default-improved'
if has(version >= 900)
    Plug 'noscript/elevator.vim'
endif
Plug 'farmergreg/vim-lastplace'
Plug 'kana/vim-smartword'
Plug 'machakann/vim-highlightedyank'
Plug 'wincent/terminus'
" Enhance Search
"Plug 'henrik/vim-indexed-search'
" keep pos *-search
Plug 'haya14busa/vim-asterisk'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/matchit.zip'
"Plug 'puremourning/vimspector'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ervandew/supertab'
Plug 'raimondi/delimitmate'
Plug 'gelguy/wilder.nvim'
"Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
"Plug 'roxma/vim-hug-neovim-rpc'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'lifepillar/vim-gruvbox8'
Plug 'lifepillar/vim-solarized8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Integrations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git commands
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" tagbar enhancement
Plug 'liuchengxu/vista.vim'
Plug 'scrooloose/nerdtree'
Plug 'el-iot/buffer-tree'
Plug 'jlanzarotta/bufexplorer'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'
" peek register
Plug 'junegunn/vim-peekaboo'
Plug 'chenzhihuai/vim-buftabline'
Plug 'chenzhihuai/vim-statline'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-sneak'
"cs ds ys and v_S
Plug 'machakann/vim-sandwich'
" Tabularize /^[^,]*\zs/r1c1l0 (digits are spaces before ,)
Plug 'godlygeek/tabular'
"<c-n> n N q Q [ ] <c-down>
Plug 'mg979/vim-visual-multi'
"<c-v> then <c-a> or <c-x> to increase/descrease numbers
Plug 'triglav/vim-visual-increment'
"eval expression with g= g== g=
Plug 'm1foley/vim-expresso'
"cxiw
Plug 'tommcdo/vim-exchange'
"gr grr
Plug 'vim-scripts/ReplaceWithRegister'
"close file without close window
Plug 'moll/vim-bbye'
" resize font via ^= ^- and ^mouse
Plug 'eggbean/resize-font.gvim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

" === Plug Configs ===

if has_key(g:plugs, 'wilder.nvim')
    call wilder#setup({'modes': [':', '/', '?']})

    call wilder#set_option('pipeline', [
                \   wilder#branch(
                \     wilder#cmdline_pipeline(),
                \     wilder#search_pipeline(),
                \   ),
                \ ])

    call wilder#set_option('renderer', wilder#wildmenu_renderer({
                \ 'highlighter': wilder#basic_highlighter(),
                \ }))
    call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
                \ 'highlights': {
                    \   'border': 'Normal',
                    \ },
                    \ 'border': 'rounded',
                    \ })))
endif
if has_key(g:plugs, 'coc.nvim')
    inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#pum#next(1) :
                \ CheckBackspace() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_global_extensions=[ 'coc-json', 'coc-clangd', 'coc-pyright']
    function! s:show_documentation()
        if &filetype == 'vim'
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
endif

if has_key(g:plugs, 'vimspector')
    let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
    let g:vimspector_base_dir=expand('~/.vim/.vimspectorjson')
    function! s:read_template_into_buffer(template)
        " has to be a function to avoid the extra space fzf#run insers otherwise
        execute '0r ~/.vim/.vimspectorjson/'.a:template
    endfunction
    command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
                \   'source': 'ls -1 ' . g:vimspector_base_dir,
                \   'down': 20,
                \   'sink': function('<sid>read_template_into_buffer')
                \ })

    noremap <leader>db :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
endif

if has_key(g:plugs, 'vim-buftabline')
let g:buftabline_numbers=2
let g:buftabline_separators=0
    nmap <leader>1 <Plug>BufTabLine.Go(1)
    nmap <leader>2 <Plug>BufTabLine.Go(2)
    nmap <leader>3 <Plug>BufTabLine.Go(3)
    nmap <leader>4 <Plug>BufTabLine.Go(4)
    nmap <leader>5 <Plug>BufTabLine.Go(5)
    nmap <leader>6 <Plug>BufTabLine.Go(6)
    nmap <leader>7 <Plug>BufTabLine.Go(7)
    nmap <leader>8 <Plug>BufTabLine.Go(8)
    nmap <leader>9 <Plug>BufTabLine.Go(9)
    nmap <leader>0 <Plug>BufTabLine.Go(10)
endif
if has_key(g:plugs, 'fzf.vim')
    if has('win32')
        let g:fzf_preview_window=[]
    endif
    let g:fzf_history_dir = '~/.local/share/fzf-history'
    let g:fzf_preview_bash = 'C:\Program Files\Git\bin\bash.exe'
endif
if has_key(g:plugs, 'vim-sandwich')
    runtime macros/sandwich/keymap/surround.vim
endif
if has_key(g:plugs, 'vim-asterisk')
    map *  <Plug>(asterisk-z*)
    map #  <Plug>(asterisk-z#)
    map g* <Plug>(asterisk-gz*)
    map g# <Plug>(asterisk-gz#)
    let g:asterisk#keeppos = 1
endif

" === Patches ===
" split vertically by default
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping=0
set background=dark
let g:gruvbox_plugin_hi_groups=1
colorscheme gruvbox8

if has("gui_running")
    set guifont=consolas:h11
    set lines=999 columns=999
endif

let g:fzf_preview_window = [] " close preview
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

let g:fzf_action = {
    \ 'ctrl-q': 'wall | bdelete',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

unmenu PopUp
nmenu PopUp.NerdTree <CMD>NERDTree<CR>
nmenu PopUp.FindInTRee <CMD>NERDTreeFind<CR>
nmenu PopUp.DiffThis <CMD>diffthis<CR>
nmenu PopUp.CopyAll <CMD>%yank<CR>
nmenu PopUp.ReplaceAll ggvGp
nmenu PopUp.CopyLine ^y$
nmenu PopUp.Close <CMD>close<CR>

" wilder.nvim
if has('win64') || has('win32')
    let g:python3_host_prog="C:\\Users\\chenz\\AppData\\Local\\Programs\\Python\\Python312\\python.exe"
endif

nmap gb :call wilder#disable()<cr>:BufferTree<cr>:buffer<space>
