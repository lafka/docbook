# Check difference between local and upstream 

Starting from git 1.7 you can use ``@{u}`` or ``@{upstream}`` to refer to the remote tracking branch.
This allowes you to easily check the difference between remote and local:

```bash
# Check what's remote put not merged
git log ..@{u}
``` 

```bash
# Check what's local and not pushed
git log @{u}..
```

We can do the same thing in versions pre 1.7 with either one of these:
```bash
git log $(git config --get branch.stage.remote)/$(git branch | awk '/*/{print $NF}')..
```

```bash
# This only checks for things in local branch and not in remote
git log --branches --not --remotes=origin
```

If you get errors complaining about ``No upstream branch found for '..'`` you need to run ``git branch --set-upstream <branch> origin/<branch>'``

## Some nice aliases
Thanks to Richard Hansen (http://stackoverflow.com/questions/231211/using-git-how-do-i-find-modified-files-between-local-and-remote#answer-6389348) for these.

```bash
git config --global alias.incoming '!git remote update -p; git log ..@{u}'
git config --global alias.outgoing 'log @{u}..'
```


