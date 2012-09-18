# Generate a sequence of IP4 addresses 

```erlang
p(X) ->
	<<A:8, B:8, C:8, D:8>> = <<X:32>>,
	io:format("~p.~p.~p.~p~n", [A, B, C, D]).

lists:foreach(fun p/1, lists:seq(16#FFFFFF00, 16#FFFFFFFF)).
```
