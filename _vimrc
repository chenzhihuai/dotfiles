"=== Key Binding === {{{
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

nnoremap <leader><space>  :so ~/.vimrc<cr>
" buffers
nnoremap <leader>e  :e .<cr>
nnoremap Q          :Bdelete<cr>
nnoremap <leader>q  :Bdelete<cr>
cmap m<space> MRU<space>
nnoremap <leader>]b :bnext<cr>
nnoremap <leader>[b :bprev<cr>

" jump
"nmap <c-g> <plug>(easymotion-s2)

map g1 1<c-w>w
map g2 2<c-w>w
map g3 3<c-w>w
map g4 4<c-w>w
map g5 5<c-w>w
map g6 6<c-w>w

command! W w !sudo tee % > /dev/null
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>
nnoremap <leader>: :History:<CR>
nnoremap <leader>E :e $MYVIMRC<cr>
nnoremap <leader>T :so $MYVIMRC<cr>
nmap <leader>S :Startify<cr>

" fzf
nmap <leader>h :History<cr>
nmap <leader>f :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>m :FZFMru<cr>
nmap <leader>rg :Rg<cr>


" align entire buffer
nnoremap <silent> <Leader>sc :nohlsearch<CR>
nnoremap <silent> <Leader>tp :setlocal paste!<CR>
" }}}

" === Plugs === {{{
" Install vim-plug if not found
if !exists('$VIMHOME')
    let $VIMHOME=has('nvim') ? stdpath('data') : has('linux') ? $HOME.'/.vim' : $HOME.'/vimfiles'
endif
if empty(glob($VIMHOME. '/autoload/plug.vim'))
    silent execute '!curl -fLo '.$VIMHOME.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($VIMHOME. '/plugged')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'chenzhihuai/vim-default-improved'
Plug 'jeetsukumaran/vim-buffergator'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Integrations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Git
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

"Files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'liuchengxu/vista.vim'
Plug 'scrooloose/nerdtree'
Plug 'wincent/ferret' "Ack ...

"Terminal
Plug 'skywind3000/asyncrun.vim'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/vim-terminal-help' "terminal like vscode : alt+=
Plug 'voldikss/vim-floaterm'
"Plug 'puremourning/vimspector'
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 900
    Plug 'noscript/elevator.vim'
endif
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-peekaboo'
Plug 'morhetz/gruvbox'

" statusline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'albertomontesg/lightline-asyncrun'
Plug 'josa42/vim-lightline-coc'

" search
Plug 'machakann/vim-highlightedyank'
Plug 'markonm/traces.vim'
Plug 'pgdouyon/vim-evanesco'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-sneak'
Plug 'andymass/vim-matchup'
"cs ds ys and v_S
Plug 'machakann/vim-sandwich'
Plug 'junegunn/vim-easy-align'
"<c-n> n N q Q [ ] <c-down>
Plug 'mg979/vim-visual-multi'
"eval expression with g= g== g=
" resize font via ^= ^- and ^mouse
Plug 'gorkunov/smartpairs.vim'

"buffer
Plug 'moll/vim-bbye'
Plug 'yegappan/mru'
Plug 'schickling/vim-bufonly'
Plug 'nanotee/zoxide.vim'
Plug 'danro/rename.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
"}}}

" === Plug Configs === {{{
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
    let s:p = {'help':'Help', 'vista':'Tag', 'nerdtree':'Dir','unite': 'Unite', 'vimfiler': 'VimFiler', 'quickrun': 'Quickrun', 'dictionary': 'Dictionary', 'calendar': 'Calendar', 'thumbnail': 'Thumbnail', 'agit' : 'Agit', 'agit_diff' : 'Agit', 'agit_stat' : 'Agit', 'qf': 'QuickFix' }
    function! LightlinePowerfulMode() abort
        if &ft ==# 'calendar'
            call lightline#link("nvV\<C-v>"[b:calendar.visual_mode()])
        elseif &ft ==# 'thumbnail'
            if !empty(b:thumbnail.view.visual_mode)
                call lightline#link(b:thumbnail.view.visual_mode)
            endif
        endif
        return get(s:p, &ft, lightline#mode())
    endfunction
    let g:lightline = {
                \ 'colorscheme':'gruvbox',
                \ 'active': {
                \   'left': [ [ 'mode','paste', 'coc_errors' ], [ 'fugitive'],['filename'] ],
                \   'right': [ [ 'syntastic', 'lineinfo' ], ['fileinfo'], [ 'filetype' ] ]
                \ },
                \ 'inactive': {
                \   'left': [['filename']],
                \   'right': [['lineinfo']]
                \ },
                \ 'component': {
                \   'lineinfo':'%{%winwidth(0)>70?"%3l:%-2c☰%3p%%":""%}'
                \ }, 
                \ 'component_visible_condition': {
                    \ 'lineinfo': 'fname =~# "NERD_tree"'
                  \ },
                \ 'component_function': {
                \   'fugitive': 'LightlineFugitive',
                \   'filename': 'LightlineFilename',
                \   'filetype': 'LightlineFiletype',
                \   'fileinfo': 'LightlineFileinfo',
                \   'mode': 'LightlinePowerfulMode',
                \ },
                \ 'component_expand': {
                \   'syntastic': 'SyntasticStatuslineFlag',
                \   'buffers': 'lightline#bufferline#buffers'
                \ },
                \ 'component_type': {
                \   'syntastic': 'error',
                \   'buffers': 'tabsel'
                \ },
                \ 'separator': { 'left': '', 'right': '' },
                \ 'subseparator': { 'left': '', 'right': '' },
                \ 'tabline': {
                \   'left': [ ['buffers'] ],
                \   'right': [ ['close'] ]
                \ }
                \ }
    call lightline#coc#register()
    let g:lightline#bufferline#ordinal_number_map = {
                \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
                \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
    function! LightlineModified()
        return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! LightlineReadonly()
        return &ft !~? 'help' && &readonly ? '' : ''
    endfunction

    function! LightlineFilename()
	  let fname = expand('%:t')
	  return fname ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
	        \ fname =~# '^__Tagbar__\|__Gundo' ? '' :
            \ fname =~# '^NERD_tree' ? b:NERDTree.root.path.str() :
	        \ &ft ==# 'vimfiler' ? vimfiler#get_status_string() :
	        \ &ft ==# 'unite' ? unite#get_status_string() :
	        \ &ft ==# 'vimshell' ? vimshell#get_status_string() :
            \ fname =~# '^\[preview' ? 'Preview' :
	        \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
	        \ (fname !=# '' ? fname : '[No Name]') .
	        \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
	endfunction

    let s:e = {
      \ 'vimfiler' : 'vimfiler#get_status_string()',
      \ 'unite' : 'unite#get_status_string()',
      \ 'quickrun' : "''",
      \ 'qf' : "''",
      \ 'dictionary' : "exists('b:dictionary.input') ? b:dictionary.input : default",
      \ 'calendar' : "strftime('%Y/%m/%d')",
      \ 'thumbnail' : "exists('b:thumbnail.status') ? b:thumbnail.status : 'Thumbnail'",
      \ 'agit' : "''",
      \ 'agit_diff' : "''",
      \ 'agit_stat' : "''",
      \ '[Command Line]': "'Command Line'",
      \ }
    let s:f = [ 'vimfiler', 'unite', 'dictionary', 'thumbnail' ]
    function! LightlinePowerfulFilename() abort
        let f = expand('%:t')

        if f=~# '^NERD_tree'
            return b:NERDTree.root.path.str()
        endif
        if has_key(b:, 'lightline_filename') && get(b:, 'lightline_filename_', '') ==# f . &mod . &ma . &ft && (&ft ==# '' || index(s:f, &ft) < 0 && index(s:f, f) < 0)
            return b:lightline_filename
        endif
        let b:lightline_filename_ = f . &mod . &ma . &ft
        let default = join(filter([&ro ? 'RO' : '', f, &mod ? '+' : &ma ? '' : '-'], 'len(v:val)'), ' ')
        let b:lightline_filename = &ft ==# '' && f ==# '' ? 'No Name' : f =~# '^\[preview' ? 'Preview' : eval(get(s:e, &ft, get(s:e, f, 'default')))
        return b:lightline_filename
    endfunction
    function! LightlineFugitive()
        try
            if expand('%:t') !~? 'Tagbar\|Gundo\|NERD\|__vista__' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
                let mark = ''  " edit here for cool mark
                let branch = FugitiveHead()
                return branch !=# '' ? mark.branch : ''
            endif
        catch
        endtry
        return ''
    endfunction


    let g:ignore_ft={'help':'', 'nerdtree':''}
    function! LightlineFiletype()
        return winwidth(0) > 70 ? (&filetype !=# '' ? get(g:ignore_ft, &filetype, &filetype): '') : ''
    endfunction

    function! LightlineFileinfo()
        let fenc=&fenc !=# '' ? &fenc : &enc
        return winwidth(0) > 70 ? (fenc."[". &fileformat."]") : ''
    endfunction

    function! LightlineMode()
        let fname = expand('%:t')
        return fname =~# '^__Tagbar__' ? 'Tagbar' :
                    \ fname ==# 'ControlP' ? 'CtrlP' :
                    \ fname ==# '__Gundo__' ? 'Gundo' :
                    \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
                    \ fname =~# 'NERD_tree' ? b:NERDTree.root.path.str() :
                    \ &ft ==# 'unite' ? 'Unite' :
                    \ &ft ==# 'vimfiler' ? 'VimFiler' :
                    \ &ft ==# 'vimshell' ? 'VimShell' :
                    \ winwidth(0) > 60 ? lightline#mode() : ''
    endfunction

    function! CtrlPMark()
        if expand('%:t') ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
            call lightline#link('iR'[g:lightline.ctrlp_regex])
            return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                        \ , g:lightline.ctrlp_next], 0)
        else
            return ''
        endif
    endfunction

    let g:ctrlp_status_func = {
                \ 'main': 'CtrlPStatusFunc_1',
                \ 'prog': 'CtrlPStatusFunc_2',
                \ }

    function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
        let g:lightline.ctrlp_regex = a:regex
        let g:lightline.ctrlp_prev = a:prev
        let g:lightline.ctrlp_item = a:item
        let g:lightline.ctrlp_next = a:next
        return lightline#statusline(0)
    endfunction

    function! CtrlPStatusFunc_2(str)
        return lightline#statusline(0)
    endfunction

    let g:tagbar_status_func = 'TagbarStatusFunc'

    function! TagbarStatusFunc(current, sort, fname, ...) abort
        return lightline#statusline(0)
    endfunction

    " Syntastic can call a post-check hook, let's update lightline there
    " For more information: :help syntastic-loclist-callback
    function! SyntasticCheckHook(errors)
        call lightline#update()
    endfunction

    let g:unite_force_overwrite_statusline = 0
    let g:vimfiler_force_overwrite_statusline = 0
    let g:vimshell_force_overwrite_statusline = 0
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

" L/R/T/B/N
let g:buffergator_viewport_split_policy='R'
let g:terminal_list=0 "hidden tereminal-helper in tabline

"}}}
"
"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" vim: fdm=marker fmr={{{,}}}
