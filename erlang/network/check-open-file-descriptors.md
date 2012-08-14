# Find all open proc/file descriptors

Some times you wake up to a ``erl_crash .dump`` file and some debug containing ``{{system_limit,[{erlang,spawn_link, [erlang,apply, [#Fun<file_io_server.0.53902168>,[]]]} ...``

This is becouse the system runs out of file descriptors to use (it can be circumvented by passing +P to erl) or processes.

## Find all open file descriptors
Looks up all open ports and their type.

```erlang
1> [erlang:port_info(P) || P <- erlang:ports()].                                               
[[{name,"efile"},
  {links,[<0.3.0>]},
  {id,1},
  {connected,<0.3.0>},
  {input,0},
  {output,0}],
  %% ...
  ]
```

## Find all running proccesses

To retrieve all processes on the current node ``processes/0`` can be used, 
after that either ``process_info/1`` or ``process_info/2`` may be used to
get more information about given process.

```erlang
1> [process_info(P, [current_function,initial_call]) || P <- processes()].
[[{registered_name,init},
  {current_function,{init,loop,1}},
  {initial_call,{otp_ring0,start,2}},
  {status,waiting},
  {message_queue_len,0},
  {messages,[]},
  {links,[<0.5.0>,<0.6.0>,<0.3.0>]},
  {dictionary,[]},
  {trap_exit,true},
  {error_handler,error_handler},
  {priority,normal},
  %% ...
  ]]
```

'''Filters can be achived by using process_info/2'''
```erlang
1> [process_info(P, [current_function,initial_call]) || P <- processes()].
[[{current_function,{init,loop,1}},
  {initial_call,{otp_ring0,start,2}},
  {status,waiting}],
 [{current_function,{erl_prim_loader,loop,3}},
  {initial_call,{erlang,apply,2}},
  {status,waiting}],
 [{current_function,{gen_event,fetch_msg,5}},
  {initial_call,{proc_lib,init_p,5}},
  {status,waiting}],
  %% ...
  ]
```

