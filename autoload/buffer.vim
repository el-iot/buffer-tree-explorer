" MakePageBuffer creates an empty buffer filled with line-separated 'contents'
function! buffer#MakeBuffer(contents, current_buffer_number)

  " make buffer and set attributes
  vnew
  setlocal nobuflisted noswapfile wrap buftype=nofile bufhidden=delete nonu nornu nocursorline

  let file_regex = '\v^(:?├|─|└|│|\s)+(\w|\.|\/|-)+ ⇒ (\d+)$'
  let allowed_lines = []
  let bufferline = -1

  " fill the buffer with contents
  let line_idx = 1
  for line in a:contents
    if line != ''

      call setline(line_idx, line)
      let matches = matchlist(line, file_regex)

      if len(matches) > 0
        if matches[3] == a:current_buffer_number
          let bufferline = line_idx
        endif
        call add(allowed_lines, line_idx)
      endif

      let line_idx += 1
    endif
  endfor

  " only make non-modifiable after everything has already been written
  setlocal nomodifiable
  return [bufferline, allowed_lines]

endfunction
