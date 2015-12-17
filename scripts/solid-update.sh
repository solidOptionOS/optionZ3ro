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
echo ""
echo ""
echo -e $YELLOW"Solid-Update"$ENDCOLOR;
echo ""
sleep 1

echo -e $YELLOW"Would you like to clean and purge first? [y/n]"$ENDCOLOR;
read CLEANPURGE

if [[ $CLEANPURGE = 'y' || $CLEANPURGE = 'Y' ]] ; then

	echo -e $GREEN"'It's time to purge, Morty!'"$ENDCOLOR;
	sleep 2
	echo ""
	echo -e $BLUE"[apt-get autoremove clean autoclean]"$ENDCOLOR;
	sleep 1
	sudo apt-get autoremove
	sudo apt-get clean 
	sudo apt-get autoclean
	echo -e $GREEN"Done."$ENDCOLOR;
	sleep 1
	echo ""

	echo -e $BLUE"[rm -rf /var/cache/apt/archives/]"$ENDCOLOR;
	sleep 1
	sudo rm -rf /var/cache/apt/archives/
	echo -e $GREEN"Done."$ENDCOLOR;
	sleep 1
	echo ""

else

	echo -e $YELLOW"Fine then..keep your trash. You disgust me..."$ENDCOLOR;
	echo ""

fi

echo -e $YELLOW"Updating package cache.. "$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[apt-get update]"$ENDCOLOR;
sleep 1
sudo apt-get update
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[aptitude update]"$ENDCOLOR;
sleep 1
sudo aptitude update 
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[apt-get autoremove]"$ENDCOLOR;
sleep 1
sudo apt-get autoremove
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"Installing apt-file "$ENDCOLOR;
sleep 1
sudo apt-get install apt-file -y
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $YELLOW"Updating apt-file.. "$ENDCOLOR;
echo -e $RED"This may take a while depending on your system. "$ENDCOLOR;
sleep 1
sudo apt-file update
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $YELLOW"Upgrading packages.. "$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[apt-get upgrade]"$ENDCOLOR;
sleep 1
sudo apt-get upgrade
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[apt-get dist-upgrade]"$ENDCOLOR;
sleep 1
sudo apt-get dist-upgrade 
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[aptitude upgrade]"$ENDCOLOR;
sleep 1
sudo aptitude upgrade
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[aptitude dist-upgrade]"$ENDCOLOR;
sleep 1
sudo aptitude dist-upgrade
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $YELLOW"Removing old packages and cleaning up.."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[apt-get autoremove]"$ENDCOLOR;
sleep 1
sudo apt-get autoremove
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[apt-get autoclean]"$ENDCOLOR; 
sleep 1
sudo apt-get autoclean
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""


echo -e $YELLOW"Would you like to try and repair any broken packages? [y/n] "$ENDCOLOR;
read fixornot

if [[ $fixornot = 'y' || $fixornot = 'Y' ]] ; then

	echo ""
	echo -e $YELLOW"OK. Attempting to repair broken packages.. "$ENDCOLOR;
	sleep 1
	echo ""
	
	echo -e $BLUE"[apt-get update --fix-missing]"$ENDCOLOR;
	sleep 1
	sudo apt-get update --fix-missing
	echo -e $GREEN"Done."$ENDCOLOR;
	sleep 1
	echo ""

	echo -e $BLUE"[apt-get upgrade --fix-broken]"$ENDCOLOR;
	sleep 1
	sudo apt-get upgrade --fix-broken
	echo -e $GREEN"Done."$ENDCOLOR;
	sleep 1
	echo ""

	echo -e $BLUE"[aptitude -f install]"$ENDCOLOR;
	sleep 1
	sudo aptitude -f install
	echo -e $GREEN"Done."$ENDCOLOR;
	sleep 1
	echo ""

	echo -e $BLUE"[apt-get -f install]"$ENDCOLOR;  
        sleep 1
        sudo apt-get -f install
	echo -e $GREEN"Done."$ENDCOLOR;
	sleep 1
	
	echo -e $GREEN"Repair complete."$ENDCOLOR;
	sleep 1
	echo ""

	echo -e $YELLOW"Are you still having problems? [y/n]"$ENDCOLOR;
	read moproblems

	if [[ $moproblems = 'y' || $moproblems = 'Y' ]] ; then
	
		sleep 1
		echo ""
		echo -e $YELLOW"Attempting fix with full-resolver.."$ENDCOLOR;
		echo -e $RED"This may take a while.."$ENDCOLOR;
		sleep 1
		echo -e $BLUE"[aptitude -f install --full-resolver]"$ENDCOLOR;
		sleep 1
		aptitude -f install --full-resolver
		echo -e $GREEN"Done."$ENDCOLOR;
		sleep 1
		echo ""
		
		echo -e $GREEN"Full-Resolver repair complete!"$ENDCOLOR;
		sleep 1
		echo ""
	else
		echo -e $YELLOW"Awesome! Good for you! Moving on.."$ENDCOLOR;
		sleep 1
		echo ""

	fi
else

	echo -e $YELLOW"Okay, Mr. Perfect - moving on."$ENDCOLOR;
	sleep 1
	echo ""

fi

echo -e $BLUE"Updating USB IDs.."$ENDCOLOR;
sleep 1
update-usbids
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"Updating PCI IDs.."$ENDCOLOR;
sleep 1
update-pciids
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"Updating airodump oui data.."$ENDCOLOR;
sleep 1
sudo airodump-ng-oui-update
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"Updating database.."$ENDCOLOR;
sleep 1
updatedb
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"Updating initramfs.."$ENDCOLOR;
sleep 1
update-initramfs -uv
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $YELLOW"Updating grub and grub2.."$ENDCOLOR;
sleep 1
echo -e $BLUE"[update-grub]"$ENDCOLOR;
sleep 1
update-grub
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""

echo -e $BLUE"[update-grub2]"$ENDCOLOR;
echo ""
update-grub2
echo -e $GREEN"Done."$ENDCOLOR;
sleep 1
echo ""
	
sleep 1
echo -e $GREEN"Operation complete!"$ENDCOLOR;
sleep 1
echo "" 
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#    Solid Update Complete.     #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
exit
