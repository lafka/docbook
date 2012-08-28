# Secondary index queries w/erlang client

Regular index lookup
```erlang
{ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 8087),
riakc_pb_socket:get_index(Pid, <<"test1">>, <<"field_int">>, <<"123">>).
```

Lookup and pipe to map reduce
```erlang
{ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 8087), 
CompMatch = fun(X, _Acc0) -> X end,
riakc_pb_socket:mapred(Pid,
                       {index, <<"test1">>, <<"field_int">>, <<"123">>},
                       [{reduce, {qfun, CompMatch}, none, true}]).
```

Lookup and pipe to mapreduce using composite keys & key filters
```erlang
{ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 8087),
Index = {index, <<"test1">>, <<"field_int">>, <<"123">>},
{ok, Filter} = riak_kv_mapred_filters:build_filter([[<<"ends_with">>,"1"]]).
MapReduce = [
  { reduce
  , {qfun, fun(X, F) -> lists:filter(fun({A, B}) -> F(B) end, X) end}
  , riak_kv_mapred_filters:compose(Filter)
  , true}],
riakc_pb_socket:mapred(Pid, Index, MapReduce).
```

Or the much more elegant solution of binary matching:
```erlang
{ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 8087),
BinMatch = fun(X, none) -> [{B, K} || {B, <<"key1">> = K} <- X] end,
riakc_pb_socket:mapred(Pid, {index, <<"test1">>, <<"field_int">>, <<"123">>},
                            [{reduce, {qfun, BinMatch}, none, true}]).
```
