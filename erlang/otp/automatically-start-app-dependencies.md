# Automatically start application dependencies

OTP releases does lots of magical things for you, one of these are starting
application dependencies automatically. To ease the pain you can make the same
functionality by loading the _.app_ resource file:

```erlang
fun(F, App) ->
         application:load(App),
         case application:get_key(App, applications) of
             {ok, Deps} ->
                 [application:start(F(F,X)) || X <- Deps],
                 application:start(App);
             undefined -> ok end,
         App end,
my_app = F(F, my_app).
```

This is only to make it easier on the development process you should still
realy on OTP behaviour to fix this for you in releases.

If you like makefiles just add it like this:
```makefile
ERL?=erl
APP?=$(shell basename $(PWD))

# ... regular stuff

run: compile
	$(ERL) -pz deps/*/ebin -pz ebin -eval <insert the above fun here>
```

