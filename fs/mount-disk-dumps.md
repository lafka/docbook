# Mount disk dumps

Disks dumped with `dd` can be mounted locally by using the `offset`
option.

## Find offset
```bash
## We are using fdisk here, but file or parted can be used aswell
$ fdisk -l dump.img

...
Units = sectors of 1 * 512 = 512 bytes

                     Device Boot      Start         End      Blocks   Id  System
Cubian-base-r4-arm-a10.img1            2048     1955839      976896   83  Linux
```

Using the sector size 512 and start point 2048 we can find the correct
offset by multiplying them, in this case `512 * 2048 = 1048576`.

```bash
mount -o ro,loop,offset=$((512*2048)) Cubian-base-r4-arm-a10.img /tmp/cubian
```
