# Networked containers with `unshare`

`unshare` namespaces certain aspects of a program (fs, network etc).

bridge-utils is a good choice to make it happend, the process is
simple: setup a virtual interface, add it to a bridge interface,
set the iface owner and configure it.

## Configuration

```bash
brctl addbr unshared
ifconfig unshared 172.29.0.1/24
```

Now add a client:

```bash
ip link add name ush0 type veth peer name ush0p
brctl addif unshared ush0p
unshare -muin /bin/bash
> echo $$
ip link set ush0 netns <$$>
ip link set ush0 up
# Now on client
> ifconfig lo up
> ifconfig ush0 172.29.0.2/24 up
```
