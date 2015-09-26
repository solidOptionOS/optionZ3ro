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
echo -e $BLUE"Udpating with Apt-Get and Aptitude "$ENDCOLOR;
sudo apt-get update
sudo aptitude update
echo -e $BLUE"Upgrading with Aptitude "$ENDCOLOR;
sleep 0.5
sudo aptitude upgrade -y
echo -e $BLUE"Upgrading Distro with Aptitude "$ENDCOLOR;
sleep 0.5
sudo aptitude dist-upgrade -y
echo -e $BLUE"Fixing missing or broken packages with Aptitude "$ENDCOLOR;
sleep 0.5
sudo aptitude -f install
echo -e $BLUE"Upgrading with Apt-Get "$ENDCOLOR;
sleep 0.5
sudo apt-get upgrade -y
echo -e $BLUE"Upgrading Distro with Apt-Get "$ENDCOLOR;
sleep 0.5
sudo apt-get dist-upgrade -y
echo -e $BLUE"Fixing missing or broken packages with Apt-Get "$ENDCOLOR;
sleep 0.5
sudo apt-get install -f
echo -e $BLUE"Removing old or obsolete packages "$ENDCOLOR;
sleep 0.5
sudo apt-get autoremove
echo -e $BLUE"Cleaning Apt-Get Archives "$ENDCOLOR;
sleep 0.5
sudo apt-get clean
echo -e $BLUE"Updating Database "$ENDCOLOR;
sleep 0.5
sudo updatedb
echo -e $BLUE"Updating initframs "$ENDCOLOR;
sleep 0.5
sudo update-initframs -uv
echo -e $BLUE"Updating Grub "$ENDCOLOR;
sleep 0.5
sudo update-grub
echo -e $BLUE"Updating Grub2 "$ENDCOLOR;
sleep 0.5
sudo update-grub2
echo -e $BLUE"Update Complete "$ENDCOLOR;
sleep 0.5
echo ""
echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $YELLOW"Have A Solid Day"$ENDCOLOR;
echo ""
