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
echo -e $BLUE"Fetching SolidOptionOS Backgrounds"$ENDCOLOR;
sleep 1
mkdir ~/Pictures
cd ~/Pictures
wget https://solidoptionos.com/pics/soos-images.zip
echo ""
echo -e $BLUE"Extracting images.."$ENDCOLOR;
sleep 1
unzip soos-images.zip
rm -rf __MACOSX/
echo ""
echo -e $YELLOW"Would you like to update desktop, grub, and login default images with SolidOptionOS images?: [y/n]"$ENDCOLOR;
read UPDATEDEFAULTIMGS
if [[ $UPDATEDEFAULTIMGS = 'y' || $UPDATEDEFAULTIMGS = 'Y' ]] ; then
echo ""
echo -e $BLUE"Creating backups.." $ENDCOLOR;
sleep 1
mkdir /usr/share/images/desktop-base/backup
cp /usr/share/images/desktop-base/*.png /usr/share/images/desktop-base/backup
mkdir /usr/share/gnome-shell/theme/backup
cp -rf /usr/share/gnome-shell/theme/* /usr/share/gnome-shell/theme/backup
sleep 1
echo ""
echo -e $BLUE"Updating defaults.."$ENDCOLOR;
sleep 1
mv /usr/share/images/desktop-base/login-background.png /usr/share/images/desktop-base/login-background.png.old
cp ~/Pictures/login-background.png /usr/share/images/desktop-base/login-background.png
cp ~/Pictures/login-background.png /usr/share/gnome-shell/theme/KaliLogin.png
echo ""
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#     Operation Complete.       #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
echo ""
exit 0

else
echo -e $BLUE"Ok. Maybe some other time.  Goodbye."$ENDCOLOR;
exit 0
fi

## for changing installation background
## mv usb:\isolinux\splash.png usb:\isolinux\splash.png.bak
## cp /home/solid/Picures/soos-splash.png usb:\isolinux\splash.png
