#! /bin/sh

if [ -z "$1" ]; then
  echo "Error: No password provided"
  exit 1
fi

umount /etc/passwd
mount --bind /mnt/tf/config /etc
echo "root:$1" | /mnt/tf/tools/busybox-1.36.1-lite chpasswd
umount /etc/
mount --bind /mnt/tf/config/passwd  /etc/passwd