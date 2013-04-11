# Ensure node sync on startup

__Disclaimer:__,_ stolen from Fred: http://stackoverflow.com/questions/13729797/the-impact-of-a-distributed-application-configuration-on-node-discovery-via-net_

The kernel application documentation mentions the way to synchronize
nodes in order to stop the boot phase until ready to move forward and
everything is in place. Here are the options:

```
sync_nodes_mandatory = [NodeName]
```

Specifies which other nodes must be alive in order for this node to start
properly. If some node in the list does not start within the specified
time, this node will not start either. If this parameter is undefined,
it defaults to [].

```
sync_nodes_optional = [NodeName]
```

Specifies which other nodes can be alive in order for this node to start
properly. If some node in this list does not start within the specified
time, this node starts anyway. If this parameter is undefined, it defaults
to the empty list.

A file using them could look as follows:

```erlang
[{kernel,
  [{sync_nodes_mandatory, [b@ferdmbp, c@ferdmbp]},
   {sync_nodes_timeout, 30000}]
}].
```
Starting the node a@ferdmbp by calling erl -sname a -config config-file-above.
The downside of this approach is that each node needs its own config file.
