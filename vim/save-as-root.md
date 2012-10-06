# Save file without initial permissions

If you forgot to use sudo when editing the file you can use the ``!<cmd>``
operator to run an external command, in this case being tee, ``%`` is 
substituted with the filename used when opening:

```vim
:w !sudo tee %
```
