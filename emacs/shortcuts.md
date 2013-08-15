# Emacs shortcuts

# Files
```
<C-x> + <C-f> -> find-file
<C-x> + <C-s> -> save-buffer
<C-x> + s     -> save-some-buffers (Save multiple buffers, prompt for each)
```

# Buffers
```
<C-x> + <C-b> -> list-buffers
<C-x> + b     -> switch-to-buffer
<C-x> + k     -> kill-buffer
<C-x> + <C-q> -> vc-toggle-read-only (toggle ro/rw flag)
```

# Windows
```
<C-x> + 0 -> delete-window
<C-x> + 1 -> delete-other-windows 
<C-x> + 2 -> split-window-vertically
<C-x> + 3 -> split-window-horizontally
<C-x> + o -> other-window

<C-v>     -> scroll-up
<M-v>     -> scroll-down
<C-M-v>   -> scroll-other-window
```

# Editor

```
<C-Space> -> Add mark

<C-w>     -> Cut marked text
<A-w>     -> Copy marked text
<C-y>     -> Paste the cutted text
<C-s>     -> Search for things (quit with <C-g>)

<C-o>     -> Prepend line
<C-S-o>   -> Cut line at mark
<C-q> + # -> quoted-insert (escape character #)
```

## (removing text)
<M-d>             -> kill-word
<M-DEL>           -> backward-kill-word
<C-k>             -> kill-line
<C-u> + 0 + <C-k> -> kill-line (to the beginning)

<C-d>             -> delete-char
<DEL>             -> delete-backward-char
```

## (block)
```
# Select region
<C-x> + r + t     -> ??? insert text into block
<C-;>             -> Insert block comment
```

# Moving around
```
<C-a>     -> beginning-of-line
<C-e>     -> end-of-line
<M-a>     -> backward-sentence
<M-e>     -> forward-sentence
<M-{>     -> backward-paragraph
<M-}>     -> forward-paragraph
<C-x> + [ -> backward-page
<C-x> + ] -> forward-page
<M-<>     -> beginning-of-buffer
<M->>     -> end-of-buffer
<C-f>     -> forward-char
<C-b>     -> backward-char
<M-f>     -> forward-word
<M-b>     -> backward-word
<C-n>     -> next-line
<C-p>     -> previous-line

<C-M-b>   -> backward-sexp
<C-M-f>   -> forward-sexp
<C-M-u>   -> backward-up-list
<C-M-d>   -> down-list

<C-M-a>   -> beginning-of-defun
<C-M-e>   -> end-of-defun
```

# Misc
```
<C-g> -> keyboard-quit
```

# Help
```
<C-h> + a -> command-apropos (search for command)
<C-h> + k -> describe-key
<C-h> + i -> info
<C-h> + m -> describe-mode
<C-h> + p -> finder-by-keyword
<C-h> + t -> help-with-tutorial
```


# Erlang stuff
```
<C-c> + <C-j> -> erlang-generate-new-clause
<C-c> + <C-y> -> erlang-clone-arguments
<C-c> + <C-z> -> erlang-shell-display
```
