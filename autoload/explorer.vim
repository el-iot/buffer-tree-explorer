function! PressedEnter()
  let current_line_contents = getline('.')
  let file_regex            = '\v^(:?├|─|└|│|\s)+[◎•] *(\w|\.|\/|-)+ ⇒ (\d+)$'
  let current_file_regex    = '\v^(:?├|─|└|│|\s)+◎ *(\w|\.|\/|-)+ ⇒ (\d+)$'
  let match                 = matchlist(current_line_contents, file_regex)

  if len(match) == 0
    return
  endif

  setlocal modifiable

  for allowed_line in b:allowed_lines

    let line_contents = getline(allowed_line)
    if len(matchlist(line_contents, current_file_regex)) > 0
      call setline(allowed_line, substitute(line_contents, '◎', '•', ''))
      break
    endif
  endfor

  let destination_line_number = getcurpos()[1]
  call setline(destination_line_number, substitute(current_line_contents, '•', '◎',''))

  setlocal nomodifiable

  execute "wincmd p"
  execute "b" . match[3]
endfunction

function! ScrollUp()
  call ScrollHelper(-1)
endfunction

function! ScrollDown()
  call ScrollHelper(1)
endfunction

function! ScrollHelper(delta)

  let pos = getcurpos()[1]
  let idx = 0

  for allowed_line in b:allowed_lines
    if allowed_line == pos
      call cursor(b:allowed_lines[(idx + a:delta) % len(b:allowed_lines)], 0)
      return
    endif
    let idx = idx + 1
  endfor

  call cursor(b:allowed_lines[0], 0)

endfunction

function! RefreshBuffer()
  let result = buffer#RefreshBuffer()
  let b:allowed_lines = result[1]
  call cursor(result[0], 0)
endfunction

function! explorer#Explore()

  let previous_buffer = bufnr()
  let tree = tree#BufferTree()
  let result = buffer#MakeBuffer(tree, previous_buffer)

  let b:allowed_lines = result[1]
  call cursor(result[0], 0)

  nnoremap <buffer> <silent> <CR> :call PressedEnter()<cr>
  nnoremap <buffer> <silent> k :call ScrollUp()<cr>
  nnoremap <buffer> <silent> j :call ScrollDown()<cr>

  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter BufferTree call RefreshBuffer()
    au VimEnter,WinEnter,BufWinEnter [^BufferTree] call RefreshBuffer()
  augroup END

endfunction
