```
         ; ; ;
       ;        ;  ;     ;;    ;
    ;                 ;         ;  ;
                    ;
                   ;                ;;
   ;          ;            ;              ;
   ;            ';,        ;               ;
   ;              'b      *
    ;              '$    ;;                ;;
   ;    ;           $:   ;:               ;
 ;;      ;  ;;      *;  @):        ;   ; ;
              ;     :@,@):   ,;**:'   ;
  ;      ;,         :@@*: ;;**'      ;   ;
           ';o;    ;:(@';@*"'  ;
   ;  ;       'bq,;;:,@@*'   ,*      ;  ;
              ,p$q8,:@)'  ;p*'      ;
       ;     '  ; '@@Pp@@*'    ;  ;
        ;  ; ;;    Y7'.'     ;  ;
                  :@):.
                 .:@:'.
               .::(@:::.

╔╗ ┬ ┬┌─┐┌─┐┌─┐┬─┐╔╦╗┬─┐┌─┐┌─┐
╠╩╗│ │├┤ ├┤ ├┤ ├┬┘ ║ ├┬┘├┤ ├┤
╚═╝└─┘└  └  └─┘┴└─ ╩ ┴└─└─┘└─┘
        ╔═╗─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
        ║╣ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
        ╚═╝┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─
```

<h1>buffer-tree-explorer</h1>

A vim-plugin for exploring vim-buffers, rendered as an ascii-tree. An adaptation / extension of the <a href='https://github.com/el-iot/buffer-tree'>buffer-tree</a> vim plugin.

<h2>Why?</h2>
I recently wrote a vim-plugin (<a href='https://github.com/el-iot/buffer-tree'>buffer-tree</a>) that renders your vim-buffers as an ascii tree. While I liked the plugin, I found its lack of persistence made it difficult to use (it was only rendered in the echo area). This plugin will instead create a persistent buffer which displays your existing buffers and makes navigating easier.

Given a list of buffers,
```
:buffers
  2  h   "~/.config/nvim/plugged/buffer-tree-explorer/autoload/explorer.vim" line 47
  3  h   "~/.config/nvim/plugged/buffer-tree-explorer/autoload/tree.vim" line 65
  4  h   "~/.config/nvim/plugged/buffer-tree-explorer/autoload/buffer.vim" line 22
 15  h   "~/.config/nvim/plugged/buffer-tree-explorer/README.md" line 57
 16 #h   "~/personal/haskell/h99.hs"    line 2
 17 %a   "manifest.json"                line 12
```

<code>BufferTreeExplorer</code> will create a buffer with an ascii-tree that can be used to view the existing buffers. Note that this tree cannot be used to open *new* files in new vim-buffers.

```
:Tree
└─ home/el
   ├─ .config/nvim/plugged/buffer-tree-explorer
   │  ├─ README.md ⇒ 15
   │  └─ autoload
   │     ├─ buffer.vim ⇒ 4
   │     ├─ tree.vim ⇒ 3
   │     └─ explorer.vim ⇒ 2
   └─ personal
      ├─ site-blocker/manifest.json ⇒ 17
      └─ haskell/h99.hs ⇒ 16
```

Note that the numbers after the arrow next to each file represent the buffer numbers of each file.

<h2>Installation</h2>
<h2>Contributing</h2>
<h2>To-do</h2>
- add delete key
- refresh on winleave
