#!/bin/bash
echo "SHELL IS ONLY THE BEGINNING"

echo "sudo apt-get install metasploit-framework build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev openjdk-7-jre git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev" | $SHELL

echo "Ruby Installation using rbenv"

cd ~/
mkdir .rbenv

git clone git://github.com/sstephenson/rbenv.git .rbenv

cd .rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(rbenv init -)"' >> ~/.bashrc

exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

# sudo plugin so we can run Metasploit as root with "" 

git clone git://github.com/dcarley/rbenv-sudo.git ~/.rbenv/plugins/rbenv-sudo

exec $SHELL

rbenv install 2.1.7
rbenv global 2.1.7
ruby -v

echo "NMAP Installation and MSF Configuration"

mkdir ~/Development
cd ~/Development
svn co https://svn.nmap.org/nmap
cd nmap
./configure
make
sudo make install
make clean

echo "Configuring Postgre SQL Server"
sudo -s
su postgres
createuser msf -P -S -R -D | $PASSWORD
createdb -O msf msf
exit
exit

echo "Installation and Configuration METASPLOIT FRAMEWORK"

cd /opt
sudo git clone https://github.com/rapid7/metasploit-framework.git
sudo chown -R `whoami` /opt/metasploit-framework
cd metasploit-framework
gem install bundler
bundle install
sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'

echo "Installing Armitage"

curl -# -o /tmp/armitage.tgz http://www.fastandeasyhacking.com/download/armitage-latest.tgz
sudo tar -xvzf /tmp/armitage.tgz -C /opt
sudo ln -s /opt/armitage/armitage /usr/local/bin/armitage
sudo ln -s /opt/armitage/teamserver /usr/local/bin/teamserver
sudo sh -c "echo java -jar /opt/armitage/armitage.jar \$\* > /opt/armitage/armitage"
sudo perl -pi -e 's/armitage.jar/\/opt\/armitage\/armitage.jar/g' /opt/armitage/teamserver
echo "YAML Configuration Creation"
echo "production:
 adapter: postgresql
 database: msf
 username: msf
 password: 
 host: 127.0.0.1
 port: 5432
 pool: 75
 timeout: 5" >> sudo vi /opt/metasploit-framework/config/database.yml
 
sudo sh -c "echo export MSF_DATABASE_CONFIG=/opt/metasploit-framework/config/database.yml >> /etc/profile"

source /etc/profile
source ~/.bashrc

echo "Initializing MSF CONSOLE"

msfconsole
