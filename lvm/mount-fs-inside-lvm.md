# Mount partition residing inside lvm volume

First let's check what we got:
```bash
root@delta:/var/virt# kpartx -l /dev/delta/ipa-disk
delta-ipa--disk1 : 0 1024000 /dev/delta/ipa-disk 2048
delta-ipa--disk2 : 0 9459712 /dev/delta/ipa-disk 1026048
```

Add parition mappings and mount (in case of lvm, just use pvscan/vgchange)
```bash
root@delta:/var/virt# kpartx -a /dev/delta/ipa-disk
root@delta:/var/virt# mount /dev/mapper/delta-ipa--disk2 /mnt/ipa-disk
```


Cleanup to make volume usable again
```bash
root@delta:/var/virt# umount /mnt/ipa-disk
root@delta:/var/virt# kpartx -d /dev/delta/ipa-disk

