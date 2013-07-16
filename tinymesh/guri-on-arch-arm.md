# Installing archlinux on ARM (Rasperry Pi)

## Prepare SD card
1. Fetch archives from Archlinux ARM: http://archlinuxarm.org/platforms/armv6/raspberry-pi
2. Unzip archive (i.e. `unzip http://archlinuxarm.org/os/rpi/archlinux-hf-2013-06-15.img.zip`)
3. Write to disk `sudo dd bs=1M if=archlinux-hf-2013-06-15.img of=/dev/mmcblk0`

## Install software:
```bash
pacman -Syu
pacman -S python2-pyserial twisted git sudo
groupadd guri
adduser guri && usermod -aG guri
passwd guri
```

## Fix sudoers
```sudoers
Cmnd_Alias TTYSETUP=/home/guri/ttysetup,/usr/bin/chown * /dev/ttyUSB*

%guri ALL=NOPASSWD: TTYSETUP
guri ALL=(guri) NOPASSWD: TTYSETUP
```

## Install & run GURI
```bash
# Run this when logged in as guri
git clone git://github.com/tinymesh/guri
curl -o ttysetup https://raw.github.com/lafka/dotconfig/master/bin/ttysetup
chmod +x ttysetup
$HOME/ttysetup ttyUSB0 && python2 $HOME/guri/guri.py /dev/ttyUSB0 tinylab.no
```


## Run as background daemon
Install Guri as a systemd daemon.

_Generate startup script_
```bash
mkdir -p ~/log
echo '#!/bin/sh' > $HOME/start-guri.sh
echo "$HOME/ttysetup \$(basename \$1) && " \
	"/usr/bin/python2 $HOME/guri/guri.py \$@" \
	" >> $HOME/log/\$(date -I)" >> $HOME/start-guri.sh
chmod +x $HOME/start-guri.sh
```


**/usr/lib/systemd/system/guri.service**
```systemd
[Unit]
Description=Remote interface for TinySolution cloud platform
After=network.target

[Service]
User=guri
Type=simple
ExecStart=/home/guri/start-guri.sh /dev/ttyUSB0 tinylab.no
ExecStop=/usr/bin/kill $(/usr/bin/pgrep -f guri.py)

[Install]
WantedBy=multi-user.target
```

**Enable on startup**:
```bash

