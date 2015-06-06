#!/bin/bash
# Basic script to build and mount an image file for centOS or Ubuntu on MAC OSX
# Supported systems: MAC OSX
# Jordan Westhoff, RIT 2014


IMG = "img"
ISO = "iso"
NAMESPACE = CentOS-6.5-x86_64-LiveCD
PATH_TO   = /Users/jordanwesthoff/Desktop/

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
      exit 1
fi

fdisk -l
diskutil list
sleep 5
read -p "Designate the device to mount to: (/dev/...)" usb

echo "UnmountDisk"
diskutil unmountDisk /dev/$usb

echo "Convert ISO to IMG"
hdiutil convert -format UDRW -o $PATH_TO/$NAMESPACE.$IMG $PATH_TO/$NAMESPACE.$ISO

echo "Copy the IMG to the USB device"
sudo dd if=$PATH_TO.$NAMESPACE.$IMG of=/dev/$usb bs=1m

echo "Eject"
diskutil eject /dev/$usb
