#!/bin/bash
clear
#Colors
dgrey="\033[0;34m"
port="\033[0;33m"
RED="\033[1;31m"
GREEN="\033[2;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RED="\033[0;31m"
ENDCOLOR="\033[0m"

echo -e $RED"#################################################################"$ENDCOLOR; 
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $RED"#################################################################"$ENDCOLOR;
echo -e $YELLOW"Solid-Update"$ENDCOLOR;
echo ""
echo -e $BLUE"Cleaning and purging first "$ENDCOLOR;
apt-get autoremove && apt-get clean && apt-get autoclean
sleep 0.1
rm -rf /var/cache/apt/archives/
sleep 0.1
echo ""
echo -e $BLUE"Updating Package Cache "$ENDCOLOR;
sleep 0.5
apt-get update && aptitude update 
sleep 0.5
#echo ""
#echo -e $BLUE"Installing apt-file "$ENDCOLOR;
#sleep 0.1
#apt-get install apt-file -y
#sleep 0.5
echo -e $BLUE"Updaring apt-file "$ENDCOLOR;
echo -e $BLUE"This may take a while depending on your system "$ENDCOLOR;
sleep 0.1
apt-file update
sleep 0.5
echo ""
echo -e $BLUE"Upgrading your packages "$ENDCOLOR;
sleep 0.1
apt-get upgrade -y sudo apt-get dist-upgrade -y && aptitude upgrade -y aptitude dist-upgrade -y
sleep 0.5
echo -e $BLUE"Removing old packages "$ENDCOLOR;
apt-get autoremove $$ apt-get autoclean
sleep 0.5
echo ""
echo -e $YELLOW"Would you like to try and repair any broken packages? {y/n} "$ENDCOLOR;
read fixornot
if [[ $fixornot = 'y' || $fixornot = 'Y' ]] ; then
echo ""
echo -e $BLUE" OK. Attempting to repair broken packages "$ENDCOLOR;
sleep 0.1
apt-get update --fix-missing && apt-get upgrade --fix-broken -y
sleep 0.5
echo ""
apt-get -f install && aptitude -f install 
sleep 0.5
echo ""
else 
echo -e $BLUE"Updating database, initramfs, and grub "$ENDCOLOR;
sleep 0.1
echo ""
updatedb
sleep 0.5
echo ""
update-initramfs -uv
sleep 0.5
echo ""
update-grub && update-grub2
sleep 0.5
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#    Solid Update Complete.     #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
echo ""
exit
fi

echo -e $YELLOW"Are you still having problems? {y/n}"$ENDCOLOR;
read moproblems
if [[ $moproblems = 'y' || $moproblems = 'Y' ]] ; then
sleep 0.1
echo ""
echo -e $BLUE"Attempting fix with --full-resolver "$ENDCOLOR;
echo -e $BLUE"This may take a while... seriously..."$ENDCOLOR;
sleep 0.1
echo ""
aptititude install --full-resolver 
sleep 0.5
echo ""
echo -e $BLUE"Updating database, initramfs, and grub "$ENDCOLOR;
sleep 0.1
echo ""
updatedb
sleep 0.5
echo ""
update-initramfs -uv
sleep 0.5
echo ""
update-grub && update-grub2
sleep 0.5
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#    Solid Update Complete.     #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
echo ""
exit

else

echo ""
sudo updatedb
sleep 0.5
echo ""
update-initramfs -uv
sleep 0.5
echo ""
update-grub && update-grub2
sleep 0.5
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#    Solid Update Complete.     #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
echo ""
exit
fi
