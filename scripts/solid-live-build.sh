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
echo -e $YELLOW"Create a live build image"$ENDCOLOR;

echo -e $BLUE"Let's get started. "$ENDCOLOR;
sleep 2
apt-get -y -qq install live-build cdebootstrap git kali-archive-keyring
cd /var/tmp/
git clone git://git.kali.org/live-build-config.git
cd live-build-config/
#lb clean --purge
lb config


echo -e $BLUE"Configure Kali Image .ISO"$ENDCOLOR;
sleep 1
echo -e $YELLOW"Remove Gnome for a lighter weight version? [ y | n ]"$ENDCOLOR;
read GNOMEORNOT
if [[ $GNOMEORNOT = Y || $GNOMEORNOT = y ]] ; then
sed -i 's/^gnome/#gnome/g' config/package-lists/kali.list.chroot
else
echo -e $BLUE"Ok, keeping gnome."$ENDCOLOR;
echo ""
fi

echo -e $YELLOW"Install XFCE? [ y | n ]"$ENDCOLOR;
read XFCEORNOT
if [[ $XFCEORNOT = Y || $XFCEORNOT = y ]] ; then
grep 'xfce4' config/package-lists/kali.list.chroot -B1 | grep -q -v '*** XFCE DESKTOP ***\|xfce4' || echo -e '\nxfce4\nnetwork-manager-gnome\nnetwork-manager' >> config/package-lists/kali.list.chroot
else
echo -e $BLUE"Ok, not installing XFCE."$ENDCOLOR;


echo -e $BLUE"Building the ISO "$ENDCOLOR;
echo -e $YELLOW"Allow building x64 on x86? [ y | n ]"$ENDCOLOR;
read ADDAMD
if [[ $ADDAMD = Y || $ADDAMD = y ]] ; then
dpkg --add-architecture amd64
else
echo -e $BLUE"Ok."$ENDCOLOR;
fi
sleep 1
echo -e $BLUE"[apt-get]Updating before build... "$ENDCOLOR;
echo ""
apt-get update
echo -e $YELLOW"Setup caching? [ y | n ] (Enable if you wish todo a lot of custom ISOs)"$ENDCOLOR;
read CACHESETUP
if [[ $CACHESETUP = Y || $CACHESETUP = y ]] ; then
apt-get -y -qq install apt-cacher-ng
service apt-cacher-ng start
export http_proxy=http://localhost:3142/
else
echo -e $BLUE"Ok,maybe later!"$ENDCOLOR
fi
export http_proxy=http://localhost:3142/

echo -e $YELLOW"Remove PAE from kernel? "$ENDCOLOR;
read PAEREMOVE
if [[ $PAEREMOVE = Y || $PAEREMOVE = y ]] ; then
sed -i 's/686-pae/486/g' auto/config
lb clean
else
echo -e $BLUE"Ok,maybe later!"$ENDCOLOR
fi
sleep 1

echo -e $YELLOW"Set architecture: [ amd64 or i386 ]"$ENDCOLOR;
read ARCH
lb config --architecture $ARCH
echo -e $BLUE"Setup complete."$ENDCOLOR;
echo ""
sleep 0.5
echo -e $YELLOW"Ready to build? [ y | n ] (This will take a long time.)"$ENDCOLOR;
read GOBUILD
if [[ $GOBUILD = Y || $GOBUILD = y ]] ; then
lb build
echo -e $BLUE"Complete."$ENDCOLOR;
echo""
sleep 1
echo -e $BLUE"Starting Post Build tasks"$ENDCOLOR;
sleep 0.5
echo -e $BLUE"Moving file somewhere that will 'last'"$ENDCOLOR;
mv -f binary.hybrid.iso ~/custom.kali.iso

#--- Show it
ls -lh ~/custom.kali.iso

echo -e $BLUE"Creating checksums..."$ENDCOLOR;
echo ""
md5sum ~/custom.kali.iso
sha1sum ~/custom.kali.iso
sleep 1
echo ""
echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo "Have A Solid Day"
echo ""

else
echo -e $BLUE"Ok. When you are ready, use 'lb build' to create your custom iso"$ENDCOLOR;
echo ""
echo ""
echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo "Have A Solid Day"
echo ""
fi


