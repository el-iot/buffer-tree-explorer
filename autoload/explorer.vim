function! PressedEnter()
  let line = getline('.')
  let file_regex = '\v^(:?├|─|└|│|\s)+◎*\s*(\w|\.|\/|-)+ ⇒ (\d+)$'
  let match = matchlist(line, file_regex)

  if len(match) > 0
    let buffer_number = match[3]
    execute "wincmd p"
    execute "b" . buffer_number
  endif
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
endfunction

function! RefreshBuffer()

  let s:previous_window = winnr()
  let previous_buffer = bufnr()

  let tree = tree#BufferTree()
  let result = buffer#RefreshBuffer(tree, previous_buffer)
  let b:allowed_lines = result[1]

  call cursor(result[0], 0)
endfunction

function! explorer#Explore()

  let s:previous_window = winnr()
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
    au VimEnter,WinEnter,BufWinEnter BufferTree setlocal cursorline
    au VimEnter,WinEnter,BufWinEnter BufferTree call RefreshBuffer()
    au WinLeave BufferTree setlocal nocursorline
  augroup END

endfunction
