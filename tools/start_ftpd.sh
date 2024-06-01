#!/bin/sh
tcpsvd -vE 0.0.0.0 21 /mnt/tf/tools/busybox-1.36.1-lite  ftpd -wv -A -a root / &> /dev/null &
