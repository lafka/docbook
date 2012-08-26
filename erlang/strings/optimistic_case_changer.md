# Crude way of changing case of string

```erlang
latin1_bin_to_lower(Bin) ->
	F = fun(Char) when Char >= 65 andalso Char =< 90 -> Char + 32; (Char) -> Char end,
	<< <<(F(C))>> || <<C>> <= Bin>>.

latin1_bin_to_upper(Bin) ->
	F = fun(Char) when Char >= 90 andalso Char =< 122 -> Char - 32; (Char) -> Char end,
	<< <<(F(C))>> || <<C>> <= Bin>>.
```
