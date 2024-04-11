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
"=== Helper ===
":vimgrep /{pattern}/[g][j][f] {file}
":grep {pattern} {file}
":make
":s/pattern/(&) # surround with ()
":g_ctrl-a # increase columns numbers sequentially
"register "0 = recently yanked text
"register "- = recently deletion

let g:mapleader=' '
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h


" buffers
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>e  :e .<cr>
nnoremap Q          :Bdelete<cr>
nnoremap <leader>q  :clo<cr>

" jump
map <leader>f <plug>(easymotion-bd-f)
map <tab> <plug>(easymotion-bd-f)

map g1 1<c-w>w
map g2 2<c-w>w
map g3 3<c-w>w
map g4 4<c-w>w
map g5 5<c-w>w
map g6 6<c-w>w

command! W w !sudo tee % > /dev/null
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>
nnoremap <leader>: :History:<CR>
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
nmap <silent> gR <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>R <Plug>(coc-rename)
nmap <silent> <leader>D :CocList diagnostics<cr>
nmap <silent> <leader>a :CocCommand clangd.switchSourceHeader<cr>

" align entire buffer
nnoremap =a gg=G''
" save session and quit
nnoremap zz :mks!<cr>:wqa!<cr>
nnoremap <silent> <Leader>sc :nohlsearch<CR>
nnoremap <silent> <Leader>tp :setlocal paste!<CR>

" === Plugs ===
" Install vim-plug if not found
if !exists('$VIMHOME')
    let $VIMHOME=has('nvim') ? stdpath('data') : has('linux') ? $HOME.'/.vim' : $HOME.'/vimfiles'
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
if version >= 900
    Plug 'noscript/elevator.vim'
endif
"Plug 'farmergreg/vim-lastplace'
Plug 'machakann/vim-highlightedyank'
" Enhance Search
" keep pos *-search
Plug 'haya14busa/vim-asterisk'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Language
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/matchit.zip' "extend % to html and latex
"Plug 'puremourning/vimspector'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ervandew/supertab'
Plug 'raimondi/delimitmate'
"Plug 'gelguy/wilder.nvim'
"Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
"Plug 'roxma/vim-hug-neovim-rpc'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'lifepillar/vim-gruvbox8'
Plug 'morhetz/gruvbox'

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
Plug 'jlanzarotta/bufexplorer'
"Plug 'nicwest/bnext.vim'
Plug 'skywind3000/asyncrun.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mhinz/vim-startify'
" peek register
Plug 'junegunn/vim-peekaboo'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'albertomontesg/lightline-asyncrun'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"eval expression with g= g== g=
Plug 'm1foley/vim-expresso'
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

