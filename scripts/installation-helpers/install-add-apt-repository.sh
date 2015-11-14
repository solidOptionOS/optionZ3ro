#!/bin/bash
apt-get install python-software-properties
sleep 1
apt-get install apt-file
sleep 1
apt-file update
sleep 1
echo "Using apt-file search to find add-apt-repository"
apt-file search add-apt-repository
sleep 1
echo "Modifying add-apt-repository with ~/optionZ3ro/scripts/add-apt-repository in /usr/sbin.."
sleep 1
cp /root/optionZ3ro/scripts/add-apt-repository /usr/sbin/add-apt-repository
sleep 0.5 
echo "Changing permissions and ownership.. "
sleep 1
chmod o+x /usr/sbin/add-apt-repository
chown root:root /usr/sbin/add-apt-repository
sleep 1
echo "Done."
echo ""
echo "Installing custom themes and icons.."
/usr/sbin/add-apt-repository ppa:noobslab/themes
/usr/sbin/add-apt-repository ppa:alecive/antigone
echo ""
sleep 1
echo "Operation Complete."

