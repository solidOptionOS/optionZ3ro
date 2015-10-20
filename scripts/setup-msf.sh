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

echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"   ____     ___    __  ____       __  _             ____  ____"$ENDCOLOR;
echo -e $YELLOW"  / __/__  / (_)__/ / / __ \___  / /_(_)__  ___    / __ \/ __/"$ENDCOLOR;
echo -e $YELLOW" _\ \/ _ \/ / / _  / / /_/ / _ \/ __/ / _ \/ _ \  / /_/ /\ \  "$ENDCOLOR;
echo -e $YELLOW"/___/\___/_/_/\_,_/  \____/ .__/\__/_/\___/_//_/  \____/___/  "$ENDCOLOR;
echo -e $YELLOW"                         /_/                                  "$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;
echo -e $YELLOW"# Created by kloption at SolidOptionOS. All rights reserved 2015 #"$ENDCOLOR;
echo -e $BLUE"#################################################################"$ENDCOLOR;

echo ""
sleep 0.5
echo -e $YELLOW"Checking for root access.. "$ENDCOLOR
sleep 0.5
if [ $USER != root ]; then
echo -e $RED"[RBENV]:Error: must be root"$ENDCOLOR
echo -e $BLUE"[RBENV]:Exiting..."$ENDCOLOR
exit 0
fi
sleep 1

echo -e $YELLOW"SHELL IS ONLY THE BEGINNING "$ENDCOLOR
sleep 1
echo -e $YELLOW"Installing necessary packages.." $ENDCOLOR

sudo apt-get install metasploit-framework build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev openjdk-7-jre git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev

echo -e $YELLOW"Installing Ruby"$ENDCOLOR
sleep 0.5
cd ~/
sleep 1
sudo mkdir .rbenv 
sleep 1
cd ~/.rbenv
echo -e $BLUE"Cloning .rbenv into ~/.rbenv"$ENDCOLOR
sleep 1
git clone git://github.com/sstephenson/rbenv.git
sleep 1
echo -e $YELLOW"Updating PATH"$ENDCOLOR
sleep 1
export PATH="$HOME/.rbenv/bin:$PATH" >> ~/.bashrc

eval "$(rbenv init -)" >> ~/.bashrc

#exec $SHELL
echo -e $BLUE"Cloning Ruby-Build into ~/.rbenv/plugins/ruby-build"$ENDCOLOR
sleep 0.5

cd ~/.rbenv/plugins/

git clone git://github.com/sstephenson/ruby-build.git
cd ~/.rbenv/plugins/ruby-build/

export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH" >> ~/.bashrc

# sudo plugin so we can run Metasploit as root with "" 
echo -e $BLUE"Cloning RBENV-SUDO into ~/.rbenv/plugins/rbenv-sudo"$ENDCOLOR
sleep 1
cd ~/.rbenv/plugins/

git clone git://github.com/dcarley/rbenv-sudo.git
sleep 1
cd rbenv-sudo

#exec $SHELL
echo -e $YELLOW"Creating Global Bundler Environment"$ENDCOLOR
sleep 0.5
rbenv install 2.1.7
rbenv global 2.1.7
ruby -v

echo -e $YELLOW"NMAP Installation and MSF Configuration"$ENDCOLOR
sleep 0.5

sudo mkdir ~/Development 
cd ~/Development

echo -e $BLUE"Updating Latest NMAP from svn.nmap.org/nmap"$ENDCOLOR
sleep 0.5
svn co https://svn.nmap.org/nmap

cd nmap

echo -e $YELLOW"Configuring NMAP"$ENDCOLOR
sleep 0.5
./configure
echo -e $YELLOW"Building NMAP"$ENDCOLOR
sleep 0.5
make
echo -e $YELLOW"Installing NMAP"$ENDCOLOR
sleep 0.5
sudo make install
make clean

echo -e $YELLOW"Configuring Postgre SQL Server"$ENDCOLOR
sleep 0.5
#sudo -s
echo -e $BLUE"Restarting postgresql"$ENDCOLOR
sleep 0.5
sudo /etc/init.d/postgresql restart
sleep 0.5
echo -e $YELLOW"Appending appropriate groups to $USER"$ENDCOLOR
sleep 0.5
usermod -aG sudo $USER
usermod -aG adm $USER
usermod -aG postgres $USER
echo -e $BLUE"Entering POSTGRES Environment"$ENDCOLOR
sleep 0.5
echo -e $YELLOW"Creating POSTGRES user 'msf'"$ENDCOLOR
echo "sudo -u postgres psql -c '\createuser msf -P -S -R -D' | $MSFPASSWORD "
echo "exit"
echo "sudo -u postgres psql -c '\createdb -O msf msf'"
echo "exit"


echo -e $YELLOW"Installation and Configuration METASPLOIT FRAMEWORK"$ENDCOLOR
sleep 1
cd /opt
sleep 0.5

echo -e $YELLOW"Cloning newest metasploit-framework into /optmetasploit-framework"$ENDCOLOR
sleep 0.5
sudo git clone https://github.com/rapid7/metasploit-framework.git

#echo -e $BLUE"CHMOD -R whoami"$ENDCOLOR
#sleep 0.5
#sudo chown -R `whoami` /opt/metasploit-framework
cd /opt/metasploit-framework

echo -e $YELLOW"Installing gem bundler for msf console.."$ENDCOLOR
sleep 0.5
gem install bundler
bundle install

sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'

echo -e $YELLOW"Installing Armitage"$ENDCOLOR
sleep 1
curl -# -o /tmp/armitage.tgz http://www.fastandeasyhacking.com/download/armitage-latest.tgz
sudo tar -xvzf /tmp/armitage.tgz -C /opt
sudo ln -s /opt/armitage/armitage /usr/local/bin/armitage
sudo ln -s /opt/armitage/teamserver /usr/local/bin/teamserver
sudo sh -c "echo java -jar /opt/armitage/armitage.jar \$\* > /opt/armitage/armitage"
sudo perl -pi -e 's/armitage.jar/\/opt\/armitage\/armitage.jar/g' /opt/armitage/teamserver
sleep 1
echo -e $YELLOW"Create YAML Configuration"$ENDCOLOR
sleep 1
MSFDATABASECONFIG="production:
 adapter: postgresql
 database: msf
 username: msf
 password: toor
 host: 127.0.0.1
 port: 5432
 pool: 75
 timeout: 5"
 
$MSFDATABASECONFIG >> sudo vi /opt/metasploit-framework/config/database.yml

echo -e $BLUE"Exporting MSF Database Config to $USER profile"$ENDCOLOR 
sleep 0.5
sudo sh -c "echo export MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml >> /etc/profile"
sleep 1
echo -e $BLUE"Sourcing profile and .bashrc"$ENDCOLOR
sleep 1
source /etc/profile
sleep 1
source ~/.bashrc
sleep 1
echo -e $YELLOW"Initializing MSF CONSOLE"$ENDCOLOR
sleep 1
msfconsole
