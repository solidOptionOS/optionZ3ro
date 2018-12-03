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
echo -e $BLUE"Creating backup directory.."$ENDCOLOR;
mkdir ~/backup && cd ~/backup
echo ""
sleep .5
pwd
sleep .5
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
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
echo ""
echo -e $BLUE"Installing prerequisites.."$ENDCOLOR;
sleep 1
sudo apt-get install libpcap-dev aircrack-ng sqlite3 libsqlite3-dev libssl-dev -y
echo ""
echo -e $BLUE"Installing pixiewps.."$ENDCOLOR;
cd ~/backup/pixiewps/src/
make && sudo make install
echo ""
echo -e $BLUE"Installing reaver-wps-fork-t6x.."$ENDCOLOR;
cd ~/backup/reaver-wps-fork-t6x/src/
./configure
make && sudo make install
echo ""
echo -e $BLUE"Adding modified wifite and wifite-ng to /usr/bin.."$ENDCOLOR;
sudo cp ~/backup/wifite/wifite.py /usr/bin/wifite
sudo chmod +x /usr/bin/wifite
sudo cp ~/backup/wifite-mod-pixiewps/wifite-ng /usr/bin/wifite-ng
sudo chmod +x /usr/bin/wifite-ng
echo ""
echo -e $BLUE"Adding wordlists.."$ENDCOLOR;
cd /usr/share/
sudo git clone https://github.com/fuzzdb-project/fuzzdb.git
echo ""
echo -e $BLUE"Backing up wifite-ng.."$ENDCOLOR;
echo ""
sudo cp /usr/bin/wifite-ng /usr/bin/wifite-ng.bak
echo -e $GREEN"Done. Wifite-ng backed up to /usr/bin/wifite-ng.bak"$ENDCOLOR;
echo ""
sleep 1
echo -e $BLUE"Patching wifite-ng.."$ENDCOLOR;
echo ""
sudo cp ~/optionZ3ro/scripts/assets/wifite-ng-patch /usr/bin/wifite-ng
sudo chmod 755 /usr/bin/wifite-ng
sleep 1
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#      Operation Complete.       #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
echo ""
exit
