#!/bin/bash
echo "Download the latest Java SE JDK from the web.. "
sleep 1
echo "Directing to page - don't forget to click 'agree'."
sleep 1
/usr/bin/iceweasel -new-window http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
sleep 5
echo "When you have downloaded the file to your ~/Downloads folder, enter the file name here: [example: jdk-7u79-linux-x64.tar.gz]' "
read JAVATARBALL
cd ~/Downloads && tar -xzvf $JAVATARBALL -C /opt && cd /opt/
sleep 1
echo "[h3x] Please enter the name of the new folder copied to /opt [this part will be automated soon - thanks for your patience.  ex. jdk1.7.0_79]: "
read OPTFOLDER
cd $OPTFOLDER
sleep 1
update-alternatives --install /usr/bin/java java /opt/$OPTFOLDER/bin/java 1
update-alternatives --install /usr/bin/javac javac /opt/$OPTFOLDER/bin/javac 1
update-alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so mozilla-javaplugin.so /opt/$OPTFOLDER/jre/lib/amd64/libnpjp2.so 1
update-alternatives --set java /opt/$OPTFOLDER/bin/java
update-alternatives --set javac /opt/$OPTFOLDER/bin/javac
update-alternatives --set mozilla-javaplugin.so /opt/$OPTFOLDER/jre/lib/amd64/libnpjp2.so
sleep 1
echo "Java SE JDK Installed Successfully!"


