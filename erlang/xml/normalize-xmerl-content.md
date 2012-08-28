# Normalize xmerl_scan content

```erlang
-include_lib("xmerl/include/xmerl.hrl").

f({#xmlElement{name = K, content = V}, _}) -> 
	{K, f(V)};
%% Only include text, type = cdata for comments aswell
f([#xmlText{value = V, type = text}]) ->
	V;
f(X) when is_list(X) ->
	[{K, f(V)} || #xmlElement{name = K, content = V} <- X].
```

Just call `f/1` with `xmerl_scan:string/1` content:

```erlang
io:format("xml: ~p~n", [f(xmerl_scan:string(
	"<?xml version=\"1.0\"?><root>"
		"<level1>foobar</level1>"
		"<level1><nested>bar</nested></level1>"
	"</root>"))]).
```
