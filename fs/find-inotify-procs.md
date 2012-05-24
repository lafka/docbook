# Find processes that uses inotify

When you start getting messages like these:
```
tail: inotify resources exhausted
tail: inotify cannot be used, reverting to polling
```

It means you are using to many inotify process (these are controlled by __fs.inotiy.max_*__
sysctl settings). To find out your current settings you can always query ``/proc/fs/inotify``
manualy or run ``sysctl -a --pattern inotify``.

You can then cross-check with the number of proccesses using inotify by using find:
```bash
find /proc/*/fd/* -type l -lname '*:inotify' -printf '%-20p -> %l\n' 2>1
```

