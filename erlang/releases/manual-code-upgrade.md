# Performing manual code upgrades

_.appup_ and _.relup_ are nice but gets slow to generate releases for every code
change. Luckily we can do this manualy using the "code":http://erlang.org/doc/man/code.html
and "sys":http://erlang.org/doc/man/sys.html modules.

```erlang
Module = myserver,
sys:suspend(Module),
code:purge(Module),
code:load_file(Module),
ok = sys:change_code(Module, Module, "0", []),
sys:resume(Module).
```
