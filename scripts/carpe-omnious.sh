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
echo -e $BLUE"#           ^                 _____               __            #"$ENDCOLOR;
echo -e $BLUE"#          | |               / ___/__ ________  _/_/            #"$ENDCOLOR;
echo -e $BLUE"#        @#####@            / /__/ _  / __/ _ \/ -_)            #"$ENDCOLOR;
echo -e $BLUE"#      (###   ###)-.        \___/\_,_/_/ / .__/\__/             #"$ENDCOLOR;
echo -e $BLUE"#    .(###     ###) \      ____         /_/ _                   #"$ENDCOLOR;
echo -e $BLUE"#   /  (###   ###)   )    / __ \__ _  ___  (_)__  __ _____      #"$ENDCOLOR;
echo -e $BLUE"#  (=-  .@#####@|_--     / /_/ /    \/ _ \/ / _ \/ // (_-<      #"$ENDCOLOR;
echo -e $BLUE"#  /\    \_|l|_/ (\      \____/_/_/_/_//_/_/\___/\_,_/___/      #"$ENDCOLOR;
echo -e $BLUE"# (=-\     |l|    /                                             #"$ENDCOLOR;
echo -e $BLUE"#  \  \.___|l|___/      +-+-+-+-+-+-+-+ +-+ +-+ +-+             #"$ENDCOLOR;
echo -e $BLUE"#  /\      |_|   /      |f|u|c|k| |e|m| |.| |.| |.|             #"$ENDCOLOR;
echo -e $BLUE"# (=-\._________/\      +-+-+-+-+-+-+-+ +-+-+-+-+-+             #"$ENDCOLOR;
echo -e $BLUE"#  \             /      |T|A|K|E| |I|T| |A|L|L|!|               #"$ENDCOLOR;
echo -e $BLUE"#    \._________/       +-+-+-+-+ +-+-+ +-+-+-+-+               #"$ENDCOLOR;
echo -e $BLUE"#      #  ----  #                                               #"$ENDCOLOR;
echo -e $BLUE"#      #   __   #      .__    ________                          #"$ENDCOLOR;
echo -e $BLUE"#      \########/      |  |__ \_____  \___  ___                 #"$ENDCOLOR;
echo -e $BLUE"#                      |  |  \  _(__  <\  \/  /                 #"$ENDCOLOR;
echo -e $BLUE"#                      |   Y  \/       \>    <                  #"$ENDCOLOR;
echo -e $BLUE"#                      |___|  /______  /__/\_ \                 #"$ENDCOLOR;
echo -e $BLUE"#                           \/       \/      \/                 #"$ENDCOLOR;
echo -e $RED"#################################################################"$ENDCOLOR;
echo ""
echo -e $YELLOW"Carpe Diem?  ..Nope, not today. CARPE OMNIOUS, BITCH! Take it all. "$ENDCOLOR
echo -e $BLUE"FUCK'EM.  LET'S GO TO WAR!"$ENDCOLOR;
echo ""
echo -e $YELLOW"Disclaimer: SolidOptionOS is not responsible for unethical hacking of any kind."$ENDCOLOR;
echo -e $YELLOW"Furthermore, despite our playful, ADULT fucking humor, we create these tools and these scripts"$ENDCOLOR;
echo -e $YELLOW"to aide in the security of the cyber community.  Don't be stupid.  Don't blame us. We are the good guys."$ENDCOLOR;
echo ""
sleep 1
echo -e $BLUE"Nuff said!  Let's fuck some shit up!"$ENDCOLOR;
sleep 0.5
echo -e $YELLOW"And you better be root...! [Checking] "$ENDCOLOR;
sleep 0.5

