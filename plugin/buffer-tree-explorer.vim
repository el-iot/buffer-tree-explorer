if !exists('g:buffertree_compress')
    let g:buffertree_compress = 0
endif

if !exists('g:buffertree_path_sep')
    let g:buffertree_path_sep = '/'
endif

command! Tree :call explorer#Explore()
