```
AT+MSER=1   # UART Bridge
AT+MDBG=1,1 # Set debug mode
AT+WOPEN=0  # Close app
AT+WMFM=0,0,2 # Close UART-2
AT+WMFM=0,1,3 # Open UART-3 (USB)
```
