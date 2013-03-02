# Find deleted stash

If you accidentally removed your uncommitted changes with something
like `git reset --hard` and it has been stashed at some point, you
might be lucky. Most things in git can be related to a commit, so if
you haven't closed the terminal just scroll up and find it (look after
something like: `Dropped refs/stash@{0} (5d4ad30ae09beddbdfc93d026d2871f4a001fdce)`).

If your not that luck you can use `git fsck` to find lost refs:

```bash
git fsck --no-reflog | awk '/dangling commit/ {print $NF}'
```

This shows all commits that used to be in a ref, but no longer aren't,
for instance dropped stash.

Now the commit gives you little, so use `git show` to give us some
stats:

```bash
git show --stat $(git fsck --no-reflog | awk '/dangling commit/ {print $NF}')
```
