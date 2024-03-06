"==== Keymap =====

let g:mapleader=' '
" everyone must agree
nnoremap H ^
nnoremap L $
nnoremap Y y$
vnoremap < <gv
vnoremap > >gv
nmap j gj
nmap k gk
vmap j gj
vmap k gk
imap <c-backspace> <c-w>
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h

" buffers
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap Q :clo<cr>


" jump
map <leader>w <plug>(easymotion-w)
nmap s <plug>(easymotion-s2)
map <Leader>; <Plug>(easymotion-next)
map <Leader>, <Plug>(easymotion-prev)
map g1 1<c-w>w
map g2 2<c-w>w
map g3 3<c-w>w
map g4 4<c-w>w
map g5 5<c-w>w
map g6 6<c-w>w

command! W w !sudo tee % > /dev/null
nnoremap <leader>cd :lcd %:p:h<cr>
nnoremap <leader>e :e $MYVIMRC<cr>

" fzf
nmap <leader>h :History<cr>
nmap <leader>f :Files<cr>
nmap <leader>B :Buffers<cr>
nmap <leader>rg :Rg<cr>

" coc
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>R <Plug>(coc-rename)
nmap <silent> <leader>E :CocList diagnostics<cr>
nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<cr>

autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
nnoremap <silent> <Leader>sc :nohlsearch<CR>

" ==== Plugs ====
" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : expand('~/vimfiles')
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif


call plug#begin(data_dir . '/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'chenzhihuai/vim-better-default'
Plug 'farmergreg/vim-lastplace'
Plug 'triglav/vim-visual-increment' "Inc/des operators on columns
Plug 'junegunn/vim-slash' "Enhancing search: automatically clear and in-place start-search
Plug 'kana/vim-smartword' "Smart motions on words
Plug 'tpope/vim-repeat' "For surround and speeddating
Plug 'machakann/vim-highlightedyank'
"Plug 'henrik/vim-indexed-search' 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/matchit.zip'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
"Plug 'valloric/matchtagalways'
"Plug 'puremourning/vimspector'
"Plug 'cpiger/NeoDebug'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
Plug 'roxma/vim-hug-neovim-rpc'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'frazrepo/vim-rainbow'
"Plug 'itchyny/vim-cursorword'
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Integrations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'tpope/vim-fugitive' "Git commands
Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
"Plug 'gregsexton/gitv'
Plug 'junegunn/gv.vim' "git commit browser

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" Plug 'troydm/easytree.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'
" Plug 'skywind3000/vim-quickui'
Plug 'junegunn/vim-peekaboo' "peek register
Plug 'chenzhihuai/vim-buftabline'
Plug 'chenzhihuai/vim-statline'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround' "cs ds ys
Plug 'bronson/vim-visual-star-search'
Plug 'godlygeek/tabular' " Tabularize /^[^,]*\zs/r1c1l0 (digits are spaces before ,)
Plug 'mg979/vim-visual-multi' "<c-n> n N q Q [ ] <c-down>

Plug 'm1foley/vim-expresso' "g= g== g=$
Plug 'tommcdo/vim-exchange' "cxiw
Plug 'vim-scripts/ReplaceWithRegister' "gr grr
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

" ==== Plug Configs ====

if has_key(g:plugs, 'wilder.nvim')
    call wilder#setup({ 'modes': [':', '/', '?'], })
    " 'highlighter' : applies highlighting to the candidates
    call wilder#set_option('renderer', wilder#popupmenu_renderer({
                \ 'highlighter': wilder#basic_highlighter(),
                \ 'pumblend': 20,
                \ 'border': 'rounded'
                \ }))
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

if has_key(g:plugs, 'vim-better-default')
    let g:vim_better_default_minimum            = 0
    let g:vim_better_default_backup_on          = 0
    let g:vim_better_default_persistent_undo    = 1
    let g:vim_better_default_enable_folding     = 1
    let g:vim_better_default_key_mapping        = 0
    let g:vim_better_default_basic_key_mapping  = 1
    let g:vim_better_default_buffer_key_mapping = 1
    let g:vim_better_default_file_key_mapping   = 1
    let g:vim_better_default_fold_key_mapping   = 1
    let g:vim_better_default_window_key_mapping = 1
    runtime! plugin/default.vim
    set norelativenumber
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
    sign define vimspectorBP text=o             texthl=WarningMsg
    sign define vimspectorBPCond text=o?        texthl=WarningMsg
    sign define vimspectorBPLog text=!!         texthl=SpellRare
    sign define vimspectorBPDisabled text=o!    texthl=LineNr
    sign define vimspectorPC text=\ >           texthl=MatchParen
    sign define vimspectorPCBP text=o>          texthl=MatchParen
    sign define vimspectorCurrentThread text=>  texthl=MatchParen
    sign define vimspectorCurrentFrame text=>   texthl=Special
endif

if has_key(g:plugs, 'vim-buftabline')
let g:buftabline_numbers=2
let g:buftabline_separators=1
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

" ==== Patches ====

set noincsearch
set nocursorline
"set cmdheight=1
set background=dark
let g:gruvbox_plugin_hi_groups=1
colorscheme gruvbox8

if has('win32') || has('win64')
    set directory=~/vimfiles/tmp/,.
    set backupdir=~/vimfiles/tmp/,.
    set undodir=~/vimfiles/tmp/,.
endif
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

if has("gui_running")
    set guifont=consolas:h11
    set lines=999 columns=999
    "set titlestring=%F\ (PWD:\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')})
    set guioptions-=mT
endif

" wilder.nvim
let g:python3_host_prog="C:\\Users\\chenz\\AppData\\Local\\Programs\\Python\\Python312\\python.exe"

