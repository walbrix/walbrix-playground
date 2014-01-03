#!/bin/sh

if [ $# -eq 0 ]; then
	echo "you must specify release package rpm's URL"
	exit 1
fi

RELEASE_RPM=$1
ARCH=`echo $RELEASE_RPM|sed 's/.*\.\(.*\)\.rpm$/\1/'`
RELEASE=`echo $RELEASE_RPM|sed 's/.*\/\([0-9\.]*\)\/os\/.*\/Packages\/.*\.rpm$/\1/'`
echo $ARCH $RELEASE

PREFIX=i386

rm -rf /tmp/centos-$RELEASE-$ARCH
mkdir -p /tmp/centos-$RELEASE-$ARCH/var/lib/rpm
$PREFIX rpm --root /tmp/centos-$RELEASE-$ARCH --initdb
$PREFIX rpm -ivh --nodeps --root /tmp/centos-$RELEASE-$ARCH $RELEASE_RPM
$PREFIX yum --nogpgcheck --installroot /tmp/centos-$RELEASE-$ARCH install -y yum || exit
rm /tmp/centos-$RELEASE-$ARCH/var/lib/rpm/*
rm -rf /tmp/centos-$RELEASE-$ARCH/var/cache/yum
echo "nameserver 8.8.8.8" > /tmp/centos-$RELEASE-$ARCH/etc/resolv.conf
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH rpm --initdb
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH rpm -ivh $RELEASE_RPM
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH yum install -y yum
rm /tmp/centos-$RELEASE-$ARCH/var/cache/yum/base/packages/*
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH yum install -y vim-minimal less initscripts passwd tar
tar Jcvpf centos-$RELEASE-$ARCH.tar.xz -C /tmp/centos-$RELEASE-$ARCH .
rm -rf /tmp/centos-$RELEASE-$ARCH

