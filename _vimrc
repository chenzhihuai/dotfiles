let mapleader="\<space>"

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

" => Basic Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'liuchengxu/vim-better-default'
" Plug 'tpope/vim-sleuth'
Plug 'farmergreg/vim-lastplace'
Plug 'octref/rootignore'
Plug 'roxma/vim-paste-easy'
Plug 'triglav/vim-visual-increment' "<c-v> then <c-a>
Plug 'junegunn/vim-slash'
Plug 'kana/vim-smartword'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-highlightedyank'
"Plug 'henrik/vim-indexed-search' 
" => Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/matchit.zip'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
"Plug 'valloric/matchtagalways'
Plug 'puremourning/vimspector'
"Plug 'cpiger/NeoDebug'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'bfrg/vim-cpp-modern'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'luochen1990/rainbow'
Plug 'itchyny/vim-cursorword'
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Integrations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
"Plug 'gregsexton/gitv'
Plug 'junegunn/gv.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" Plug 'troydm/easytree.vim'
"Plug 'thaerkh/vim-workspace'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'
Plug 'ap/vim-buftabline'
"Plug 'pacha/vem-tabline'
"Plug 'bagrat/vim-buffet'
" Plug 'skywind3000/vim-quickui'
"Plug 'Yilin-Yang/vim-markbar'
Plug 'millermedeiros/vim-statline'
"Plug 'glepnir/spaceline.vim'
"Plug 'rafi/vim-tinyline'
"Plug 'yuttie/comfortable-motion.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround' "cs ds ys
Plug 'bronson/vim-visual-star-search'
Plug 'godlygeek/tabular' " Tabularize /^[^,]*\zs/r1c1l0 (digits are spaces before ,)
Plug 'mg979/vim-visual-multi' "<c-n> n N q Q [ ] <c-down>

Plug 'm1foley/vim-expresso' "g= g== g=$
Plug 'tommcdo/vim-exchange' "cxiw
Plug 'vim-scripts/ReplaceWithRegister' "gr grr
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugs Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
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
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> <leader>R <Plug>(coc-rename)
    nmap <silent> <leader>E :CocList diagnostics<cr>
    nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<cr>
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

if has_key(g:plugs, 'vim-easymotion')
    map <leader>w <plug>(easymotion-w)
    "nmap s <plug>(easymotion-f2)
    map <Leader>; <Plug>(easymotion-next)
    map <Leader>, <Plug>(easymotion-prev)
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

if has_key(g:plugs, 'fzf.vim')
    nmap <leader>h :History<cr>
    nmap <leader>f :Files<cr>
    nmap <leader>B :Buffers<cr>
    nmap <leader>rg :Rg<cr>
    if has('win32')
        let g:fzf_preview_window=[]
    endif
    let g:fzf_history_dir = '~/.local/share/fzf-history'
    let g:fzf_preview_bash = 'C:\Program Files\Git\bin\bash.exe'
endif

nnoremap gh ^
nnoremap gl $
nnoremap bn :bn<cr>
nnoremap bp :bp<cr>
nnoremap bd :bd<cr>
imap <c-backspace> <c-w>
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap Y y$
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <cr> :
nnoremap <leader>e :e $MYVIMRC<cr>
set cmdheight=2
set background=dark
colorscheme gruvbox8

"python support
"let &pythonthreehome=fnamemodify(exepath('python'), ':h:p')
"let &pythonthreedll=&pythonthreehome . '\\python311.dll'

if has("gui_running")
    set lines=999 columns=999
    set titlestring=%F\ (PWD:\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')})
endif
