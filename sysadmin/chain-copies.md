# Chain copy over multiple servers

On your last machine in the chain open up a port and pipe it to gzip and pack it all out: 
```sh
nc -l 9999 | gzip -d | tar xvf -
```

For each individual node that needs a copy just setup netcat, create a named pipe
for distributing data further on while it decompresses everthing localy
```sh
mkfifo pipe
nc $TARGET 9999 < pipe &
nc -l 9999 | tee pipe | gzip -d | tar xvf -
```

Finaly you can send the data by just tar'ing and sending it over the wire:
```sh
tar cv * | gzip | nc $TARGET 9999
```
