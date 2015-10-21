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

## Date
### mm/dd/yyyy ####
now="$(date +'%d.%m.%Y')"

echo -e $RED"#################################################################"$ENDCOLOR;
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $RED"#################################################################"$ENDCOLOR;
echo -e $BLUE"#           ^                _____               __"$ENDCOLOR;
echo -e $BLUE"#          | |              / ___/__ ________  _/_/ "$ENDCOLOR;
echo -e $BLUE"#        @#####@           / /__/ _  / __/ _ \/ -_)"$ENDCOLOR;
echo -e $BLUE"#      (###   ###)-.       \___/\_,_/_/ / .__/\__/ "$ENDCOLOR;
echo -e $BLUE"#    .(###     ###) \    ____          /_/"$ENDCOLOR;
echo -e $BLUE"#   /  (###   ###)   )  / __ \__ _  ___  (_)__  __ _____"$ENDCOLOR;
echo -e $BLUE"#  (=-  .@#####@|_--   / /_/ /    \/ _ \/ / _ \/ // (_-<"$ENDCOLOR;
echo -e $BLUE"#  /\    \_|l|_/ (\    \____/_/_/_/_//_/_/\___/\_,_/___/"$ENDCOLOR;
echo -e $BLUE"# (=-\     |l|    /"$ENDCOLOR;
echo -e $BLUE"#  \  \.___|l|___/      +-+-+-+-+-+-+-+ +-+ +-+ +-+"$ENDCOLOR;
echo -e $BLUE"#  /\      |_|   /      |f|u|c|k| |e|m| |.| |.| |.|"$ENDCOLOR;
echo -e $BLUE"# (=-\._________/\      +-+-+-+-+-+-+-+ +-+-+-+-+-+"$ENDCOLOR;
echo -e $BLUE"#  \             /      |T|A|K|E| |I|T| |A|L|L|!|  "$ENDCOLOR;
echo -e $BLUE"#    \._________/       +-+-+-+-+ +-+-+ +-+-+-+-+"$ENDCOLOR;
echo -e $BLUE"#      #  ----  #"$ENDCOLOR;
echo -e $BLUE"#      #   __   #      .__    ________"$ENDCOLOR;
echo -e $BLUE"#      \########/      |  |__ \_____  \___  ___"$ENDCOLOR;
echo -e $BLUE"#                      |  |  \  _|__  <\  \/  /"$ENDCOLOR;
echo -e $BLUE"#                      |   |  \/       \>    <"$ENDCOLOR;
echo -e $BLUE"#                      |___|  /______  /__/\_ \"$ENDCOLOR;
echo -e $RED"###############################################################"$ENDCOLOR;
echo -e $BLUE"FUCK'EM.  LET'S GO TO WAR!"$ENDCOLOR;
echo -e $YELLOW"Just give me an path and an interface."$ENDCOLOR;
sleep 0.5
#echo -e $YELLOW"And you better be root! Checking ... "$ENDCOLOR
#sleep 0.5
#
#if [ $USER != root ]; then
#echo -e $RED"[h3x]:Fuck off! you best escalate yourself.."$ENDCOLOR
#echo -e $BLUE"[h3x]Wasting my mutha fuckin time...Exiting."$ENDCOLOR
#exit 0
#fi
#
#sleep 1
#echo -e $YELLOW"Ok. Path please, sir?: "$ENDCOLOR
#read TARGET
#$TARGET='/root/captures/p3t3'
#echo -e $BLUE"Thank you."$ENDCOLOR
#sleep 1
#echo -e $YELLOW"Authenticated Interface please: "$ENDCOLOR
#read INTERFACE
#$INTERFACE='wlan3'
#echo -e $BLUE"Thank you."$ENDCOLOR
#sleep 1
echo -e $YELLOW"Carpe Diem?  ..Nope, not today. CARPE OMNIOUS, BITCH! Take it all. "$ENDCOLOR
echo -e $BLUE"...I hope you remembered to macchanger -br <interface>"$ENDCOLOR
sleep 4
echo -e $YELLOW"Alrighty then... RAAAAMPAGE!!!!!!!"$ENDCOLOR
echo -e $BLUE"Initiating capture:  Authentication."$ENDCOLOR
echo -e $BLUE"Initiating capture:  SMB."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Browser."$ENDCOLOR
echo -e $BLUE"Initiating capture:  User."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Password."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Network."$ENDCOLOR
echo -e $BLUE"Initiating capture:  NTAuthority."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Certificate Authorization."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Certificate."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Certificate Authority."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Server Versions."$ENDCOLOR
echo -e $BLUE"Initiating capture:  Private Keys"$ENDCOLOR
echo -e $BLUE"Initiating capture:  Public Keys."$ENDCOLOR
sleep 1
echo -e $YELLOW"System pwn in progress... please wait..."$ENDCOLOR
echo tcpdump -nnvvvtttttXSs 65535 -i wlan3 -w /root/catures/p3t3 | grep Auth,SMB,BROWSER,$USER:$PASSWORD|$NETWORK:$NTAUTHORITY|$CERTAUTH:$CERT|$CA:$SERVERVERSION|$PRIVAKEY:$PUBKEY;


echo -e $RED"###############################################"$ENDCOLOR
echo -e $YELLOW"#              Target System Owned            #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $YELLOW"Hey, Fuck it. Everyone needs to learn security someday.. at least you didn t charge them.  heh heh. "$ENDCOLOR
exit
