if !exists('g:buffer_tree_explorer_compress')
    let g:buffer_tree_explorer_compress = 1
endif

if !exists('g:buffertree_path_sep')
    let g:buffertree_path_sep = '/'
endif

if !exists('g:buffertree_close_on_enter')
    let g:buffertree_close_on_enter = 0
endif

command! Tree :call explorer#Explore()
