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
echo -e $YELLOW"Let's setup your github config"$ENDCOLOR
sleep 1
echo -e $YELLOW"Enter your github username: "$ENDCOLOR
read githubusername
sleep 1
echo -e $BLUE"Registering global user.name.."$ENDCOLOR
sleep 0.5
git config --global user.name "$githubusername"
sleep 1
echo -e $YELLOW"Enter your github email address: "$ENDCOLOR
read githubemailaddress
sleep 1
echo -e $BLUE"Registering global email.address.."$ENDCOLOR
sleep 0.5
git config --global user.email $githubemailaddress
sleep 1
echo -e $BLUE"Which push.default config would you like to use? ['simple' or 'matching' ]"$ENDCOLOR
read defaultpush
sleep 0.5
echo -e $YELLOW"Registering push.default $defaultpush."$ENDCOLOR
sleep 0.5
git config --global push.default $defaultpush
sleep 1
echo -e $YELLOW"Checking for SSH keys"$ENDCOLOR
ls -al /root/.ssh
## Lists the files in your .ssh directory, if they exist
sleep 1
echo -e $BLUE"Now we will generate a public/private rsa key pair"$ENDCOLOR
sleep 0.5
ssh-keygen -t rsa -b 4096 -C $githubusername@github.com
## Creates a new ssh key, using the email as a label
sleep 1 
echo -e $BLUE"Starting ssh-agent"$ENDCOLOR
eval "$(ssh-agent -s)"
sleep 1
echo -e $BLUE"Adding new SSH key to the ssh-agent"$ENDCOLOR
sleep 1
ssh-add -l
sleep 1
echo -e $YELLOW"Copying id_rsa.pub key to clipboard. "$ENDCOLOR
sleep 0.5
cat ~/.ssh/id_rsa.pub | xclip -i
sleep 1 
echo -e $YELLOW"Now, copy your id_rsa.pub key to Github -> Profile -> Settings -> SSH Keys "$ENDCOLOR
sleep 5
echo -e $YELLOW"When you have completed this step, enter 'y': "$ENDCOLOR
read readytogo

if [[ $readytogo = y || $readytogo = Y ]] ; then

echo -e $BLUE"Okay, let's test the connection. "$ENDCOLOR
sleep 2
ssh -vT $githubusername@github.com
sleep 1
echo -e $BLUE"If you have authenticated, then you have successfully set up your SSH Key!"$ENDCOLOR
sleep 0.5
echo -e $YELLOW"Did you successfully authenticate? [y/n]"$ENDCOLOR
read successyes
if [[ $successyes = y || $successyes = Y ]] ; then
echo -e $YELLOW"SUCCESS! You are now setup and ready to start using git!"$ENDCOLOR
exit
else
echo -e $BLUE"That's ok.  Let's try a different method. Login to Github and create a personal access token via -> Profile -> Settings -> Personal Access tokens"$ENDCOLOR
sleep 1
echo -e $YELLOW"Enter the token here: "$ENDCOLOR
read privategithubtoken
echo -e $BLUE"Ok, got it. Let's import that token."$ENDCOLOR
sleep 1
curl -u $githubusername:$privategithubtoken https://api.github.com/user
sleep 1
echo -e $YELLOW"SUCCESS! You are now setup and ready to start using git!"$ENDCOLOR
else
exit
fi
fi
