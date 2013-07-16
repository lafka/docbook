# Using Escript archive in codepath

We are gathering a few scripts (relx, edam, rebar, tiberius etc) that
includes some API's. Due to the experimental support of archives in
Erlang you can't add these directly to code path. Luckily since
Escript are just archives anyway, we can tell it where code should
come from!

```erlang
File = "tiberius",
{ok, Info} = file:read_file_info(File),
{ok, Parts}  = escript:extract(File, [])
{archive, Buf} = lists:keyfind(archive, 1, Parts)m
erl_prim_loader:set_primary_archive(File, Buf, Info, fun escript:parse_file/1).
% By now you should be able to load code by using code:ensure_loaded/1
% if that's not the case you might need to call code:add_path/1
```

This should allow us to make tighter integration between the scripts
out there.
