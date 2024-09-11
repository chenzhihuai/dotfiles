let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <Plug>(operator-sandwich-gv) gv
inoremap <Plug>(operator-sandwich-g@) g@
inoremap <silent> <Plug>(peekaboo) :call peekaboo#aboo()
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <silent> <expr> <Plug>delimitMateS-BS delimitMate#WithinEmptyPair() ? "\<Del>" : "\<S-BS>"
inoremap <silent> <Plug>delimitMateBS =delimitMate#BS()
imap <silent> <C-Y>m <Plug>(emmet-merge-lines)
inoremap <Plug>(emmet-merge-lines) =emmet#util#closePopup()=emmet#mergeLines()
imap <silent> <C-Y>A <Plug>(emmet-anchorize-summary)
inoremap <Plug>(emmet-anchorize-summary) =emmet#util#closePopup()=emmet#anchorizeURL(1)
imap <silent> <C-Y>a <Plug>(emmet-anchorize-url)
inoremap <Plug>(emmet-anchorize-url) =emmet#util#closePopup()=emmet#anchorizeURL(0)
imap <silent> <C-Y>k <Plug>(emmet-remove-tag)
inoremap <Plug>(emmet-remove-tag) =emmet#util#closePopup()=emmet#removeTag()
imap <silent> <C-Y>j <Plug>(emmet-split-join-tag)
inoremap <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
imap <silent> <C-Y>/ <Plug>(emmet-toggle-comment)
inoremap <Plug>(emmet-toggle-comment) =emmet#util#closePopup()=emmet#toggleComment()
imap <silent> <C-Y>I <Plug>(emmet-image-encode)
inoremap <Plug>(emmet-image-encode) =emmet#util#closePopup()=emmet#imageEncode()
imap <silent> <C-Y>i <Plug>(emmet-image-size)
inoremap <Plug>(emmet-image-size) =emmet#util#closePopup()=emmet#imageSize()
inoremap <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
inoremap <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
imap <silent> <C-Y>N <Plug>(emmet-move-prev)
inoremap <Plug>(emmet-move-prev) =emmet#util#closePopup()=emmet#moveNextPrev(1)
imap <silent> <C-Y>n <Plug>(emmet-move-next)
inoremap <Plug>(emmet-move-next) =emmet#util#closePopup()=emmet#moveNextPrev(0)
imap <silent> <C-Y>D <Plug>(emmet-balance-tag-outword)
inoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
imap <silent> <C-Y>d <Plug>(emmet-balance-tag-inward)
inoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
imap <silent> <C-Y>u <Plug>(emmet-update-tag)
inoremap <Plug>(emmet-update-tag) =emmet#util#closePopup()=emmet#updateTag()
imap <silent> <C-Y>; <Plug>(emmet-expand-word)
inoremap <Plug>(emmet-expand-word) =emmet#util#closePopup()=emmet#expandAbbr(1,"")
imap <silent> <C-Y>, <Plug>(emmet-expand-abbr)
inoremap <Plug>(emmet-expand-abbr) =emmet#util#closePopup()=emmet#expandAbbr(0,"")
inoremap <silent> <Plug>NERDCommenterInsert :call nerdcommenter#Comment('i', "Insert")
cnoremap <F23> <Nop>
cnoremap <F22> <Nop>
inoremap <expr> <F22> terminus#private#paste('')
inoremap <silent> <F21> :silent doautocmd <nomodeline> FocusGained %
inoremap <silent> <F20> :silent doautocmd <nomodeline> FocusLost %
cnoremap <silent> <F21> eterminus#private#focus_gained()
cnoremap <silent> <F20> eterminus#private#focus_lost()
cnoremap <expr> <Down> wilder#can_accept_completion()  ?  wilder#accept_completion()  :  '<Down>'
cnoremap <expr> <Up> wilder#can_reject_completion()  ?  wilder#reject_completion()  :  '<Up>'
cnoremap <expr> <S-Tab> wilder#in_context()  ?  wilder#previous()  :  '<S-Tab>'
imap <C-BS> 
vmap  <Plug>VisualIncrement
nnoremap  h
nnoremap <NL> j
nnoremap  k
nnoremap  l
xmap <nowait>  <Plug>(VM-Find-Subword-Under)
nmap <nowait>  <Plug>(VM-Find-Under)
vmap  <Plug>VisualDecrement
vmap <silent> c <Plug>(emmet-code-pretty)
nmap <silent> m <Plug>(emmet-merge-lines)
nmap <silent> A <Plug>(emmet-anchorize-summary)
nmap <silent> a <Plug>(emmet-anchorize-url)
nmap <silent> k <Plug>(emmet-remove-tag)
nmap <silent> j <Plug>(emmet-split-join-tag)
nmap <silent> / <Plug>(emmet-toggle-comment)
nmap <silent> I <Plug>(emmet-image-encode)
nmap <silent> i <Plug>(emmet-image-size)
nmap <silent> N <Plug>(emmet-move-prev)
nmap <silent> n <Plug>(emmet-move-next)
vmap <silent> D <Plug>(emmet-balance-tag-outword)
nmap <silent> D <Plug>(emmet-balance-tag-outword)
vmap <silent> d <Plug>(emmet-balance-tag-inward)
nmap <silent> d <Plug>(emmet-balance-tag-inward)
nmap <silent> u <Plug>(emmet-update-tag)
nmap <silent> ; <Plug>(emmet-expand-word)
vmap <silent> , <Plug>(emmet-expand-abbr)
nmap <silent> , <Plug>(emmet-expand-abbr)
nmap  ca <Plug>NERDCommenterAltDelims
xmap  cu <Plug>NERDCommenterUncomment
nmap  cu <Plug>NERDCommenterUncomment
xmap  cb <Plug>NERDCommenterAlignBoth
nmap  cb <Plug>NERDCommenterAlignBoth
xmap  cl <Plug>NERDCommenterAlignLeft
nmap  cl <Plug>NERDCommenterAlignLeft
nmap  cA <Plug>NERDCommenterAppend
xmap  cy <Plug>NERDCommenterYank
nmap  cy <Plug>NERDCommenterYank
xmap  cs <Plug>NERDCommenterSexy
nmap  cs <Plug>NERDCommenterSexy
xmap  ci <Plug>NERDCommenterInvert
nmap  ci <Plug>NERDCommenterInvert
nmap  c$ <Plug>NERDCommenterToEOL
xmap  cn <Plug>NERDCommenterNested
nmap  cn <Plug>NERDCommenterNested
xmap  cm <Plug>NERDCommenterMinimal
nmap  cm <Plug>NERDCommenterMinimal
xmap  c  <Plug>NERDCommenterToggle
nmap  c  <Plug>NERDCommenterToggle
xmap  cc <Plug>NERDCommenterComment
nmap  cc <Plug>NERDCommenterComment
nmap  0 <Plug>BufTabLine.Go(10)
nmap  9 <Plug>BufTabLine.Go(9)
nmap  8 <Plug>BufTabLine.Go(8)
nmap  7 <Plug>BufTabLine.Go(7)
nmap  6 <Plug>BufTabLine.Go(6)
nmap  5 <Plug>BufTabLine.Go(5)
nmap  4 <Plug>BufTabLine.Go(4)
nmap  3 <Plug>BufTabLine.Go(3)
nmap  2 <Plug>BufTabLine.Go(2)
nmap  1 <Plug>BufTabLine.Go(1)
nnoremap <silent>  sc :nohlsearch
nmap <silent>  a :CocCommand clangd.switchSourceHeader
nmap <silent>  E :CocList diagnostics
nmap <silent>  R <Plug>(coc-rename)
nmap  rg :Rg
nmap  B :Buffers
nmap  F :Files
nmap  H :History
nnoremap  e :e $MYVIMRC
nnoremap  cd :lcd %:p:h
map    <Plug>(easymotion-bd-f)
nnoremap  bd :bd
nnoremap  bp :bp
nnoremap  bn :bn
nnoremap  q :qa!
map # <Plug>(asterisk-z#)
map * <Plug>(asterisk-z*)
nmap . <Plug>(operator-sandwich-dot)
vnoremap < <gv
nnoremap =a gg=G''
vnoremap > >gv
nnoremap H ^
nnoremap L $
nnoremap Q :bd
xmap S <Plug>(sandwich-add)
xmap X <Plug>(Exchange)
nnoremap Y y$
nmap [C 9999[c
nmap [c <Plug>(signify-prev-hunk)
vmap [% [%m'gv``
nmap <silent> [g <Plug>(coc-diagnostic-prev)
xmap <nowait> \\c <Plug>(VM-Visual-Cursors)
nmap <nowait> \\gS <Plug>(VM-Reselect-Last)
nmap <nowait> \\/ <Plug>(VM-Start-Regex-Search)
nmap <nowait> \\\ <Plug>(VM-Add-Cursor-At-Pos)
xmap <nowait> \\a <Plug>(VM-Visual-Add)
xmap <nowait> \\f <Plug>(VM-Visual-Find)
xmap <nowait> \\/ <Plug>(VM-Visual-Regex)
xmap <nowait> \\A <Plug>(VM-Visual-All)
nmap <nowait> \\A <Plug>(VM-Select-All)
nmap ]C 9999]c
nmap ]c <Plug>(signify-next-hunk)
vmap ]% ]%m'gv``
nmap <silent> ]g <Plug>(coc-diagnostic-next)
vmap a% [%v]%
nmap cxx <Plug>(ExchangeLine)
nmap cxc <Plug>(ExchangeClear)
nmap cx <Plug>(Exchange)
nmap css <Plug>(sandwich-replace-auto)
nmap cs <Plug>(sandwich-replace)
nmap dss <Plug>(sandwich-delete-auto)
nmap ds <Plug>(sandwich-delete)
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xmap gr <Plug>ReplaceWithRegisterVisual
nmap grr <Plug>ReplaceWithRegisterLine
map g# <Plug>(asterisk-gz#)
map g* <Plug>(asterisk-gz*)
nmap gr <Plug>ReplaceWithRegisterOperator
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gd <Plug>(coc-definition)
map g6 6w
map g5 5w
map g4 4w
map g3 3w
map g2 2w
map g1 1w
vmap j gj
nmap j gj
vmap k gk
nmap k gk
nmap ys <Plug>(sandwich-add)
nnoremap zz :mks!:wqa!
snoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
nnoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
snoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
nnoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
snoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
nnoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
snoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
nnoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
snoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
snoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
nnoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
snoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
snoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
nnoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
snoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
nnoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
snoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
nnoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
snoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
nnoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
snoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
nnoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
snoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
nnoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
snoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
nnoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
snoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
nnoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
snoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
snoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
nnoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
snoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
snoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
nnoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
snoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
nnoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
snoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
nnoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
snoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
nnoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
snoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
nnoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
snoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
nnoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
snoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
nnoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
snoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
nnoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
snoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
nnoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
snoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
snoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
nnoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
snoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
snoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
nnoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
snoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
nnoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
snoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
snoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
nnoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
snoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
nnoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
snoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
nnoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
snoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
nnoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
snoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
nnoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
snoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
nnoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
snoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
nnoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
snoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
nnoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
snoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
nnoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
snoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
nnoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
snoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
nnoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
snoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
nnoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
snoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
nnoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
snoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
nnoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
snoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
nnoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
snoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
nnoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
snoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
nnoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
snoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
nnoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
snoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
nnoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
snoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
nnoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
snoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
nnoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
snoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
nnoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
snoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
nnoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
snoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
nnoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
snoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
nnoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
snoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
nnoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
snoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
nnoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
snoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
nnoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
snoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
nnoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
snoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
nnoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
snoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
nnoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
snoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
nnoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
snoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
nnoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
snoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
nnoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
snoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
nnoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
snoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
nnoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
snoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1,0)
nnoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1,0)
snoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(0,1,1)
nnoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(0,1,1)
snoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2,0)
nnoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2,0)
snoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0,0)
nnoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0,0)
snoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(0,0,1)
nnoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(0,0,1)
snoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
nnoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
snoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
nnoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
snoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
nnoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
snoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
nnoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
snoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
nnoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
snoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
nnoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
snoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
nnoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
snoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
nnoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
snoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
nnoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
snoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
nnoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
snoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
nnoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
snoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
nnoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
snoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
nnoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
snoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
nnoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal!' ReplaceWithRegister#VisualMode()|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
vnoremap <silent> <Plug>ReplaceWithRegisterVisual :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterVisual", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterVisual")
nnoremap <silent> <Plug>ReplaceWithRegisterLine :call setline('.', getline('.'))|execute 'silent! call repeat#setreg("\<Plug>ReplaceWithRegisterLine", v:register)'|call ReplaceWithRegister#SetRegister()|if ReplaceWithRegister#IsExprReg()|    let g:ReplaceWithRegister_expr = getreg('=')|endif|execute 'normal! V' . v:count1 . "_\<Esc>"|call ReplaceWithRegister#Operator('visual', "\<Plug>ReplaceWithRegisterLine")
nnoremap <silent> <Plug>ReplaceWithRegisterExpressionSpecial :let g:ReplaceWithRegister_expr = getreg('=')|execute 'normal!' v:count1 . '.'
nnoremap <expr> <Plug>ReplaceWithRegisterOperator ReplaceWithRegister#OperatorExpression()
vmap <C-X> <Plug>VisualDecrement
vmap <C-A> <Plug>VisualIncrement
nmap <nowait> <C-Down> <Plug>(VM-Add-Cursor-Down)
xmap <nowait> <C-N> <Plug>(VM-Find-Subword-Under)
nmap <nowait> <C-Up> <Plug>(VM-Add-Cursor-Up)
nmap <nowait> <S-Right> <Plug>(VM-Select-l)
nmap <nowait> <S-Left> <Plug>(VM-Select-h)
nmap <nowait> <C-N> <Plug>(VM-Find-Under)
nnoremap <silent> <Plug>(VM-Select-BBW) :call vm#commands#motion('BBW', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-gE) :call vm#commands#motion('gE', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-ge) :call vm#commands#motion('ge', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-E) :call vm#commands#motion('E', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-e) :call vm#commands#motion('e', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-B) :call vm#commands#motion('B', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-b) :call vm#commands#motion('b', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-W) :call vm#commands#motion('W', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-w) :call vm#commands#motion('w', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-l) :call vm#commands#motion('l', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-k) :call vm#commands#motion('k', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-j) :call vm#commands#motion('j', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-h) :call vm#commands#motion('h', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Mouse-Column) :call vm#commands#mouse_column()
nmap <silent> <Plug>(VM-Mouse-Word) <Plug>(VM-Left-Mouse)<Plug>(VM-Find-Under)
nmap <silent> <Plug>(VM-Mouse-Cursor) <Plug>(VM-Left-Mouse)<Plug>(VM-Add-Cursor-At-Pos)
nnoremap <silent> <Plug>(VM-Left-Mouse) <LeftMouse>
xnoremap <silent> <Plug>(VM-Visual-Regex) :call vm#commands#find_by_regex(2):call feedkeys('/', 'n')
nnoremap <silent> <Plug>(VM-Slash-Search) @=vm#commands#find_by_regex(3)
nnoremap <silent> <Plug>(VM-Start-Regex-Search) @=vm#commands#find_by_regex(1)
nnoremap <silent> <Plug>(VM-Find-Under) :call vm#commands#ctrln(v:count1)
xnoremap <silent> <Plug>(VM-Visual-Reduce) :call vm#visual#reduce()
xnoremap <silent> <Plug>(VM-Visual-Add) :call vm#commands#visual_add()
xnoremap <silent> <Plug>(VM-Visual-Cursors) :call vm#commands#visual_cursors()
nnoremap <silent> <Plug>(VM-Select-All) :call vm#commands#find_all(0, 1)
nnoremap <silent> <Plug>(VM-Reselect-Last) :call vm#commands#reselect_last()
nnoremap <silent> <Plug>(VM-Select-Cursor-Up) :call vm#commands#add_cursor_up(1, v:count1)
nnoremap <silent> <Plug>(VM-Select-Cursor-Down) :call vm#commands#add_cursor_down(1, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Up) :call vm#commands#add_cursor_up(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Down) :call vm#commands#add_cursor_down(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Word) :call vm#commands#add_cursor_at_word(1, 1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Pos) :call vm#commands#add_cursor_at_pos(0)
xmap <silent> <expr> <Plug>(VM-Visual-Find) vm#operators#find(1, 1)
xnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-a) textobj#sandwich#query('x', 'a', {}, [])
onoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-a) textobj#sandwich#query('o', 'a', {}, [])
nnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-a) textobj#sandwich#query('n', 'a', {}, [])
xnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-i) textobj#sandwich#query('x', 'i', {}, [])
onoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-i) textobj#sandwich#query('o', 'i', {}, [])
nnoremap <silent> <expr> <Plug>(textobj-sandwich-literal-query-i) textobj#sandwich#query('n', 'i', {}, [])
xnoremap <silent> <expr> <Plug>(textobj-sandwich-query-a) textobj#sandwich#query('x', 'a')
onoremap <silent> <expr> <Plug>(textobj-sandwich-query-a) textobj#sandwich#query('o', 'a')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-query-a) textobj#sandwich#query('n', 'a')
xnoremap <silent> <expr> <Plug>(textobj-sandwich-query-i) textobj#sandwich#query('x', 'i')
onoremap <silent> <expr> <Plug>(textobj-sandwich-query-i) textobj#sandwich#query('o', 'i')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-query-i) textobj#sandwich#query('n', 'i')
xnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-a) textobj#sandwich#auto('x', 'a')
onoremap <silent> <expr> <Plug>(textobj-sandwich-auto-a) textobj#sandwich#auto('o', 'a')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-a) textobj#sandwich#auto('n', 'a')
xnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-i) textobj#sandwich#auto('x', 'i')
onoremap <silent> <expr> <Plug>(textobj-sandwich-auto-i) textobj#sandwich#auto('o', 'i')
nnoremap <silent> <expr> <Plug>(textobj-sandwich-auto-i) textobj#sandwich#auto('n', 'i')
nmap <silent> <Plug>(sandwich-replace-auto) <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> <Plug>(sandwich-delete-auto) <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
xmap <silent> <Plug>(sandwich-replace) <Plug>(operator-sandwich-replace)
nmap <silent> <Plug>(sandwich-replace) <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
xmap <silent> <Plug>(sandwich-delete) <Plug>(operator-sandwich-delete)
nmap <silent> <Plug>(sandwich-delete) <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
omap <silent> <Plug>(sandwich-add) <Plug>(operator-sandwich-add)
xmap <silent> <Plug>(sandwich-add) <Plug>(operator-sandwich-add)
nmap <silent> <Plug>(sandwich-add) <Plug>(operator-sandwich-add)
xnoremap <silent> <Plug>(textobj-sandwich-tag-a) :call sandwich#magicchar#t#at()
xnoremap <silent> <Plug>(textobj-sandwich-tag-i) :call sandwich#magicchar#t#it()
onoremap <silent> <Plug>(textobj-sandwich-tag-a) :call sandwich#magicchar#t#at()
onoremap <silent> <Plug>(textobj-sandwich-tag-i) :call sandwich#magicchar#t#it()
xnoremap <silent> <Plug>(textobj-sandwich-tagname-a) :call sandwich#magicchar#t#a()
xnoremap <silent> <Plug>(textobj-sandwich-tagname-i) :call sandwich#magicchar#t#i()
onoremap <silent> <Plug>(textobj-sandwich-tagname-a) :call sandwich#magicchar#t#a()
onoremap <silent> <Plug>(textobj-sandwich-tagname-i) :call sandwich#magicchar#t#i()
xnoremap <silent> <Plug>(textobj-sandwich-function-a) :call sandwich#magicchar#f#a('x')
xnoremap <silent> <Plug>(textobj-sandwich-function-ap) :call sandwich#magicchar#f#ap('x')
onoremap <silent> <Plug>(textobj-sandwich-function-a) :call sandwich#magicchar#f#a('o')
onoremap <silent> <Plug>(textobj-sandwich-function-ap) :call sandwich#magicchar#f#ap('o')
xnoremap <silent> <Plug>(textobj-sandwich-function-i) :call sandwich#magicchar#f#i('x')
xnoremap <silent> <Plug>(textobj-sandwich-function-ip) :call sandwich#magicchar#f#ip('x')
onoremap <silent> <Plug>(textobj-sandwich-function-i) :call sandwich#magicchar#f#i('o')
onoremap <silent> <Plug>(textobj-sandwich-function-ip) :call sandwich#magicchar#f#ip('o')
nnoremap <Plug>(operator-sandwich-gv) gv
noremap <Plug>(operator-sandwich-g@) g@
noremap <silent> <Plug>(operator-sandwich-replace-visualrepeat) :call operator#sandwich#visualrepeat('replace')
noremap <silent> <Plug>(operator-sandwich-delete-visualrepeat) :call operator#sandwich#visualrepeat('delete')
noremap <silent> <Plug>(operator-sandwich-add-visualrepeat) :call operator#sandwich#visualrepeat('add')
nnoremap <silent> <expr> <Plug>(operator-sandwich-dot) operator#sandwich#dot()
nnoremap <silent> <expr> <Plug>(operator-sandwich-predot) operator#sandwich#predot()
onoremap <silent> <expr> <Plug>(operator-sandwich-squash-count) operator#sandwich#squash_count()
onoremap <silent> <expr> <Plug>(operator-sandwich-release-count) operator#sandwich#release_count()
onoremap <silent> <expr> <Plug>(operator-sandwich-synchro-count) operator#sandwich#synchro_count()
xnoremap <silent> <Plug>(operator-sandwich-replace-query1st) :call operator#sandwich#query1st('replace', 'x')
nnoremap <silent> <Plug>(operator-sandwich-replace-query1st) :call operator#sandwich#query1st('replace', 'n')
xnoremap <silent> <Plug>(operator-sandwich-add-query1st) :call operator#sandwich#query1st('add', 'x')
nnoremap <silent> <Plug>(operator-sandwich-add-query1st) :call operator#sandwich#query1st('add', 'n')
xnoremap <silent> <Plug>(operator-sandwich-replace-pre) :call operator#sandwich#prerequisite('replace', 'x')
nnoremap <silent> <Plug>(operator-sandwich-replace-pre) :call operator#sandwich#prerequisite('replace', 'n')
xnoremap <silent> <Plug>(operator-sandwich-delete-pre) :call operator#sandwich#prerequisite('delete', 'x')
nnoremap <silent> <Plug>(operator-sandwich-delete-pre) :call operator#sandwich#prerequisite('delete', 'n')
xnoremap <silent> <Plug>(operator-sandwich-add-pre) :call operator#sandwich#prerequisite('add', 'x')
nnoremap <silent> <Plug>(operator-sandwich-add-pre) :call operator#sandwich#prerequisite('add', 'n')
omap <silent> <Plug>(operator-sandwich-replace) <Plug>(operator-sandwich-g@)
xmap <silent> <Plug>(operator-sandwich-replace) <Plug>(operator-sandwich-replace-pre)<Plug>(operator-sandwich-gv)<Plug>(operator-sandwich-g@)
nmap <silent> <Plug>(operator-sandwich-replace) <Plug>(operator-sandwich-replace-pre)<Plug>(operator-sandwich-g@)
omap <silent> <Plug>(operator-sandwich-delete) <Plug>(operator-sandwich-g@)
xmap <silent> <Plug>(operator-sandwich-delete) <Plug>(operator-sandwich-delete-pre)<Plug>(operator-sandwich-gv)<Plug>(operator-sandwich-g@)
nmap <silent> <Plug>(operator-sandwich-delete) <Plug>(operator-sandwich-delete-pre)<Plug>(operator-sandwich-g@)
omap <silent> <Plug>(operator-sandwich-add) <Plug>(operator-sandwich-g@)
xmap <silent> <Plug>(operator-sandwich-add) <Plug>(operator-sandwich-add-pre)<Plug>(operator-sandwich-gv)<Plug>(operator-sandwich-g@)
nmap <silent> <Plug>(operator-sandwich-add) <Plug>(operator-sandwich-add-pre)<Plug>(operator-sandwich-g@)
xnoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(1)
onoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
noremap <silent> <Plug>(easymotion-dotrepeat) :call EasyMotion#DotRepeat()
xnoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(1)
onoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
xnoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(1,1)
onoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
xnoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(1,0)
onoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
xnoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(1,0)
onoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
xnoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(1,0)
onoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
xnoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(1,2)
onoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
xnoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(1,2)
onoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
xnoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(1,1)
onoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
xnoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(1,1)
onoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
xnoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(1,0)
onoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
xnoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(1,1)
onoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
xnoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(1,2)
onoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
xnoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(1,2)
onoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
xnoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(1,0,1)
onoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(0,0,1)
xnoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(1,0,0)
onoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0,0)
xnoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(1,2,0)
onoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2,0)
xnoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(1,1,1)
onoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(0,1,1)
xnoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(1,1,0)
onoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1,0)
xnoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(1,0)
onoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
xnoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(1,1)
onoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
xnoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(1,0)
onoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
xnoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(1,1)
onoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
xnoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(1,0)
onoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
xnoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(1,2)
onoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
xnoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(1,2)
onoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
xnoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(1,2)
onoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
xnoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(1,1)
onoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(1,1)
onoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
xnoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(1,0)
onoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
xnoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(1,2)
onoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(1,0)
onoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
xnoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(1,1)
onoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
xnoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(1,0)
onoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
xnoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(1,2)
onoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(1,0)
onoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
xnoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(1,1)
onoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(1,1)
onoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(1,2)
onoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
xnoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(1,0)
onoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
xnoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(1,2)
onoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(1,2)
onoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
xnoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(1,1)
onoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
xnoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(1,0)
onoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
xnoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(1,2)
onoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
xnoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(1,1)
onoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
nnoremap <silent> <Plug>(easymotion-overwin-w) :call EasyMotion#overwin#w()
nnoremap <silent> <Plug>(easymotion-overwin-line) :call EasyMotion#overwin#line()
nnoremap <silent> <Plug>(easymotion-overwin-f2) :call EasyMotion#OverwinF(2)
nnoremap <silent> <Plug>(easymotion-overwin-f) :call EasyMotion#OverwinF(1)
xnoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,1,1)
onoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
xnoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,1,0)
onoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
xnoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,1,0)
onoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
xnoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,1,2)
onoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
xnoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,1,0)
onoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,1,2)
onoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
xnoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,1,0)
onoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,1,2)
onoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
xnoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,1,0)
onoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,1,2)
onoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
xnoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,1,0)
onoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,1,2)
onoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
xnoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,1,2)
onoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
xnoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,1,0)
onoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,1,2)
onoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
xnoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,1,1)
onoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
xnoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,1,0)
onoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
xnoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,1,0)
onoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
xnoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,1,1)
onoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
xnoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,1,2)
onoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,1,0)
onoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
xnoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,1,0)
onoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
xnoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,1,2)
onoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
xnoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,1,1)
onoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
xnoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,1,2)
onoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,1,1)
onoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
xnoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,1,2)
onoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
xnoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,1,1)
onoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
xnoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,1,2)
onoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
xnoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,1,1)
onoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
xnoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,1,2)
onoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
xnoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,1,1)
onoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
xnoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,1,2)
onoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
xnoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,1,1)
onoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
xnoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,1,2)
onoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
xnoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,1,2)
onoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,1,1)
onoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
xnoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,1,2)
onoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
xnoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,1,1)
onoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
xnoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,1,2)
onoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
xnoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,1,1)
onoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
xnoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,1,0)
onoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
noremap <silent> <Plug>BufTabLine.Go(-1) :exe 'b'.get(buftabline#user_buffers(),-1,'')
noremap <silent> <Plug>BufTabLine.Go(10) :exe 'b'.get(buftabline#user_buffers(),9,'')
noremap <silent> <Plug>BufTabLine.Go(9) :exe 'b'.get(buftabline#user_buffers(),8,'')
noremap <silent> <Plug>BufTabLine.Go(8) :exe 'b'.get(buftabline#user_buffers(),7,'')
noremap <silent> <Plug>BufTabLine.Go(7) :exe 'b'.get(buftabline#user_buffers(),6,'')
noremap <silent> <Plug>BufTabLine.Go(6) :exe 'b'.get(buftabline#user_buffers(),5,'')
noremap <silent> <Plug>BufTabLine.Go(5) :exe 'b'.get(buftabline#user_buffers(),4,'')
noremap <silent> <Plug>BufTabLine.Go(4) :exe 'b'.get(buftabline#user_buffers(),3,'')
noremap <silent> <Plug>BufTabLine.Go(3) :exe 'b'.get(buftabline#user_buffers(),2,'')
noremap <silent> <Plug>BufTabLine.Go(2) :exe 'b'.get(buftabline#user_buffers(),1,'')
noremap <silent> <Plug>BufTabLine.Go(1) :exe 'b'.get(buftabline#user_buffers(),0,'')
xnoremap <silent> <Plug>(peekaboo) :call peekaboo#aboo()
nnoremap <silent> <Plug>(peekaboo) :call peekaboo#aboo()
nnoremap <silent> <Plug>(startify-open-buffers) :call startify#open_buffers()
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
xnoremap <silent> <Plug>(signify-motion-outer-visual) :call sy#util#hunk_text_object(1)
onoremap <silent> <Plug>(signify-motion-outer-pending) :call sy#util#hunk_text_object(1)
xnoremap <silent> <Plug>(signify-motion-inner-visual) :call sy#util#hunk_text_object(0)
onoremap <silent> <Plug>(signify-motion-inner-pending) :call sy#util#hunk_text_object(0)
nnoremap <silent> <expr> <Plug>(signify-prev-hunk) &diff ? '[c' : ":\call sy#jump#prev_hunk(v:count1)\"
nnoremap <silent> <expr> <Plug>(signify-next-hunk) &diff ? ']c' : ":\call sy#jump#next_hunk(v:count1)\"
vmap <silent> <C-Y>c <Plug>(emmet-code-pretty)
vnoremap <Plug>(emmet-code-pretty) :call emmet#codePretty()
nmap <silent> <C-Y>m <Plug>(emmet-merge-lines)
nnoremap <Plug>(emmet-merge-lines) :call emmet#mergeLines()
nmap <silent> <C-Y>A <Plug>(emmet-anchorize-summary)
nnoremap <Plug>(emmet-anchorize-summary) :call emmet#anchorizeURL(1)
nmap <silent> <C-Y>a <Plug>(emmet-anchorize-url)
nnoremap <Plug>(emmet-anchorize-url) :call emmet#anchorizeURL(0)
nmap <silent> <C-Y>k <Plug>(emmet-remove-tag)
nnoremap <Plug>(emmet-remove-tag) :call emmet#removeTag()
nmap <silent> <C-Y>j <Plug>(emmet-split-join-tag)
nnoremap <Plug>(emmet-split-join-tag) :call emmet#splitJoinTag()
nmap <silent> <C-Y>/ <Plug>(emmet-toggle-comment)
nnoremap <Plug>(emmet-toggle-comment) :call emmet#toggleComment()
nmap <silent> <C-Y>I <Plug>(emmet-image-encode)
nnoremap <Plug>(emmet-image-encode) :call emmet#imageEncode()
nmap <silent> <C-Y>i <Plug>(emmet-image-size)
nnoremap <Plug>(emmet-image-size) :call emmet#imageSize()
nnoremap <Plug>(emmet-move-prev-item) :call emmet#moveNextPrevItem(1)
nnoremap <Plug>(emmet-move-next-item) :call emmet#moveNextPrevItem(0)
nmap <silent> <C-Y>N <Plug>(emmet-move-prev)
nnoremap <Plug>(emmet-move-prev) :call emmet#moveNextPrev(1)
nmap <silent> <C-Y>n <Plug>(emmet-move-next)
nnoremap <Plug>(emmet-move-next) :call emmet#moveNextPrev(0)
vmap <silent> <C-Y>D <Plug>(emmet-balance-tag-outword)
vnoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
nmap <silent> <C-Y>D <Plug>(emmet-balance-tag-outword)
nnoremap <Plug>(emmet-balance-tag-outword) :call emmet#balanceTag(-1)
vmap <silent> <C-Y>d <Plug>(emmet-balance-tag-inward)
vnoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nmap <silent> <C-Y>d <Plug>(emmet-balance-tag-inward)
nnoremap <Plug>(emmet-balance-tag-inward) :call emmet#balanceTag(1)
nmap <silent> <C-Y>u <Plug>(emmet-update-tag)
nnoremap <Plug>(emmet-update-tag) :call emmet#updateTag()
nmap <silent> <C-Y>; <Plug>(emmet-expand-word)
nnoremap <Plug>(emmet-expand-word) :call emmet#expandAbbr(1,"")
vmap <silent> <C-Y>, <Plug>(emmet-expand-abbr)
vnoremap <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(2,"")
nmap <silent> <C-Y>, <Plug>(emmet-expand-abbr)
nnoremap <Plug>(emmet-expand-abbr) :call emmet#expandAbbr(3,"")
nnoremap <Plug>NERDCommenterAltDelims :call nerdcommenter#SwitchToAlternativeDelimiters(1)
xnoremap <silent> <Plug>NERDCommenterUncomment :call nerdcommenter#Comment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call nerdcommenter#Comment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call nerdcommenter#Comment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call nerdcommenter#Comment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call nerdcommenter#Comment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call nerdcommenter#Comment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call nerdcommenter#Comment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call nerdcommenter#Comment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call nerdcommenter#Comment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call nerdcommenter#Comment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call nerdcommenter#Comment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call nerdcommenter#Comment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call nerdcommenter#Comment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call nerdcommenter#Comment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call nerdcommenter#Comment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call nerdcommenter#Comment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call nerdcommenter#Comment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call nerdcommenter#Comment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call nerdcommenter#Comment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call nerdcommenter#Comment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call nerdcommenter#Comment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call nerdcommenter#Comment("n", "Comment")
noremap <silent> <expr> <Plug>(asterisk-gz#) asterisk#do(mode(1), {'direction' : 0, 'do_jump' : 0, 'is_whole' : 0})
noremap <silent> <expr> <Plug>(asterisk-z#) asterisk#do(mode(1), {'direction' : 0, 'do_jump' : 0, 'is_whole' : 1})
noremap <silent> <expr> <Plug>(asterisk-g#) asterisk#do(mode(1), {'direction' : 0, 'do_jump' : 1, 'is_whole' : 0})
noremap <silent> <expr> <Plug>(asterisk-#) asterisk#do(mode(1), {'direction' : 0, 'do_jump' : 1, 'is_whole' : 1})
noremap <silent> <expr> <Plug>(asterisk-gz*) asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 0})
noremap <silent> <expr> <Plug>(asterisk-z*) asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 0, 'is_whole' : 1})
noremap <silent> <expr> <Plug>(asterisk-g*) asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 1, 'is_whole' : 0})
noremap <silent> <expr> <Plug>(asterisk-*) asterisk#do(mode(1), {'direction' : 1, 'do_jump' : 1, 'is_whole' : 1})
vnoremap <expr> <F22> terminus#private#paste('c')
nnoremap <expr> <F22> terminus#private#paste('i')
vnoremap <silent> <F21> :silent doautocmd <nomodeline> FocusGained %gv
vnoremap <silent> <F20> :silent doautocmd <nomodeline> FocusLost %gv
onoremap <silent> <F21> :silent doautocmd <nomodeline> FocusGained %
onoremap <silent> <F20> :silent doautocmd <nomodeline> FocusLost %
nnoremap <silent> <F21> :silent doautocmd <nomodeline> FocusGained %
nnoremap <silent> <F20> :silent doautocmd <nomodeline> FocusLost %
tmap <expr> <F21> terminus#private#term_focus_gained()
tmap <expr> <F20> terminus#private#term_focus_lost()
noremap <Plug>(smartword-basic-ge) ge
noremap <Plug>(smartword-basic-e) e
noremap <Plug>(smartword-basic-b) b
noremap <Plug>(smartword-basic-w) w
onoremap <silent> <Plug>(smartword-ge) :call smartword#move('ge','o')
onoremap <silent> <Plug>(smartword-e) :call smartword#move('e','o')
onoremap <silent> <Plug>(smartword-b) :call smartword#move('b','o')
onoremap <silent> <Plug>(smartword-w) :call smartword#move('w','o')
vnoremap <silent> <Plug>(smartword-ge) :call smartword#move('ge','v')
vnoremap <silent> <Plug>(smartword-e) :call smartword#move('e','v')
vnoremap <silent> <Plug>(smartword-b) :call smartword#move('b','v')
vnoremap <silent> <Plug>(smartword-w) :call smartword#move('w','v')
nnoremap <silent> <Plug>(smartword-ge) :call smartword#move('ge','n')
nnoremap <silent> <Plug>(smartword-e) :call smartword#move('e','n')
nnoremap <silent> <Plug>(smartword-b) :call smartword#move('b','n')
nnoremap <silent> <Plug>(smartword-w) :call smartword#move('w','n')
onoremap <SNR>24_gul g_
onoremap <SNR>24_line :normal! ^vg_
nnoremap <C-H> h
nnoremap <C-K> k
nnoremap <C-L> l
nnoremap <C-J> j
cnoremap <expr> 	 wilder#in_context()  ?  wilder#next()  :  '	'
imap <silent> m <Plug>(emmet-merge-lines)
imap <silent> A <Plug>(emmet-anchorize-summary)
imap <silent> a <Plug>(emmet-anchorize-url)
imap <silent> k <Plug>(emmet-remove-tag)
imap <silent> j <Plug>(emmet-split-join-tag)
imap <silent> / <Plug>(emmet-toggle-comment)
imap <silent> I <Plug>(emmet-image-encode)
imap <silent> i <Plug>(emmet-image-size)
imap <silent> N <Plug>(emmet-move-prev)
imap <silent> n <Plug>(emmet-move-next)
imap <silent> D <Plug>(emmet-balance-tag-outword)
imap <silent> d <Plug>(emmet-balance-tag-inward)
imap <silent> u <Plug>(emmet-update-tag)
imap <silent> ; <Plug>(emmet-expand-word)
imap <silent> , <Plug>(emmet-expand-abbr)
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim/backup//
set complete=.,w,b,u,t
set directory=~/.vim/swap//
set display=lastline
set expandtab
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileformats=unix,dos,mac
set fillchars=stl:\ ,stlnc:\ ,fold:\ ,vert:│
set foldlevelstart=99
set helplang=en
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set nomodeline
set mouse=a
set pastetoggle=<F23>
set pumheight=20
set report=0
set ruler
set runtimepath=~/.vim,~/.vim/plugged/vim-better-default,~/.vim/plugged/vim-lastplace,~/.vim/plugged/vim-smartword,~/.vim/plugged/vim-highlightedyank,~/.vim/plugged/terminus,~/.vim/plugged/vim-asterisk,~/.vim/plugged/nerdcommenter,~/.vim/plugged/matchit.zip,~/.vim/plugged/vim-closetag,~/.vim/plugged/emmet-vim,~/.vim/plugged/delimitmate,~/.vim/plugged/wilder.nvim,~/.vim/plugged/nvim-yarp,~/.vim/plugged/vim-hug-neovim-rpc,~/.vim/plugged/vim-rainbow,~/.vim/plugged/vim-gruvbox8,~/.vim/plugged/gruvbox,~/.vim/plugged/vim-solarized8,~/.vim/plugged/vim-colors-solarized,~/.vim/plugged/vim-signify,~/.vim/plugged/fzf,~/.vim/plugged/fzf.vim,~/.vim/plugged/vim-startify,~/.vim/plugged/vim-peekaboo,~/.vim/plugged/vim-buftabline,~/.vim/plugged/vim-statline,~/.vim/plugged/vim-easymotion,~/.vim/plugged/vim-sandwich,~/.vim/plugged/tabular,~/.vim/plugged/vim-visual-multi,~/.vim/plugged/vim-visual-increment,~/.vim/plugged/vim-expresso,~/.vim/plugged/vim-exchange,~/.vim/plugged/ReplaceWithRegister,/var/lib/vim/addons,/etc/vim,/usr/share/vim/vimfiles,/usr/share/vim/vim82,/usr/share/vim/vimfiles/after,/etc/vim/after,/var/lib/vim/addons/after,~/.vim/plugged/vim-sandwich/after,~/.vim/plugged/tabular/after,~/.vim/after
set scrolljump=3
set scrolloff=2
set scrollopt=ver,jump,hor
set shiftwidth=4
set shortmess=atOI
set showcmd
set showmatch
set showtabline=2
set smartcase
set smarttab
set softtabstop=4
set splitbelow
set splitright
set statusline=[%{winnr()}]\ %1*[%t]%*\ %<%2*%h%w%m%r%*\ %y[%{&ff}%{g:statline_encoding_separator}%{strlen(&fenc)?&fenc:g:statline_no_encoding_string}]%=%-14(\ L%l/%L:C%c\ %)[%{StatlineScrollbar(10,'���','⠿')}]\ %3*%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}%*%3*%{StatlineTabWarning()}%*%3*%{StatlineTrailingSpaceWarning()}%*
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set tabline=%!buftabline#render()
set tabstop=4
set termencoding=utf-8
set ttimeoutlen=10
set undodir=~/.vim/undo//
set undofile
set viminfo='100,<50,s10,h,!
set whichwrap=b,s,<,>,h,l
set wildcharm=<Tab>
set wildignore=*swp,*.class,*.pyc,*.png,*.jpg,*.gif,*.zip,*/tmp/*,*.o,*.obj,*.so,*\\tmp\\*,*.exe
set wildmenu
set wildmode=list:longest,full
set winminheight=0
set nowritebackup
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd _vimrc
$argadd ~/.vimrc
edit _vimrc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 78 + 78) / 157)
exe 'vert 2resize ' . ((&columns * 78 + 78) / 157)
argglobal
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <expr> <C-R> peekaboo#peek(1, "\",  0)
imap <buffer> <silent> <C-G>g <Plug>delimitMateJumpMany
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <C-H> <Plug>delimitMateBS
imap <buffer> <BS> <Plug>delimitMateBS
xmap <buffer> <expr> " peekaboo#peek(v:count1, '"',  1)
nmap <buffer> <expr> " peekaboo#peek(v:count1, '"',  0)
nmap <buffer> <expr> @ peekaboo#peek(v:count1, '@', 0)
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*end\(f\%[unction]\|def\)\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*end\(f\%[unction]\|def\)\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*\(fu\%[nction]\|def\)\>', "W")
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> <expr>  peekaboo#peek(1, "\",  0)
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal cursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal diff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fixendofline
setlocal foldcolumn=2
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
set foldmarker={,}
setlocal foldmarker={,}
set foldmethod=marker
setlocal foldmethod=diff
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,=end,=},=else,=cat,=finall,=END,0\\,0=\"\\\ 
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=:help
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=78
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 261 - ((260 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 261
normal! 0
wincmd w
argglobal
2argu
balt _vimrc
let s:cpo_save=&cpo
set cpo&vim
imap <buffer> <expr> <C-R> peekaboo#peek(1, "\",  0)
imap <buffer> <silent> <C-G>g <Plug>delimitMateJumpMany
imap <buffer> <S-Tab> <Plug>delimitMateS-Tab
imap <buffer> <S-BS> <Plug>delimitMateS-BS
imap <buffer> <C-H> <Plug>delimitMateBS
imap <buffer> <BS> <Plug>delimitMateBS
xmap <buffer> <expr> " peekaboo#peek(v:count1, '"',  1)
nmap <buffer> <expr> " peekaboo#peek(v:count1, '"',  0)
nmap <buffer> <expr> @ peekaboo#peek(v:count1, '@', 0)
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*end\(f\%[unction]\|def\)\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*\(fu\%[nction]\|def\)\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*end\(f\%[unction]\|def\)\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*end\(f\%[unction]\|def\)\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*\(fu\%[nction]\|def\)\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*\(fu\%[nction]\|def\)\>', "W")
imap <buffer> <silent> g <Plug>delimitMateJumpMany
imap <buffer>  <Plug>delimitMateBS
imap <buffer> <expr>  peekaboo#peek(1, "\",  0)
imap <buffer> " <Plug>delimitMate"
imap <buffer> ' <Plug>delimitMate'
imap <buffer> ( <Plug>delimitMate(
imap <buffer> ) <Plug>delimitMate)
imap <buffer> [ <Plug>delimitMate[
imap <buffer> ] <Plug>delimitMate]
imap <buffer> ` <Plug>delimitMate`
imap <buffer> { <Plug>delimitMate{
imap <buffer> } <Plug>delimitMate}
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal cursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal diff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fixendofline
setlocal foldcolumn=2
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
set foldmarker={,}
setlocal foldmarker={,}
set foldmethod=marker
setlocal foldmethod=diff
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,=end,=},=else,=cat,=finall,=END,0\\,0=\"\\\ 
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=:help
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=78
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
let s:l = 261 - ((260 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 261
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 78 + 78) / 157)
exe 'vert 2resize ' . ((&columns * 78 + 78) / 157)
tabnext 1
badd +261 _vimrc
badd +1 ~/.vimrc
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=atOI
set winminheight=0 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
