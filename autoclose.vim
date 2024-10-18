function! s:SortTimeStamps(lhs, rhs)
  return a:lhs[1] > a:rhs[1] ?  1
     \ : a:lhs[1] < a:rhs[1] ? -1
     \ :                        0
endfunction

function! s:Close(nb_to_keep)
  let saved_buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && ! getbufvar(v:val, "&modified")')
  let times = map(copy(saved_buffers), '[(v:val), getftime(bufname(v:val))]')
  call filter(times, 'v:val[1] > 0')
  call sort(times, function('s:SortTimeStamps'))
  if a:nb_to_keep < len(times)
      let nb_to_keep = min([a:nb_to_keep, len(times)])
      let buffers_to_strip = map(copy(times[0:(len(times)-1-nb_to_keep)]), 'v:val[0]')
      exec 'silent! bw '.join(buffers_to_strip, ' ') 
  endif
endfunction

" Two ways to use it
" - manually
command! CloseOldBuffers call s:Close(6)
" - or automatically
"augroup CloseOldBuffers
  "au!
  "au BufNew * call s:Close(g:nb_buffers_to_keep)
"augroup END
" and don't forget to set the option in your .vimrc
let g:nb_buffers_to_keep = 12
