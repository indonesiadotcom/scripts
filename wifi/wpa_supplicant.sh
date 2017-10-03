wpa_supplicant -Dwext -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf &
killall -9 dhclient
sleep 1
dhclient
