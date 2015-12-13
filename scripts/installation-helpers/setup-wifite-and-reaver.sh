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
echo -e $YELLOW"Patching Wifite with Reaver and Pixiewps"$ENDCOLOR;
sleep 1
echo ""
cd ~/
echo -e $BLUE"Creating backup directory.."$ENDCOLOR;
cd ~/
mkdir backup
cd backup
echo ""
echo -e $BLUE"Cloning wifite repository"$ENDCOLOR;
git clone https://github.com/derv82/wifite.git
echo ""
echo -e $BLUE"Cloning wifite-mod-pixiewps repository"$ENDCOLOR;
git clone https://github.com/aanarchyy/wifite-mod-pixiewps.git
echo ""
echo -e $BLUE"Cloning reaver-wps-fork-t6x repository"$ENDCOLOR;
git clone https://github.com/t6x/reaver-wps-fork-t6x.git
echo ""
echo -e $BLUE"Cloning pixiewps repository"$ENDCOLOR;
git clone https://github.com/wiire/pixiewps.git
echo ""
sleep 1
echo -e $BLUE"Updating and upgrading before installation.."$ENDCOLOR;
sleep 1
apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
echo ""
echo -e $BLUE"Installing prerequisites.."$ENDCOLOR;
sleep 1
sudo apt-get install libpcap-dev aircrack-ng sqlite3 libsqlite3-dev libssl-dev -y
echo ""
echo -e $BLUE"Installing pixiewps.."$ENDCOLOR;
cd pixiewps/src/
make && make install
echo ""
echo -e $BLUE"Installing reaver-wps-fork-t6x.."$ENDCOLOR;
cd /root/backup/reaver-wps-fork-t6x/src/
./configure
make && make install
echo ""
echo -e $BLUE"Adding modified wifite and wifite-ng to /usr/bin.."$ENDCOLOR;
cp /root/backup/wifite/wifite.py /usr/bin/wifite
chmod +x /usr/bin/wifite
cp /root/backup/wifite-mod-pixiewps/wifite-ng /usr/bin/wifite-ng
chmod +x /usr/bin/wifite-ng
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#      Operation Complete.       #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
echo ""
exit
