# Compile and unit test a single module 

When running `rebar eunit` in projects with multiple dependencies things
take exceptionally long time (even when specifying _suites=<module>_).

To combat this it's faster to run init in the shell with `<module>:test()`
but then you end up with _.beam_ files in your _src/_ folder.

The last option is to make some sort of script for this:

```shell
MODULE=tavern_marshal_xml
erlc -I include -o ebin src/${MODULE}.erl && erl -pa ebin -s eunit test ${MODULE} -run init stop
```
