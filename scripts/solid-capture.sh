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

## Paths
PERSISTENCEPATH="/root"
SCRIPTSPATH="/root/scripts"
CAPTUREPATH="/root/captures"

## Preferred Options
SETOPTIONS=" --showack --band abg --wps -aMU --cswitch 1"

## Date
### mm/dd/yyyy ####
now="$(date +'%d.%m.%Y')"

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
echo -e $RED"[h3x]:Error: must be root"$ENDCOLOR
echo -e $BLUE"[h3x]:Exiting..."$ENDCOLOR
exit 0
fi
sleep 1

echo -e $BLUE"Let's get started. "$ENDCOLOR;
sleep 1

echo -e $BLUE"First, Let's create a captures folder in /root "$ENDCOLOR;
mkdir /root/captures
sleep 0.5

echo -e $BLUE"Next, let's prepare our interface. "$ENDCOLOR;
sleep 0.5
iwconfig
sleep 0.5
echo ""
echo -e $YELLOW"Select the interface you wish to use: [ex. wlan0] "$ENDCOLOR;
read INTERFACE
sleep 1

echo -e $BLUE"Checking to see if Airmon-ng is good to go "$ENDCOLOR;
sleep 0.5

airmon-ng
sleep 1

airmon-ng check kill
sleep 1

## Uncomment to enable.
# echo -e $BLUE"Updating Airodump-ng IEEE Data "$ENDCOLOR;
# airodump-ng-oui-update
# sleep 0.5

echo -e $BLUE"Complete.  Good to go. "$ENDCOLOR;
sleep 1

echo -e $BLUE"Starting Airmon-ng for $INTERFACE "$ENDCOLOR;
sleep 0.5

airmon-ng start $INTERFACE
sleep 2

echo -e $YELLOW"Enter the name of the interface created: [ex. mon0] "$ENDCOLOR;
read MON0
sleep 0.5

echo -e $BLUE"Let's stay anonymous.  Configuring $MON0 "$ENDCOLOR;
sudo ifconfig $MON0 down
sleep 1

echo -e $BLUE"Setting new MAC Address "$ENDCOLOR;
sudo macchanger $MON0 -bra
sleep 1

echo -e $BLUE"Configuring $MON0 for iw compatibility "$ENDCOLOR;
sudo iw dev $MON0 set type monitor
sleep 1

echo -e $BLUE"Setting $MON0 to promisc mode "$ENDCOLOR;
sudo ifconfig $MON0 promisc
sleep 1

echo -e $BLUE"Okay.  We are ready to bring $MON0 back up "$ENDCOLOR;
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

echo -e $YELLOW"Use Preferred Channel(s): y/n [channels 1,6,11] "$ENDCOLOR;
read prefchan

if [[ $prefchan = y || $prefchan = Y ]] ; then

echo -e $BLUE"Selecting Preferred Channels: 1,6,9,11 "$ENCOLOR;
attachan="1,6,11"

else
echo -e $YELLOW"Specify Channel(s): "$ENDCOLOR;
read specchan
CHANOPT="-c $specchan"
sleep 1
fi

else
echo -e $BLUE"Selecting all channels "$ENDCOLOR;
CHANOPTS=" "
sleep 0.5
fi

echo -e $YELLOW"Specify Options: [enter '-p' for preferred or '--help'] "$ENDCOLOR;
read OPTIONS
while [ -n "$OPTIONS" ] ; do
        case "$OPTIONS" in
                --help)
                        echo -e "
  Options:
      --ivs                 : Save only captured IVs
      --gpsd                : Use GPSd
      --write      <prefix> : Dump file prefix
      -w                    : same as --write
      --beacons             : Record all beacons in dump file
      --update       <secs> : Display update delay in seconds
      --showack             : Prints ack/cts/rts statistics
      -h                    : Hides known stations for --showack
      -f            <msecs> : Time in ms between hopping channels
      --berlin       <secs> : Time before removing the AP/client
                              from the screen when no more packets
                              are received (Default: 120 seconds)
      -r             <file> : Read packets from that file
      -x            <msecs> : Active Scanning Simulation
      --manufacturer        : Display manufacturer from IEEE OUI list
      --uptime              : Display AP Uptime from Beacon Timestamp
      --wps                 : Display WPS information (if any)
      --output-format
                  <formats> : Output format. Possible values:
                              pcap, ivs, csv, gps, kismet, netxml
      --ignore-negative-one : Removes the message that says
                              fixed channel <interface>: -1
      --write-interval
                  <seconds> : Output file(s) write interval in seconds

  Filter options:
      --encrypt   <suite>   : Filter APs by cipher suite
      --netmask <netmask>   : Filter APs by mask
      --bssid     <bssid>   : Filter APs by BSSID
      --essid     <essid>   : Filter APs by ESSID
      --essid-regex <regex> : Filter APs by ESSID using a regular
                              expression
      -a                    : Filter unassociated clients

  By default, airodump-ng hop on 2.4GHz channels.
  You can make it capture on other/specific channel(s) by using:
      --channel <channels>  : Capture on specific channels
      --band <abg>          : Band on which airodump-ng should hop
      -C    <frequencies>   : Uses these frequencies in MHz to hop
      --cswitch  <method>   : Set channel switching method
                    0       : FIFO (default)
                    1       : Round Robin
                    2       : Hop on last
      -s                    : same as --cswitch

      --help                : Displays this usage screen

  Preferred options, these are just my personal options...
    -p : includes options '--showack --band abg --wps -aMU --cswitch 1 --berlin 180 --update 2'"

                        ;;
                -p)
                        echo -e $BLUE"Options received: $SETOPTIONS "$ENDCOLOR;
                        sleep 2

                        echo -e $BLUE"REC:LOG > Saving capture to $CAPTUREPAH/$now.dump "$ENDCOLOR;
                        sleep 2

                        echo -e $BLUE"Compiling sequence... "$ENDCOLOR;
                        sleep 0.5

                        echo -e $RED"Running sequence: airodump-ng $SETOPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump "$ENDCOLOR;
                        sleep 2

                        airodump-ng $SETOPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump
                        sleep 3

                        ## todo
                        ## echo -e $YELLOW"Would you like to decrypt the capture with Airdecap? "$ENDCOLOR;
                        ## todo

                        echo -e $BLUE"###############################################"$ENDCOLOR
                        echo -e $YELLOW"#              Operation complete.            #"$ENDCOLOR
                        echo -e $BLUE"###############################################"$ENDCOLOR
                        echo ""
                        echo -e $YELLOW"Have A Solid Day "$ENDCOLOR;
                        echo ""
                        exit 0
                        ;;

                *)      echo -e $BLUE"Options received: $OPTIONS "$ENDCOLOR;
                        sleep 2

                        echo -e $BLUE"REC:LOG > Saving capture to $CAPTUREPATH/$now.dump "$ENDCOLOR;
                        sleep 2

                        echo -e $BLUE"Compiling sequence... "$ENDCOLOR;
                        sleep 0.5

                        echo -e $RED"Running sequence: airodump-ng $OPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump "$ENDCOLOR;
                        sleep 2
                        
                        airodump-ng $OPTIONS $CHANOPT $MON0 -w $CAPTUREPATH/$now.dump
                        sleep 3

                        echo -e $BLUE"###############################################"$ENDCOLOR
                        echo -e $YELLOW"#              Operation complete.            #"$ENDCOLOR
                        echo -e $BLUE"###############################################"$ENDCOLOR
                        echo ""
                        echo -e $YELLOW"Have A Solid Day "$ENDCOLOR;
                        echo ""
                        exit 0
                        ;;
        esac

        shift # Get next argument
done
