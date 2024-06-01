#! /bin/sh
if [ $# -ne 2 ]; then
    echo "Usage: $0 <ssid> <psk>"
    exit 1
fi

SSID="$1"
PSK="$2"
CONF_FILE="/tmp/wpa_supplicant.conf"

if ! grep -q "$SSID" "$CONF_FILE"; then
    cat <<EOT >> "$CONF_FILE"
    network={
        ssid="$SSID"
        psk="$PSK"
        priority=1
        scan_ssid=1
    }
EOT
    /mnt/tf/tools/wpa_cli -p /tmp/wpa_supplicant reconfigure
fi