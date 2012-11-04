# Getting job control in BusyBox

Since Busybox runs under /dev/console it lacks a controlling terminal. This
can be fixed by spawning a new session pointed to tty1

```sh
setsid sh -c 'exec sh </dev/tty1 >/dev/tty1 2>&1'
```

