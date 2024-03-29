```
                                                 &&& &&  & &&
                                              && &\/&\|& ()|/ @, &&
                                             &\/(/&/&||/& /_/)_&/_&
 ╔╗ ┬ ┬┌─┐┌─┐┌─┐┬─┐╔╦╗┬─┐┌─┐┌─┐            &() &\/&|()|/&\/ '%" & ()
 ╠╩╗│ │├┤ ├┤ ├┤ ├┬┘ ║ ├┬┘├┤ ├┤            &_\_&&_\ |& |&&/&__%_/_& &&
 ╚═╝└─┘└  └  └─┘┴└─ ╩ ┴└─└─┘└─┘         &&   && & &| &| /& & % ()& /&&
         ╔═╗─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐        ()&_---()&\&\|&&-&&--%---()~
         ║╣ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘               && \|||
         ╚═╝┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─                   |||
                                                     |||
                                                     |||
                                               , -=-~  .-^- _
```

<h1>buffer-tree-explorer</h1>

A vim-plugin for exploring vim-buffers, rendered as an ascii-tree. An adaptation / extension of the <a href='https://github.com/el-iot/buffer-tree'>buffer-tree</a> vim plugin.

<img src="https://github.com/el-iot/buffer-tree-explorer/blob/master/assets/demo.gif" width="800" height="450" />

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

Within this buffer you can use the <code>k</code> and <code>j</code> keys to scroll up and down respectively through the available buffers, as well as press <code>\<CR\></code> to enter that buffer.

<h2>Installation</h2>

Add this line to your <code>init.vim</code> / <code>.vimrc</code> file (though you may need to modify it slightly if you use a different plugin manager.

```
Plug 'el-iot/buffer-tree-explorer'
```

and run

```
:PlugInstall
```
<h2>Usage</h2>
Use the <code>:Tree</code> command to render your buffers as an ascii-tree in a separate "tree buffer". While navigating within this buffer you can use the <code>j</code> and <code>k</code> keys to scroll up and down through the available buffers, <code>Enter</code> to open this buffer and <code>delete</code> to delete a given buffer a refresh your tree.

<h2>Configuration</h2>

<h3> Compressing the BufferTree </h3>
Sometimes your buffers will be very sparse and the buffer-tree will look a little large for so few files.
As an example,

```
└─ home
   └─ el
      ├─ personal
      │  ├─ vim
      │  │  └─ buffer-tree
      │  │     ├─ README.md ⇒ 2
      │  │     └─ plugin
      │  │        └─ buffer-tree.vim ⇒ 3
      │  └─ repos
      │     └─ themerator
      │        └─ themerator.py ⇒ 14
      └─ .config
         └─ nvim
            ├─ plugged
            │  ├─ buffer-tree
            │  │  └─ plugin
            │  │     └─ buffer-tree.vim ⇒ 4
            │  └─ buffer-minimalism
            │     └─ plugin
            │        └─ buffer-minimalism.vim ⇒ 10
            └─ init.vim ⇒ 1
```

This is a little inconvenient, as a lot of vertical space is taken up by directories with no buffers.
You can set <code>g:buffer_tree_explorer_compress</code> to 1 to "compress" your trees where possible. In this case, the tree above would look like

```
└─ home/el
   ├─ .config/nvim
   │  ├─ plugged
   │  │  ├─ buffer-minimalism/plugin/buffer-minimalism.vim ⇒ 10
   │  │  └─ buffer-tree/plugin/buffer-tree.vim ⇒ 4
   │  └─ init.vim ⇒ 1
   └─ personal
      ├─ repos/themerator/themerator.py ⇒ 14
      └─ vim/buffer-tree
         ├─ README.md ⇒ 2
         └─ plugin/buffer-tree.vim ⇒ 3

```

<h3> Closing the tree after selecting a buffer</h3>

By default, You can configure buffertree-explorer to close on selecting a buffer (with <code>\<enter\></code>) by setting the <code>g:buffertree_close_on_enter</code> to <code>1</code>.
