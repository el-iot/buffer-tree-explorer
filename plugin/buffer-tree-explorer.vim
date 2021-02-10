if !exists('g:buffer_tree_explorer_compress')
    let g:buffer_tree_explorer_compress = 1
endif

if !exists('g:buffertree_path_sep')
    let g:buffertree_path_sep = '/'
endif

command! Tree :call explorer#Explore()
