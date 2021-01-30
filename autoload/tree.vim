function! GetTree()

  let buffer_numbers = map(filter(copy(getbufinfo()), 'v:val.listed'), 'v:val.bufnr')
  let tree = {}

  for buffer_number in buffer_numbers

    let file_path = split(expand("#" . string(buffer_number) . ":p"), g:buffertree_path_sep)
    let dir = tree

    for step in file_path

      if len(file_path) == 1
        let dir[step] = buffer_number
      else
        if !has_key(dir, step)
          let dir[step] = {}
        endif

        let dir = dir[step]
      endif

      let file_path = file_path[1:]

    endfor
  endfor

  if g:buffertree_compress == 1
    let tree = CompressTree(tree)
  endif

  return tree
endfunction

function! FillWhitespace(n, lines)

  let space = ""

  for i in range(a:n)
    if index(a:lines, i) == -1
      let space = space . " "
    else
      let space = space . "│"
    endif
  endfor

  return space

endfunction

function! GetLinesHelper(tree, lines, offset, vlines, fill, open_windows)

  let items = items(a:tree)

  while len(items) > 0

    " pop
    let [key, value] = items[0]
    let items = items[1:]

    if len(items) > 0
      let last = 0
      let pipe = "├─ "

    else
      let pipe = "└─ "
      let last = 1

    endif

    if type(value) is v:t_dict

      call add(a:lines, FillWhitespace(a:offset, a:vlines) . pipe . key)
      if last == 1
        call GetLinesHelper(value, a:lines, a:offset + 3, a:vlines, last, a:open_windows)
      else
        call GetLinesHelper(value, a:lines, a:offset + 3, a:vlines + [a:offset], last, a:open_windows)
      endif

    else

      if index(a:open_windows, value) != -1
        let written_indicator = '◎ '
      else
        let written_indicator = '• '
      endif

      if a:fill
        call add(a:lines, FillWhitespace(a:offset, a:vlines) . pipe . written_indicator . key . " ⇒ " . value)
      else
        call add(a:lines, FillWhitespace(a:offset, a:vlines[:-1]) . pipe . written_indicator . key . " ⇒ " . value)
      endif

    endif

  endwhile

endfunction

function! GetLines(tree, open_windows)
  let lines = []
  call GetLinesHelper(a:tree, lines, 0, [], 1, a:open_windows)
  return lines
endfunction

function! CompressTree(tree)

    let sep = "/"

    if type(a:tree) is v:t_dict
      for [k1, v1] in items(a:tree)

        let a:tree[k1] = CompressTree(v1)

        if type(v1) is v:t_dict && len(items(v1)) == 1

          let [k2, v2] = items(v1)[0]
          let a:tree[k1 . sep . k2] = v2
          call remove(a:tree, k1)

        endif

      endfor
    endif
    return a:tree

endfunction

function! GetOpenWindows()
  let open_ids = []
  for win_id in range(1,winnr('$'))
    call add(open_ids, winbufnr(win_id))
  endfor
  return open_ids
endfunction

function! tree#BufferTree()
  let tree = GetTree()
  let open_windows = GetOpenWindows()
  let lines = GetLines(tree, open_windows)
  return lines
endfunction
