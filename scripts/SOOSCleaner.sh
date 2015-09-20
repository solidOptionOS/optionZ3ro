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

echo -e $RED"########################################################"$ENDCOLOR; 
echo -e $GREEN"           SolidOptionOS :"$ENDCOLOR;
echo -e $RED"########################################################"$ENDCOLOR; 
echo -e $YELLOW"  _____ ___  _     ____ ___    ___  ____  ______ ____ ___  ____   ___   _____"$ENDCOLOR;
echo -e $YELLOW" / ___//   \| |   |    |   \  /   \|    \|      |    /   \|    \ /   \ / ___/"$ENDCOLOR;
echo -e $YELLOW"(   \_|     | |    |  ||    \|     |  o  |      ||  |     |  _  |     (   \_ "$ENDCOLOR;
echo -e $YELLOW" \__  |  O  | |___ |  ||  D  |  O  |   _/|_|  |_||  |  O  |  |  |  O  |\__  |"$ENDCOLOR;
echo -e $YELLOW" /  \ |     |     ||  ||     |     |  |    |  |  |  |     |  |  |     |/  \ |"$ENDCOLOR;
echo -e $YELLOW" \    |     |     ||  ||     |     |  |    |  |  |  |     |  |  |     |\    |"$ENDCOLOR;
echo -e $YELLOW"  \___|\___/|_____|____|_____|\___/|__|    |__| |____\___/|__|__|\___/  \___|"$ENDCOLOR;
echo -e $YELLOW"             Custom scripts by "$ENDCOLOR;
echo -e $YELLOW"    All rights reserved to SolidOptionOS "$ENDCOLOR;
echo -e $BLUE"           http://solidoptionos.com "$ENDCOLOR;
echo -e $RED"########################################################"$ENDCOLOR;
echo starting cbs cleaner function | festival --tts 
 
if [ $USER != root ]; then
echo -e $RED"[SFAGEAS]:Error: must be root"$ENDCOLOR
echo -e $YELLOW"[SFAGEAS]:Exiting..."$ENDCOLOR
exit 0
fi

