#!/bin/bash
mv /usr/share/images/desktop-base/login-background.png /usr/share/images/desktop-base/login-background.png.old
cp /home/solid/Pictures/login-background.png /usr/share/images/desktop-base/login-background.png
echo "Desktop-base login background changed"
sleep 1
mv /usr/share/gnome-shell/theme/KaliLogin.png /usr/share/gnome-shell/theme/KaliLogin.png.old
cp /home/solid/Pictures/login-background.png /usr/share/gnome-shell/theme/KaliLogin.png
sleep 1
echo "Gnome-Shell theme login background changed"
sleep 1
mv usb:\isolinux\splash.png usb:\isolinux\splash.png.bak
cp /home/solid/Picures/soos-splash.png usb:\isolinux\splash.png
sleep 1
echo "Splash screen changed in isolinux"
echo ""
echo "Operation Complete."
