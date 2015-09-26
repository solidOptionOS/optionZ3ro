#!/bin/bash
## For use with PCE-AC68 Asus Card
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
echo -e $YELLOW"Blacklisting b43 and ssb"$ENDCOLOR;
echo "blacklist ssb" >> /etc/modprobe.d/blacklist.conf && echo "blacklist bcma" >> /etc/modprobe.d/blacklist.conf && echo "blacklist b43" >> /etc/modprobe.d/blacklist.conf && echo "blacklist brcmsmac" >> /etc/modprobe.d/blacklist.conf
echo -e $BLUE"Blacklisted: 43 and ssb. "$ENDCOLOR;
echo ""
echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $RED"#              task complete!!                #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $GREEN"Have A Solid Day"$ENDCOLOR
echo ""
