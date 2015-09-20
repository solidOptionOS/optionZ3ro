#!/bin/bash 
echo "Initializing Monitor Mode: "
echo "Select Wireless Interface: "
read INTERFACE 
ifconfig $INTERFACE down
macchanger $INTERFACE -a
iw dev $INTERFACE set type monitor 
ifconfig $INTERFACE arp multicast allmulti promisc mtu 1492 0.0.0.0 0.0.0.0 && dhclient
ifconfig $INTERFACE up
echo "Monitor Mode ENABLED: "
iw $INTERFACE info 
echo "Specify Wireless Band: "
read BAND 
airodump-ng --band $BAND $INTERFACE ;; timeout 15 exit 1 ;
gnome-root-terminal -e | echo "Specify Channel: "
read CHANNEL
echo "Specify ESSID: "
read ESSID
echo "Specify BSSID: "
read BSSID 
echo "Capturing Acknowledgements: "
echo "AP Uptime Enumeration: "
echo "Hardware Manufacturer Enumeration: "
echo "Specify Capture File Name: "
read CAPTURE 
echo ".cap file Generated pcap Capture: "

airodump-ng --channel $CHANNEL --essid $ESSID --bssid $BSSID --showack -MU -w $CAPTURE $INTERFACE --output-format pcap