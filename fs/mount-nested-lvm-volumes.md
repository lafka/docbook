# Mount nested LVM volumes


```bash
# Get kpartx,
apt-get install kpartx

# Add partition mappings
kpartx -a /dev/delta/ipa-disk

ls /dev/mapper
control               delta-ipa--disk       delta-ipa--disk3      delta-swap            
delta-delta           delta-ipa--disk1      delta-ipa--swap       storage-media         
delta-freeipa--disk   delta-ipa--disk2      delta-root            storage-virt--backup  

# Now you can mount!
mount /dev/mapper/delta-ipa--disk2 /mnt/

# And last remove the partition mappins
kpartx -d /dev/delta/ipa-disk
```

