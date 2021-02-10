let s:file_regex = '\v^(:?├|─|└|│|\s)+[◎•]*\s*(\w|\.|\/|-)+ ⇒ (\d+)$'

" MakePageBuffer creates an empty buffer filled with line-separated 'contents'
function! buffer#MakeBuffer(contents, current_buffer_number)

  " make buffer and set attributes
  vnew
  setlocal nobuflisted noswapfile wrap buftype=nofile bufhidden=delete nonu nornu nocursorline
  execute ":file BufferTree"

  syntax match TreeWindowFile /\v◎ (\w|\.|\/|-)+ ⇒ (\d+)$/
  syntax match TreePath /\v(\w|\.|\/|-)+$/
  syntax match TreeFile /\v•(\w|\.|\/|-)+ ⇒ (\d+)$/
  syntax match TreeBranch /\v(├|─|└|│)/

  highlight TreePath ctermfg=242
  highlight TreeFile ctermfg=white
  highlight TreeWindowFile cterm=bold ctermfg=white
  highlight TreeBranch ctermfg=green

  let allowed_lines = []
  let bufferline = -1

  " fill the buffer with contents
  let line_idx = 1
  for line in a:contents
    if line != ''

      call setline(line_idx, line)
      let matches = matchlist(line, s:file_regex)

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

" RefreshPageBuffer
function! buffer#RefreshBuffer()

  let contents = tree#BufferTree()

  let allowed_lines = []
  let bufferline = -1
  let current_buffer_number = bufnr()

  setlocal modifiable

  " delete the old buffer contents
  call deletebufline(current_buffer_number, 1, '$')

  " fill the buffer with contents
  let line_idx = 1
  for line in contents
    if line != ''

      call setline(line_idx, line)
      let matches = matchlist(line, s:file_regex)

      if len(matches) > 0
        if matches[3] == current_buffer_number
          let bufferline = line_idx
        endif
        call add(allowed_lines, line_idx)
      endif

      let line_idx += 1
    endif
  endfor

  setlocal nomodifiable
  return [bufferline, allowed_lines]

endfunction
