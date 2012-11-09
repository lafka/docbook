# Adding a left margin to VIM

In the grey hours before people wake up I like to enter "distraction free"
editing, this means remove NERDTree, line numbers and similar. One issue that
arises is that there is no longer a left margin which puts the text to close
to the window edge.

One way is to hack the fold column to do this, it's normaly used for foldmarks 
but we can use it in our case:

```vim
" Cheat by using foldcolumn
set foldcolumns=1
```

Alternative hack would be to enable line numbers, but set the ``LineNr`` group
to the same colour as the backround.
