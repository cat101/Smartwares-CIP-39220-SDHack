# Smartwares CIP 39220 SDHack

This repo contains a firmware mod for the 
[Smartwares CIP-39220 outdoor IP camera](https://www.smartwares.eu/en-gb/smartwares-products/camera-systems/ip-cameras/perfion__networkconnection=lan-wifi/smartwares-cip-39220-180-ip-camera-outdoor-cip--39220). I originally tried to install [OpenIPC](https://openipc.org/) on this camera but unfortunately the [Anyka chipset](https://openipc.org/cameras/vendors/anyka) is not supported. This is why I created this FW mod of the factory firmware (tested on v3.6.60).



## Features
 * ftp & telnet
   * run `start_ftpd.sh` to start ftp server
 * watchcat
   * A script that restarts wifi/camera if disconnected
 * Newer busybox with all tools built-in
 * Newer wpa_supplicant
 * Access to all the config native config settings
   * Configure main and sub RTSP streams

## Installation
 1. Install EseeCloud android app. Don't use the SW360 app.
 1. Setup camera with cloud connection
 1. Configure your router DHCP server to give an static IP to the camera.
 1. Clone this repo in an sd card and edit `sdhack_settings.ini`. 
 1. Insert the sdcard in camera an let it boot.
 1. Telnet into camera to check that the hack worked (use the password configured in `sdhack_settings.ini`)
 1. Optionally block camera's mac address on firewall so that it cannot connect to the cloud. The android app will continue to work when used on the same network
 1. Adjust settings on .json files as needed

## How does the hack work?
At boot time the factory firmware will transfer control to `anyka_ipc_nostrip` if present on the SD Card. I use this to take control of the boot process, change root password and change configuration files. 

Since most of the partitions on the camera are read-only, I map the original firmware files to the SD Cards.


## About the camera
 * AK39Ev330 series chipset (Sometimes referred as akv330)
   * CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), * cr=0005317f
   * CPU: VIVT data cache, VIVT instruction cache
   * Machine model: ak3919ev300_v601_f37 dev board
   * Memory policy: Data cache writeback
   * ANYKA CPU AK39XXEV330 (ID 0x20160101)
 * Altobeam 60321 WIFI module

## Other resources
 * [Booting Custom RootFS from SDCARD](https://ricardojlrufino.wordpress.com/2022/02/15/hack-ipcam-anyka-booting-rootfs-from-sdcard/)
