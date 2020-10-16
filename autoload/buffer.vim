" MakePageBuffer creates an empty buffer filled with line-separated 'contents'
function! buffer#MakeBuffer(contents)

  " make buffer and set attributes
  vnew
  setlocal nobuflisted noswapfile wrap buftype=nofile bufhidden=delete filetype=mediawiki

  " fill the buffer with contents
  let line_idx = 1
  for line in a:contents
    if line != ''
      call setline(line_idx, line)
      call setline(line_idx + 1, '')
      let line_idx += 2
    endif
  endfor

  " only make non-modifiable after everything has already been written
  setlocal nomodifiable

endfunction
