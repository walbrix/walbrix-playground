#!/bin/sh
ARCH=i386
PACKAGES=openssh-server,avahi-daemon,samba,ntp,openvpn,ca-certificates,locales-all 
DIST=wheezy
mkdir tmp || exit
debootstrap --arch=$ARCH --include=$PACKAGES $DIST ./tmp || exit
chroot ./tmp apt-get clean
tar Jcvpf debian-i686.tar.xz -C ./tmp .
rm -rf tmp
