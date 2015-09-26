#!/bin/bash
## todo add wget paths
echo "Patching wl and cfg80211 "
rmmod wl.ko && rmmod cfg80211
make API=CFG80211
make install
modprobe wl
modprobe cfg80211
