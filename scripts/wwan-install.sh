#!/bin/bash
cd GobiSerial
make
make install
echo "Enableing Debug Messages: "
sudo modprobe GobiSerial debug=1
echo "Network driver installation: "
cd GobiNet
make
make install
echo "Enabling Network Debug Messages: "
sudo modprobe GobiNet debug=1