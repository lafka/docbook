# Quickly parse a TinyMesh device config

Prerequisit: ``tinymesh-erlang-parser``

Fetch the config by putting the module in configuration mode.

```sh
# Start in one shell
socat /dev/ttyUSB1 - | tee /tmp/config | hexdump -C

# Call from different shell
echo -n 0 > /dev/ttyUSB1

# Finaly run
erl -pa ebin -eval <<EOF
{ok, C} = file:read_file("/tmp/config"),
io:format("config: ~p~n", [tinymesh_config:unpack(C)]),q().
EOF
```
