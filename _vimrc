
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
Plug 'vim-scripts/a.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ervandew/supertab'
Plug 'neoclide/coc-pairs'
Plug 'gelguy/wilder.nvim'
Plug 'roxma/nvim-yarp'
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
" Plug 'troydm/easytree.vim'
Plug 'thaerkh/vim-workspace'

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
Plug 'yuttie/comfortable-motion.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround' "cs ds ys
Plug 'm1foley/vim-expresso' "g= g== g=$
Plug 'tommcdo/vim-exchange' "cxiw
Plug 'vim-scripts/ReplaceWithRegister' "gr grr
Plug 'bronson/vim-visual-star-search'
" Tabularize /^[^,]*\zs/r1c1l0 (digits are number before ,)
Plug 'godlygeek/tabular' 
Plug 'mg979/vim-visual-multi' "<c-n> n N q Q [ ] <c-down>
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

  let g:coc_global_extensions=[ 'coc-json', 'coc-pairs']
endif

if has_key(g:plugs, 'vim-easymotion')
  nmap <leader>w <plug>(easymotion-w)
  "nmap s <plug>(easymotion-f2)
  nmap <Leader>; <Plug>(easymotion-next)
  nmap <Leader>, <Plug>(easymotion-prev)
endif 

if has_key(g:plugs, 'vim-better-default')
  let g:vim_better_default_minimum            = 0
  let g:vim_better_default_backup_on          = 0
  let g:vim_better_default_persistent_undo    = 0
  let g:vim_better_default_enable_folding     = 1
  let g:vim_better_default_key_mapping        = 1
  let g:vim_better_default_basic_key_mapping  = 1
  let g:vim_better_default_buffer_key_mapping = 1
  let g:vim_better_default_file_key_mapping   = 1
  let g:vim_better_default_fold_key_mapping   = 1
  let g:vim_better_default_window_key_mapping = 1
  runtime! plugin/default.vim
  set norelativenumber
endif
nnoremap gh ^
nnoremap gl $
nnoremap <cr> :
nnoremap <leader>e :e $MYVIMRC<cr>
set lines=45
set columns=110
set cmdheight=2
colorscheme gruvbox
