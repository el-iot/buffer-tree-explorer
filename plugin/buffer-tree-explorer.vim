if !exists('g:buffertree_compress')
    let g:buffertree_compress = 0
endif

command! Tree :call explorer#Explore()
