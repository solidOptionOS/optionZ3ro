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