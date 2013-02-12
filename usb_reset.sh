#!/bin/sh

DEVICE="046e:6000"
USB_RESET_CMD="echo" # change to usb reset utility

usb_dev=$(lsusb -d $DEVICE)

$USB_RESET_CMD /dev/bus/usb/${usb_dev:4:3}/${usb_dev:15:3}