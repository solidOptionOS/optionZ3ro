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
echo -e $YELLOW"Add-Apt-Repository"$ENDCOLOR;
echo ""
echo -e $BLUE"Installing necessary prequisites.."$ENDCOLOR;
sleep 1
apt-get install python-software-properties
echo ""
echo -e $BLUE"Installing and updating apt-file"$ENDCOLOR;
sleep 1
apt-get install apt-file
apt-file update
sleep 1
echo ""
echo -e $BLUE"Using apt-file search to find add-apt-repository"$ENDCOLOR;
sleep 1
apt-file search add-apt-repository
echo ""
echo -e $BLUE"Modifying add-apt-repository with ~/optionZ3ro/scripts/assets/add-apt-repository in /usr/sbin.."$ENDCOLOR;
sleep 1
<<<<<<< HEAD
cp /root/optionZ3ro/scripts/assets/add-apt-repository /usr/sbin/add-apt-repository
echo ""
echo -e $BLUE"Changing permissions and ownership.."$ENDCOLOR;
=======
cp /root/optionZ3ro/scripts/add-apt-repository /usr/sbin/add-apt-repository
sleep 0.5 
echo "Changing permissions and ownership.. "
>>>>>>> de2b3b7e8fda46e7ac56291183dc7b8e1959ed65
sleep 1
chmod o+x /usr/sbin/add-apt-repository
chown root:root /usr/sbin/add-apt-repository
echo ""
echo -e $GREEN"Add-Apt-Repository Added Successfully."$ENDCOLOR;
echo ""
echo -e $BLUE"Would you like to install custom themes and icons? "$ENDCOLOR;
read CUSTOMTHEMES

if [[ $CUSTOMTHEMES = 'y' | $CUSTOMTHEMES = 'Y' ]] ; then

/usr/sbin/add-apt-repository ppa:noobslab/themes
/usr/sbin/add-apt-repository ppa:alecive/antigone

else
sleep 1
echo -e $BLUE"Okay.  Maybe some other time. Goodbye."$ENDCOLOR;

fi
echo ""
echo -e $BLUE"#################################"$ENDCOLOR;
echo -e $YELLOW"#     Operation Complete.       #"$ENDCOLOR;
echo -e $BLUE"#################################"$ENDCOLOR;
echo ""
