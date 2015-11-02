#!/bin/bash
echo "Do you want to uninstall linux kernel 4.2.3?: [y/n]"
read UNINSTALLKERNEL
if [[ $UNINSTALLKERNEL = 'y' || $UNINSTALLKERNEL = 'Y' ]] ; then
sudo apt-get remove 'linux-headers-4.2.3*' 'linux-image-4.2.3*'
sleep 1
echo ""
echo "Operation Complete."