if has_key(g:plugs, 'fzf.vim')
    let g:fzf_preview_window = [] " close preview
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

    let g:fzf_action = {
        \ 'ctrl-q': 'wall | bdelete',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' }

    let g:fzf_history_dir = '~/.local/share/fzf-history'
    if has('win32') || has('win64')
        let g:fzf_preview_bash = 'C:\Program Files\Git\bin\bash.exe'
    endif
endif

if has_key(g:plugs, 'lightline.vim')
    let g:lightline = {
                \ 'colorscheme':'gruvbox',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
                \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'inactive': {
                \   'left': [ [ 'mode'], [ 'fugitive', 'filename' ] ],
                \   'right': [ [ 'syntastic']]
                \ },
                \ 'tabline': {
                \   'left': [ ['buffers'] ],
                \   'right': [ ['close'] ]
                \ },
                \ 'component_function': {
                \   'fugitive': 'LightlineFugitive',
                \   'filename': 'LightlineFilename',
                \   'fileformat': 'LightlineFileformat',
                \   'filetype': 'LightlineFiletype',
                \   'fileencoding': 'LightlineFileencoding',
                \   'mode': 'LightlineMode',
                \   'bufferinfo': 'lightline#buffer#bufferinfo',
                \   'lineinfo': 'LightlineLineinfo',
                \   'percent': 'LightLinePercent',
                \ },
                \ 'component_expand': {
                \   'syntastic': 'SyntasticStatuslineFlag',
                \   'asyncrun_status': 'lightline#asyncrun#status',
                \   'buffers': 'lightline#bufferline#buffers',
                \ },
                \ 'component_type': {
                \   'syntastic': 'error',
                \   'buffers': 'tabsel'
                \ },
                \ 'subseparator': { 'left': '|', 'right': '|' }
                \ }

    function! LightlineLineinfo() abort
        if winwidth(0) < 86
            return ''
        endif

        let l:current_line = printf('%-3s', line('.'))
        let l:current_column = printf('%-2s', col('.'))
        let l:lineinfo = '' . l:current_line . ':' . l:current_column
        return l:lineinfo
    endfunction

    function! LightlineModified()
        return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightlineReadonly()
        return &ft !~? 'help' && &readonly ? 'RO' : ''
    endfunction

    function! LightlineFilename()
        let fname = expand('%:t')
        return fname =~ 'NERD_tree' ? b:NERDTree.root.path.str():
                    \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
                    \ (fname !=# '' ? fname : '[No Name]') .
                    \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
    endfunction

    function! LightlineFugitive()
        try
            if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
                let mark = ''  " edit here for cool mark
                let branch = FugitiveHead()
                return branch !=# '' ? mark.branch : ''
            endif
        catch
        endtry
        return ''
    endfunction

    function! LightlineFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LightlineFiletype()
        return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
    endfunction

    function! LightlineFileencoding()
        return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
    endfunction

    function! LightlineMode()
        return '[#'.winnr().']'
    endfunction


    function! LightLinePercent()
      return winwidth(0) < 70 ? '' : (100 * line('.') / line('$')) . '%'
    endfunction

    function! NearestFunctionOrMethod() abort
        return get(b:, 'vista_nearest_function_or_method':'')
    endfunction

    " Syntastic can call a post-check hook, let's update lightline there
    " For more information: :help syntastic-loclist-callback
    function! SyntasticCheckHook(errors)
        call lightline#update()
    endfunction
endif

    set showtabline=2
if has_key(g:plugs, 'lightline-bufferline')
    nmap <Leader>1 <Plug>lightline#bufferline#go(1)
    nmap <Leader>2 <Plug>lightline#bufferline#go(2)
    nmap <Leader>3 <Plug>lightline#bufferline#go(3)
    nmap <Leader>4 <Plug>lightline#bufferline#go(4)
    nmap <Leader>5 <Plug>lightline#bufferline#go(5)
    nmap <Leader>6 <Plug>lightline#bufferline#go(6)
    nmap <Leader>7 <Plug>lightline#bufferline#go(7)
    nmap <Leader>8 <Plug>lightline#bufferline#go(8)
    nmap <Leader>9 <Plug>lightline#bufferline#go(9)
    nmap <Leader>0 <Plug>lightline#bufferline#go(10)

    nmap <Tab>   <Plug>lightline#bufferline#go_next()
    nmap <S-Tab> <Plug>lightline#bufferline#go_previous()
    nmap <Leader><Tab>   <Plug>lightline#bufferline#go_next_category()
    nmap <Leader><S-Tab> <Plug>lightline#bufferline#go_previous_category()

    nmap <Leader>bl <Plug>lightline#bufferline#move_next()
    nmap <Leader>bh <Plug>lightline#bufferline#move_previous()
    nmap <Leader>bk <Plug>lightline#bufferline#move_first()
    nmap <Leader>bj <Plug>lightline#bufferline#move_last()
    nmap <Leader>bb <Plug>lightline#bufferline#reset_order()

    nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
    let g:lightline#bufferline#show_number=2
    if has('tablineat')
        let g:lightline#bufferline#clickable=1
        let g:lightline.component_raw = {'buffers': 1}
    end
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
colorscheme gruvbox

" wilder.nvim
if has('win64') || has('win32')
    let g:python3_host_prog="C:\\Users\\chenz\\AppData\\Local\\Programs\\Python\\Python312\\python.exe"
endif
if has("gui_running")
    set guifont=consolas:h11
    set lines=999 columns=999
endif

unmenu PopUp
nmenu PopUp.NerdTree <CMD>NERDTree<CR>
nmenu PopUp.FindInTRee <CMD>NERDTreeFind<CR>
nmenu PopUp.DiffThis <CMD>diffthis<CR>
nmenu PopUp.CopyAll <CMD>%yank<CR>
nmenu PopUp.ReplaceAll ggvGp
nmenu PopUp.CopyLine ^y$
nmenu PopUp.Close <CMD>close<CR>
nmap <c-g> <cmd>echo expand('%:p') strftime('modified at %Y/%m/%d %H:%M:%S', getftime(expand('%:p'))) '(CWD:' getcwd()')'<cr>

"nmap <leader>bs :call BufSel()<cr>

command -nargs=? -bang Buffer if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> | let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif | endif
let g:SuperTabDefaultCompletionType = "context"

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

command! Build :call CompileRun()<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %"
    elseif &filetype == 'sh'
        exec "!time bash %"
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!google-chrome % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'matlab'
        exec "!time octave %"
    endif
endfunc
