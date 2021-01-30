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
 22  h   "~/media/videos/video.html"    line 4
 26  h   "autoload/explorer.vim"        line 14
 27  h   "autoload/tree.vim"            line 1
 29  h   "autoload/buffer.vim"          line 15
 74  h   "~/personal/machine-learning/btc/data.csv" line 3141
 75 #h   "~/personal/advent-of-code/2020/day_1.py" line 1
 76 %a   "README.md"                    line 72
```

<code>BufferTreeExplorer</code> will create a buffer with an ascii-tree that can be used to view the existing buffers. Note that this tree cannot be used to open *new* files in new vim-buffers.

```
:Tree
└─ home/el
   ├─ .config/nvim/plugged/buffer-tree-explorer
   │  ├─ ◎ README.md ⇒ 76
   │  └─ autoload
   │     ├─ • buffer.vim ⇒ 29
   │     ├─ • tree.vim ⇒ 27
   │     └─ • explorer.vim ⇒ 26
   ├─ personal
   │  ├─ • machine-learning/btc/data.csv ⇒ 74
   │  └─ • advent-of-code/2020/day_1.py ⇒ 75
   └─ • media/videos/video.html ⇒ 22
```

Note that the numbers after the arrow next to each file represent the buffer numbers of each file.

<h2>Installation</h2>

Add this line to your <code>init.vim</code> / <code>.vimrc</code> file (though you may need to modify it slightly if you use a different plugin manager.

```
Plug 'el-iot/buffer-tree-explorer.vim'
```

and run

```
:PlugInstall
```
<h2>To-do</h2>
- add delete key