echo ""
echo ""
apt-get install festival
sleep 0.5
echo -e $YELLOW"[SFAGEAS]:Cleaning var/temp..."$ENDCOLOR
sleep 0.5
cd /var/tmp/
sleep 0.5
rm -i /var/tmp/kdecache-bhs/* --force
rm -i /var/tmp/kdecache-bhs/* --force
rm -i /var/tmp/kdecache-bhs/http/* --force
rm -i /var/tmp/kdecache-bhs/plasma-wallpapers/usr/share/wallpapers/* --force 
rm -i /var/tmp/kdecache-root/plasma-wallpapers/* --force
rm -i /var/tmp/kdecache-root/plasma-wallpapers/usr/share/wallpapers/* --force
rm -i /var/tmp/kdecache-root/libphonon/* --force
rm -i /var/tmp/kdecache-bhs/ksplashx/* --force
rm -i /var/tmp/kdecache-bhs/ksplashx/* -f
rm -i /var/tmp/kdecache-bhs/plasma-wallpapers/home/bhs/Projects/* --force
rm -i /var/tmp/kdecache-bhs/plasma-wallpapers/home/bhs/Pictures/* --force
rm -i /var/tmp/kdecache-bhs/plasma-wallpapers/home/bhs/Desktop/* --force
rm -i /var/tmp/kdecache-root/favicons/* --force
rm -i /var/tmp/kdecache-bhs/favicons/* --force
rm -i /var/tmp/kdecache-root/ksplashx/* --force
rm -i /var/tmp/kdecache-root/plasma-wallpapers/root/Desktop/* --force
rm -i /var/tmp/kdecache-root/plasma-wallpapers/root/Pictures/* --force
rm -i /var/tmp/kdecache-root/plasma-wallpapers/usr/share/wallpapers/* --force
rm -i /var/tmp/kdecache-root/* --force
rm -i /var/tmp/yum-bhs-mPVJ7M/* --force
sleep 0.5
echo -e $BLUE"would you like to fix any broken package? y/n"$ENDCOLOR
read fix
if [[ $fix = Y || $fix = y ]] ; then
for package in $(apt-get upgrade 2>&1 | grep "warning: files list file" | sed "s/.*'//; s/://"); do apt-get install --reinstall "$package"; done
echo  "Done !"
else
echo -e $BLUE"Ok,maybe later !"$ENDCOLOR
echo""
fi
echo ""
echo ""
echo -e $YELLOW"[SFAGEAS]:Cleaning /var/log/..."$ENDCOLOR
rm -i /var/log/* -f
rm -i /var/cache/* -f
rm -i /var/log/upstart/* -f
rm -i /var/log/wicd/* -f
rm -i /var/log/unattended-upgrades/* -f
rm -i /var/log/tor/* -f
rm -i /var/log/stunnel4/* -f
rm -i /var/log/squid3/* -f
rm -i /var/log/speech-dispatcher/* -f
rm -i /var/log/rebuildd/build_logs/* -f
rm -i /var/log/rebuildd/* -f
rm -i /var/log/privoxy/* -f
rm -i /var/log/postgresql/* -f
rm -i /var/log/polipo/* -f
rm -i /var/log/openvas/* -f
rm -i /var/log/ntpstats/* -f
rm -i /var/log/news/* -f
rm -i /var/log/mysql/* -f
rm -i /var/log/mdm/* -f
rm -i /var/log/installer/* -f
rm -i /var/log/hp/* -f
rm -i /var/log/hp/tmp/* -f
rm -i /var/log/fsck/* -f
rm -i /var/log/dradis/* -f
rm -i /var/log/dist-upgrade/* -f
rm -i /var/log/dirmngr/* -f
rm -i /var/log/cups/* -f
rm -i /var/log/ConsoleKit/* -f
rm -i /var/log/chkrootkit/* -f
rm -i /var/log/boot-sav/mbr_backups/* -f
rm -i /var/log/boot-sav/* -f
rm -i /var/log/boot-sav/log/* -f
rm -i /var/log/boot-sav/log/2013-10-07__10h14boot-repair27/* -f
rm -i /var/log/apt/* -f
rm -i /var/log/apache2/* -f
echo "" 
echo -e $YELLOW"[SFAGEAS]:Cleaning /var/cache/..."$ENDCOLOR
sudo rm -v /var/cache/apt/archives/*.deb  
sleep 0.5
sudo rm -v /var/log/*.gz  -f
sleep 0.5
cd ..
sleep 0.5
sudo rm -rf ~/root/.local/share/Trash/*
sleep 0.5
cd /root/Downloads/
sleep 0.5 
rm -i /root/Downloads/* --force
sleep 0.5
echo ""
echo ""
sleep 0.5
cd ..
sleep 0.5
echo ""
echo -e $YELLOW"[SFAGEAS]:Cleaning old kernels..."$ENDCOLOR
sudo aptitude purge $OLDKERNELS
sleep 0.5
echo ""
echo -e $YELLOW"[SFAGEAS]:Fixing broken packages..."$ENDCOLOR
sudo apt-get check ; sudo apt-get -f install
sleep 0.5
echo -e $YELLOW"[SFAGEAS]:Cleaning trash archives..."$ENDCOLOR
sleep 0.5
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
sleep 0.5
rm -rf /root/.local/share/Trash/*/** &> /dev/null
sleep 0.5
sudo aptitude clean
sleep 0.5
sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get purge && sudo apt-get clean
sleep 0.5
echo ""
echo ""
echo -e $YELLOW"[SFAGEAS]:Cleaning leftover configs..."$ENDCOLOR 
sudo aptitude purge $OLDCONF
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge
sleep 0.5
echo ""
echo ""
echo -e $YELLOW"[SFAGEAS]:Cleaning apt cache again..."$ENDCOLOR
sudo aptitude clean
sleep 0.5
echo ""
echo ""
echo -e $YELLOW"[SFAGEAS]:Removing old config files again..."$ENDCOLOR
sudo aptitude purge $OLDCONF
sleep 0.5
apt-get autoremove
sleep 0.5
apt-get clean
sleep 0.5
echo -e $YELLOW"[SFAGEAS]:Emptying  trashes..."$ENDCOLOR

echo ""
echo ""
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null
echo ""
echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#                                             #"$ENDCOLOR
echo -e $RED"#               <<SFAGEAS>>                   #"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo "Have A Solid Day"
echo ""
echo “Created by H3x”
exit


fi
fi
 

done
sleep 3
exit
  
