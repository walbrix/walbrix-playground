#!/bin/sh
mkdir tmp
debootstrap --arch=i386 --include=openssh-server,avahi-daemon,samba,ntp,openvpn,ca-certificates squeeze ./tmp
chroot ./tmp apt-get clean
tar Jcvpf debian-i686.tar.xz -C ./tmp .
rm -rf tmp
