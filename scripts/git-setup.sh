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

echo -e $BLUE"#################################################################"$ENDCOLOR; 
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;
echo "su"
echo -e $YELLOW"Checking for SSH keys"$ENDCOLOR
ls -al /root/.ssh
## Lists the files in your .ssh directory, if they exist
sleep 1
echo -e $BLUE"Generating public/private rsa key pair."$ENDCOLOR
echo ""
echo -e $YELLOW"Enter username associated with rsa key pair: "$ENDCOLOR
read githubusername
ssh-keygen -t rsa -b 4096 -C $githubusername@github.com
## Creates a new ssh key, using the email as a label
sleep 1 
echo -e $BLUE"Starting ssh-agent in the background."$ENDCOLOR
eval "$(ssh-agent -s)"
sleep 1
echo -e $BLUE"Adding new SSH key to the ssh-agent"$ENDCOLOR
sleep 1
ssh-add -l
sleep 2
echo -e $YELLOW"Copying id_rsa.pub key to clipboard. "$ENDCOLOR

sleep 1
cat /root/.ssh/id_rsa.pub | xclip -i
sleep 1 
#echo -e $BLUE"Jumping to ~/.ssh/"$ENDCOLOR
#cd ~/.ssh/ && ls -al
#sleep 1 

echo -e $YELLOW"Register SSH key to git account."$ENDCOLOR
echo ""
echo -e $YELLOW"Copy your rsa pub key to the clipboard and add it to Github -> Profile -> Setings "$ENDCOLOR
sleep 5
echo -e $YELLOW"Ready? "$ENDCOLOR
read readytogo

if [[ $readytogo = y || $readytogo = Y ]] ; then

echo -e $BLUE"Okay, let's test the connection. "$ENDCOLOR
echo "ssh -vT $githubusername@github.com"
sleep 1
else
echo -e $BLUE"Please enter 'y' or 'Y' when ready."$ENDCOLOR 
exit
fi
echo -e $BLUE"If you have authenticated, then you have successfully set up your SSH Key!"$ENDCOLOR

