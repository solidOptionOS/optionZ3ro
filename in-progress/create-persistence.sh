#!/bin/bash
end=7gb
read start _ < <(du -bcm solid-kali-2.0.iso | tail -1); echo $start
parted /dev/sdb mkpart primary $start $end
sleep 5
fdisk -l
echo -e $YELLOW"Enter disk: (ex. sdb3) "$ENDCOLOR;
read DISK
echo -e $BLUE"Thank you."$ENDCOLOR;
sleep 1 
echo ""
cryptsetup --verbose --verify-passphrase luksFormat /dev/$DISK
cryptsetup luksOpen /dev/$DISK my_usb
sleep 1
echo -e $BLUE"Labeling new ext3 filesystem.."$ENDCOLOR;
sleep 1
mkfs.ext3 -L persistence /dev/mapper/my_usb
e2label /dev/mapper/my_usb persistence
echo ""
sleep 0.5
echo -e $GREEN"Complete."$ENDCOLOR;
echo ""
sleep 1
echo -e $BLUE"Creating mount point, mounting encrypted partition, and setting up the persistence.conf file, unmounting."$ENDCOLOR;
echo ""
sleep 1
mkdir -p /mnt/my_usb
mount /dev/mapper/my_usb /mnt/my_usb
echo "/ union" > /mnt/my_usb/persistence.conf
umount /dev/mapper/my_usb
echo ""
sleep 1
echo -e $GREEN"Done."$ENDCOLOR;
echo ""
sleep 1
echo -e $BLUE"Closing luksClose.."
echo ""
sleep 1
echo -e $BLUE"Syncing.."$ENDCOLOR;
echo ""
sleep 1
sync
cryptsetup luksClose /dev/mapper/my_usb
sleep 1
echo ""
echo -e $GREEN"Success! Solid Persistence Drive Complete."$ENDCOLOR;
echo -e $BLUE"You may now remove the drive."$ENDCOLOR;


