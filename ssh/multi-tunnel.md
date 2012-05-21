# 'NAT' with ssh multi-tunnel 
Accessing things behind firewalls is easy enought, sometimes you need to do this over non-standard aswel which complicates things abit.

```bash
ssh -L 9999:localhost:9998 usr@tunnel-pt1 ssh -L 9998:localhost:8080 -N usr@tunnel-pt2 -p 2022
```
