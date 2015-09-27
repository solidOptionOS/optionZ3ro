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

## Paths - UPDATE TO FIT YOUR SYSTEM
## Default for persistence usb mounted
PERSISTENCEPATH="/media/root/persistence"
SCRIPTSPATH="$PERSISTENCEPATH/scripts"
CAPTUREPATH="$PERSISTENCEPATH/captures"
## Location of original airmon-ng file (available on solidOptionOS/optionZ3ro github repo)
AIRMON="$SCRIPTSPATH/airmon-ng"

## Default for Installed System with folder scripts in home.
#PERSISTENCEPATH="~/"
#SCRIPTSPATH="$PERSISTENCEPATH/scripts"
#CAPTUREPATH="$PERSISTENCEPATH/captures"
## Location of original airmon-ng file (available on solidOptionOS/optionZ3ro github repo)
#AIRMON="$SCRIPTSPATH/airmon-ng"

echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"# Created by h3x at SolidOptionOS.  All rights reserved. 2015   #"$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;

echo ""
sleep 0.5
echo -e $BLUE"Checking for root access.. "$ENDCOLOR
sleep 0.5
if [ $USER != root ]; then
echo -e $RED"[OMNISCIENCE]:Error: must be root"$ENDCOLOR
echo -e $BLUE"[OMNISCIENCE]:Exiting..."$ENDCOLOR
exit 0
fi
sleep 1

echo -e $BLUE"Let's get started. "$ENDCOLOR;
sleep 1

echo -e $BLUE"First, let's get our interface prepped. "$ENDCOLOR;
sleep 0.5

echo -e $YELLOW"Interface>: "$ENDCOLOR;
read INTERFACE
sleep 1

echo -e $BLUE"Checking to see if Airmon-ng is good to go "$ENDCOLOR;
sleep 0.5

$AIRMON
sleep 1

$AIRMON check kill
sleep 1

## Uncomment to enable. Only if installed
#echo -e $BLUE"Updating Airodump-ng IEEE Data "$ENDCOLOR;
#airodump-ng-oui-update
#sleep 0.5

echo -e $GREEN"Complete.  Good to go. "$ENDCOLOR;
sleep 1

echo -e $BLUE"Starting Airmon-ng for $INTERFACE "$ENDCOLOR;
sleep 0.5

$AIRMON start $INTERFACE
sleep 2

echo -e $YELLOW"New monitor interface:> "$ENDCOLOR;
read MON0
sleep 0.5

echo -e $BLUE"Taking down $MON0 "$ENDCOLOR;
sudo ifconfig $MON0 down
sleep 1

echo -e $BLUE"Changing MAC Address "$ENDCOLOR;
sudo macchanger $MON0 -bra
sleep 1

echo -e $BLUE"Configuring $MON0 with iw "$ENDCOLOR;
sudo iw dev $MON0 set type monitor
sleep 1

echo -e $BLUE"Setting $MON0 to promisc mode "$ENDCOLOR;
sudo ifconfig $MON0 promisc
sleep 1

echo -e $BLUE"Bringing $MON0 back up "$ENDCOLOR;
sudo ifconfig $MON0 up
sleep 1

echo -e $BLUE"Configuration for $MON0 complete. "$ENDCOLOR;

sudo iw $MON0 info
sleep 3

echo -e $BLUE"Initializing $MON0 for capture "$ENDCOLOR;
sleep 2

echo -e $YELLOW"Specify channel(s)? [y | n] "$ENDCOLOR
read specchannel

if [[ $specchannel = Y || $specchannel = y ]] ; then

echo -e $YELLOW"Use Preferred Channel(s)>: [y | n] "$ENDCOLOR;
read prefchan

if [[ $prefchan = y || $prefchan = Y ]] ; then

echo -e $BLUE"Selecting Preferred Channels: 1,6,9,11 "$ENCOLOR;
attachan="1,6,9,11"
sleep 1

echo -e $YELLOW"Specify additional Channel(s)> "$ENDCOLOR;
read addchan
CHANOPT="-c $addchan,$attachan"
sleep 1

else
echo -e $YELLOW"Specify Channel(s)> "$ENDCOLOR;
read specchan
CHANOPT="-c $specchan"
sleep 1
fi

else
echo -e $BLUE"Selecting all channels "$ENDCOLOR;
CHANOPTS=" "
sleep 0.5
fi

echo -e $YELLOW"Specify Opts>: [enter 'p' for preferred] "$ENDCOLOR;
read OPTIONS
if [[ $OPTIONS = p || $OPTIONS = P ]] ; then
echo -e $BLUE"Preferred options selected> --showack --band abg --wps -aMU --cswitch 1 --berlin 180 --update 2 "$ENDCOLOR;
sleep 1

SETOPTIONS=" --showack --band abg --wps -aMU --cswitch 1 --berlin 180 --update 2"
sleep 1

echo -e $BLUE"Omniscience opt: received. "$ENDCOLOR;
sleep 3

### mm/dd/yyyy ####
now="$(date +'%d.%m.%Y')"

echo -e $BLUE"REC:LOG > Saving capture to $CAPTUREPAH/$now.dump "$ENDCOLOR;
sleep 3

echo -e $BLUE"Solid-Capture: Running... "$ENDCOLOR;
sleep 1

echo -e $RED"Trace: sudo airodump-ng $SETOPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump "$ENDCOLOR;
sleep 5

sudo airodump-ng $SETOPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump
sleep 3

## todo
## echo -e $YELLOW"Would you like to decrypt the capture with Airdecap? "$ENDCOLOR;
## todo

echo -e $BLUE"###############################################"$ENDCOLOR
echo -e $YELLOW"#              Operation complete.            #"$ENDCOLOR
echo -e $YELLOW"#                 Did you listen?             #"$ENDCOLOR
echo -e $BLUE"###############################################"$ENDCOLOR
echo ""
echo "Have A Solid Day"
echo ""
exit
fi

else
echo -e $YELLOW"Omniscience opt: received. "$ENDCOLOR;
sleep 3

### mm/dd/yyyy ####
now="$(date +'%d.%m.%Y')"

echo -e $BLUE"REC: Saving capture. $CAPTUREPATH/$now.dump "$ENDCOLOR;
sleep 3

echo -e $BLUE"Trace: Running. "$ENDCOLOR;
sleep 1

echo -e $RED"Trace: sudo airodump-ng $OPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump "$ENDCOLOR;
sleep 5

sudo airodump-ng $OPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump
sleep 3

echo -e $BLUE"###############################################"$ENDCOLOR
echo -e $YELLOW"#              Operation complete.            #"$ENDCOLOR
echo -e $YELLOW"#                 Did you listen?             #"$ENDCOLOR
echo -e $BLUE"###############################################"$ENDCOLOR
echo ""
echo "Have A Solid Day"
echo ""
exit
fi
