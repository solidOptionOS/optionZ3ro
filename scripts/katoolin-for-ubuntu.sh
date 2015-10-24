#!/bin/bash
clear

## Colors
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
echo -e $BLUE"#                                  ||"$ENDCOLOR;
echo -e $BLUE"#                                  ||_________________________/'|"$ENDCOLOR;
echo -e $BLUE"#                                 _| O======/                   |"$ENDCOLOR;
echo -e $BLUE"# +-+-+-+-+-+-+-+ +-+ +-+ +-+    |_|              ============  |"$ENDCOLOR;
echo -e $BLUE"# |f|u|c|k| |e|m| |.| |.| |.|     |  __   ______________________|"$ENDCOLOR;
echo -e $BLUE"# +-+-+-+-+-+-+-+ +-+-+-+-+-+     |_/  )  (     |___||     O-   /"$ENDCOLOR;
echo -e $BLUE"# |T|A|K|E| |I|T| |A|L|L|!|            (  )    /  / |_________/"$ENDCOLOR;
echo -e $BLUE"# +-+-+-+-+ +-+-+ +-+-+-+-+            (  )   /  /    | ) |   |"$ENDCOLOR;
echo -e $BLUE"#                                     (__)  /  /     \___|__("$ENDCOLOR;
echo -e $BLUE"#                                          /  / Katoolin:)   \ "$ENDCOLOR;
echo -e $BLUE"#                                         /  / Kali-Tools )   \ "$ENDCOLOR;
echo -e $BLUE"#                                        /  / for Ubuntu,  )___\ "$ENDCOLOR;
echo -e $BLUE"#                                       /  / Mint, and Debian"$ENDCOLOR;
echo -e $BLUE"#                                      /__/"$ENDCOLOR;
echo -e $BLUE"#                                "$ENDCOLOR;
echo ""
echo -e $YELLOW"Install Kali-Tools with Katoolin."$ENDCOLOR
sleep 1
echo ""
cd ~/ 
echo -e $BLUE"Cloning katoolin repository .. "$ENDCOLOR;
sleep 0.5
git clone https://github.com/LionSec/katoolin.git  && sudo cp katoolin/katoolin.py /usr/bin/katoolin
echo ""
sleep 0.5
echo -e $YELLOW"Setting Katoolin as executable. Installing in /usr/bin.."$ENDCOLOR;
sudo chmod +x  /usr/bin/katoolin
echo ""
echo -e $GREEN"Katoolin Installed Successfully!"$ENDCOLOR;
sleep 1
echo ""
echo -e $YELLOW"Run Katoolin Now? "$ENDCOLOR;
read RUNKATOOLIN
if [[ $RUNKATOOLIN = 'y' || $RUNKATOOLIN = 'Y' ]] ; then

katoolin

echo ""
echo -e $BLUE"###############################################"$ENDCOLOR;
echo -e $YELLOW"# Thank you for Pledging your Soul to Katoolu #"$ENDCOLOR;
echo -e $BLUE"###############################################"$ENDCOLOR;
echo ""
exit
else
echo ""
echo -e $BLUE"###############################################"$ENDCOLOR;
echo -e $YELLOW"# Run Katoolin with 'katoolin'  Have a solid Day #"$ENDCOLOR;
echo -e $BLUE"###############################################"$ENDCOLOR;
echo ""
exit
fi
