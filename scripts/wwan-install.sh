#!/bin/bash
## NEEDS WORK
cd ~/Downloads/GobiSerial
make
make install
echo "Enableing Debug Messages: "
sudo modprobe GobiSerial debug=1
echo "Network driver installation: "
cd ~/Dowloads/GobiNet
make
make install
echo "Enabling Network Debug Messages: "
sudo modprobe GobiNet debug=1
