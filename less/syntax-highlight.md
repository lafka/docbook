# Syntax highlighting in less 

With ``lesspipe`` - a input filter for less - you can preprocess the data and format
it to something more readable.

Lesspipe is an external program that can be fetched from whatever package managment
system, you also need GNU source-highlight to make this works. 

```bash
export LESSOPEN="| $(command -v src-hilite-lesspipe.sh) %s
export LESS=' -R '
```