if [ $USER != root ]; then
echo -e $RED"[h3x]:Fuck me...FOR SHAME! How you gonna hack a target when you can't even root your own box??"$ENDCOLOR;
echo -e $RED"[h3x]:You 'best escalate yourself before running this again!.."$ENDCOLOR;
echo -e $BLUE"[h3x]...Wasting my mutha fuckin time...[Exiting]"$ENDCOLOR;
exit 0
fi
echo -e $BLUE"Two things: a path to send the data, and an interface already authenticated on the target network."$ENDCOLOR;
sleep 1
echo -e $YELLOW"Path to send the data to: "$ENDCOLOR;
read TARGET
sleep 1
echo -e $YELLOW"Authenticated Interface: "$ENDCOLOR;
read INTERFACE
echo -e $BLUE"Thank you."$ENDCOLOR;
echo ""
echo -e $GREEN"Compiling Payload ... "$ENDCOLOR;
sleep 0.5
echo -e $GREEN"Complete. "$ENDCOLOR;
echo ""
sleep 1
echo -e $GREEN"Assessing vulvnerabilities.."$ENDCOLOR;
echo -e $GREEN"Initiating MASQUERADE sequence.."$ENDCOLOR;
echo ""
echo -e $BLUE"[h3x]:If you haven't already, I would advise, for the sake of this test, that you make use of the macchanger tool within the distro."$ENDCOLOR;
sleep 1
echo ""
echo -e $GREEN"VPN Service Started."$ENDCOLOR;
sleep 0.8
echo -e $GREEN"Initiating HOP sequence."$ENDCOLOR;
sleep 0.7
echo -e $GREEN"Anonymity Check."$ENDCOLOR;
sleep 0.6
echo -e $GREEN"DNSMASQ Service Started. "$ENDCOLOR;
sleep 0.6
echo -e $GREEN"HOSTAP Service Started. "$ENDCOLOR;
sleep 0.5
echo -e $GREEN"Metasploit-Framework Meterpreter Payload Online."$ENDCOLOR;
sleep 0.4
echo -e $GREEN"MANA AP Active."$ENDCOLOR;
sleep 0.3
echo -e $GREEN"Deauthorizing Target Network Stations."$ENDCOLOR;
sleep 0.2
echo -e $GREEN"Target Clients Aquired. "$ENDCOLOR;
sleep 1
echo -e $GREEN"IPTABLES: Rerouting clients to S.E.T. MITM Server."$ENDCOLOR;
sleep 0.4
echo ""
echo -e $YELLOW"All systems and services nominal. Executing attack sequence in -t 5s"$ENDCOLOR
sleep 1
echo ""
echo -e $YELLOW"[h3x]:Well, without furthur ado... "$ENDCOLOR;
sleep 1
echo -e $GREEN"Deploying payload. "$ENDCOLOR;
echo ""
echo -e $YELLOW"[h3x]: RAAAAMPAGE!!!!!!!"$ENDCOLOR;
echo ""
sleep 0.1 
echo -e $RED"Target Intrusion Detection System Compromised."$ENDCOLOR;
sleep 0.4
echo -e $RED"Capture Sequence. 140 Mb/s."$ENDCOLOR;
sleep 0.2
echo -e $RED"Initiating capture:  Authentication."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  SMB."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Browser."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  User."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Password."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Network."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  NTAuthority."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Certificate Authorization."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Certificate."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Certificate Authority."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Server Versions."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Private Keys"$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo -e $RED"Initiating capture:  Public Keys."$ENDCOLOR;
sleep 0.1 
echo -e $GREEN"SUCCESS!"$ENDCOLOR;
echo ""
echo -e $YELLOW"[h3x] HAHA! TAKE IT ALL!!"$ENDCOLOR;
echo ""
echo -e $BLUE"Decrypting..."$ENDCOLOR;
sleep 1
echo -e $YELLOW"System PWN in progress... please wait..."$ENDCOLOR;
echo tcpdump -nnvvvtttttXSs 65535 -i $INTERFACE -w $TARGET | grep Auth,SMB,BROWSER,$USER:$PASSWORD|$NETWORK:$NTAUTHORITY|$CERTAUTH:$CERT|$CA:$SERVERVERSION|$PRIVAKEY:$PUBKEY;

echo ""
echo -e $RED"###############################################"$ENDCOLOR
echo -e $YELLOW"#              Target System Owned            #"$ENDCOLOR
echo -e $RED"###############################################"$ENDCOLOR
echo ""
echo -e $YELLOW"Hey, Fuck it. Everyone needs to learn security someday.. at least you didn t charge them.  heh heh. "$ENDCOLOR
exit
