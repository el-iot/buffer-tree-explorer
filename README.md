```
        # #### ####
      ### \/#|### |/####
     ##\/#/ \||/##/_/##/_#
   ###  \/###|/ \/ # ###
 ##_\_#\_\## | #/###_/_####  ╔╗ ┬ ┬┌─┐┌─┐┌─┐┬─┐╔╦╗┬─┐┌─┐┌─┐
## #### # \ #| /  #### ##/## ╠╩╗│ │├┤ ├┤ ├┤ ├┬┘ ║ ├┬┘├┤ ├┤
 __#_--###`  |{,###---###-~  ╚═╝└─┘└  └  └─┘┴└─ ╩ ┴└─└─┘└─┘
           \ }{              ╔═╗─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
            }}{              ║╣ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
            }}{              ╚═╝┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─
            {{}
      __-=-~{ .-^-__
            `}
             {
```

<h1>buffer-tree-explorer</h1>

A vim-plugin for exploring vim-buffers, rendered as an ascii-tree. An adaptation / extension of the <a href='https://github.com/el-iot/buffer-tree'>buffer-tree</a> vim plugin.

<h2>Why?</h2>
I recently wrote a vim-plugin (<a href='https://github.com/el-iot/buffer-tree'>buffer-tree</a>) that renders your vim-buffers as an ascii tree. While I liked the plugin, I found its lack of persistence made it difficult to use (it was only rendered in the echo area). This plugin will instead create a persistent buffer which displays your existing buffers and makes navigating easier.

Given a list of buffers,
```
:buffers
  1  h   "~/.config/nvim/init.vim"      line 234
 22  h   "~/.config/nvim/demo.txt"      line 1
 23  h   "plugin/tree.py"               line 27
 25  h   "~/.config/nvim/autoload/plug.vim" line 563
 27 #h   "plugin/buffer-tree.vim"       line 91
 28 %a   "README.md"                    line 35
```

<code>BufferTreeExplorer</code> will create a buffer with an ascii-tree that can be used to view the existing buffers. Note that this tree cannot be used to open *new* files in new vim-buffers.

```
:BufferTree
└─ home
   └─ el
      ├─ personal
      │  └─ vim
      │     └─ buffer-tree
      │        ├─ README.md ⇒ 28
      │        └─ plugin
      │           ├─ tree.py ⇒ 23
      │           └─ buffer-tree.vim ⇒ 27
      └─ .config
         └─ nvim
            ├─ demo.txt ⇒ 22
            ├─ autoload
            │  └─ plug.vim ⇒ 25
            └─ init.vim ⇒ 1
```

Note that the numbers after the arrow next to each file represent the buffer numbers of each file.

<h2>Installation</h2>
<h2>Contributing</h2>
