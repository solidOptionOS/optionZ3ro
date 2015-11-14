#!/bin/bash
echo "Do you want to install linux-kernel-4.2.3?: "
read INSTALLKERNEL
if [[ $INSTALLKERNEL = 'y' || $INSTALLKERNEL = 'Y' ]] ; then
cd ~/
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2.3-unstable/linux-headers-4.2.3-040203_4.2.3-040203.201510030832_all.deb
sleep 0.5
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2.3-unstable/linux-headers-4.2.3-040203-generic_4.2.3-040203.201510030832_amd64.deb
sleep 0.5
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2.3-unstable/linux-image-4.2.3-040203-generic_4.2.3-040203.201510030832_amd64.deb
sleep 1
sudo dpkg -i linux-headers-4.2.3*.deb linux-image-4.2.3*.deb
sleep 1

else
exit 0
fi

echo "Reboot now?: [y/n]"
read REBOOTNOW
if [[ $REBOOTNOW = 'y' || $REBOOTNOW = 'Y' ]] ; then
sudo reboot

else
echo "Ok. You will see the new kernel in the grub when you reboot. "
echo ""
echo "Operation Complete."
exit 
fi
