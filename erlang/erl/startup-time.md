# erl takes a long time to startup

If you are connected to the internet, ``erl`` tries to guestimate the fqdn of
your machine. This means looking up in hosts files, dns records and what not.
The longer it takes for this lookup, the longer it takes for erlang to start.

The quickest way is to fix ``/etc/hosts`` on your system as this is system
specific, and as far as i know, has no way to be set in ``erl``.
