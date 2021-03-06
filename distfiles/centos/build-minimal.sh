#!/bin/sh

if [ $# -eq 0 ]; then
	echo "you must specify release package rpm's URL"
	exit 1
fi

RELEASE_RPM=$1
ARCH=`echo $RELEASE_RPM|sed 's/.*\.\(.*\)\.rpm$/\1/'`
RELEASE=`echo $RELEASE_RPM|sed 's/.*\/\([0-9\.]*\)\/os\/.*\/\(CentOS\|Packages\)\/.*\.rpm$/\1/'`
echo $ARCH $RELEASE

[ $ARCH = "i686" ] && PREFIX=i386 || PREFIX=$ARCH

rm -rf /tmp/centos-$RELEASE-$ARCH
mkdir -p /tmp/centos-$RELEASE-$ARCH/var/lib/rpm
$PREFIX rpm --root /tmp/centos-$RELEASE-$ARCH --initdb || exit 1
$PREFIX rpm -ivh --nodeps --root /tmp/centos-$RELEASE-$ARCH $RELEASE_RPM
$PREFIX yum --nogpgcheck --installroot /tmp/centos-$RELEASE-$ARCH install -y yum || exit 1
rm -f /tmp/centos-$RELEASE-$ARCH/var/lib/rpm/*
rm -rf /tmp/centos-$RELEASE-$ARCH/var/cache/yum || exit 1
echo "nameserver 8.8.8.8" > /tmp/centos-$RELEASE-$ARCH/etc/resolv.conf
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH rpm --initdb
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH rpm -ivh $RELEASE_RPM
mount -o bind /dev /tmp/centos-$RELEASE-$ARCH/dev
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH yum install -y yum
rm /tmp/centos-$RELEASE-$ARCH/var/cache/yum/base/packages/*
$PREFIX chroot /tmp/centos-$RELEASE-$ARCH yum install -y vim-minimal less initscripts passwd tar net-tools || exit 1
umount /tmp/centos-$RELEASE-$ARCH/dev
tar Jcvpf centos-$RELEASE-$ARCH.tar.xz -C /tmp/centos-$RELEASE-$ARCH . || exit 1
rm -rf /tmp/centos-$RELEASE-$ARCH

