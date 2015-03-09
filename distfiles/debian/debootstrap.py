#!/usr/bin/python

import os
import subprocess
import shutil
import argparse
import tempfile

arch_strings = {"i686":"i386","x86_64":"amd64"}

def shell_exec(cmd):
    process = subprocess.Popen(cmd, shell=True)
    if process.wait() != 0: raise Exception("Subprocess '%s' returned error")

def debootstrap(arch, dist, packages, prefix="debian"):
    tmpdir = tempfile.mkdtemp()
    try:
        shell_exec("debootstrap --no-check-gpg --arch=%s --include=%s %s %s" % (arch_strings[arch], packages, dist, tmpdir))
        shell_exec("chroot %s apt-get clean" % tmpdir)
        shell_exec("tar Jcvpf %s-%s.tar.xz -C %s ." % (prefix, arch, tmpdir))
    finally:
        shutil.rmtree(tmpdir)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("arch")
    parser.add_argument("dist")

    args = parser.parse_args()

    if args.arch not in arch_strings:
        raise Exception("Invalid architecture name")
    pkgs = "openssh-server,avahi-daemon,samba,ntp,openvpn,ca-certificates"
    is_ubuntu = os.system("grep -q ubuntu /usr/share/debootstrap/scripts/%s" % args.dist) == 0
    if not is_ubuntu: pkgs += ",locales-all"
    debootstrap(args.arch, args.dist, pkgs, "ubuntu" if is_ubuntu else "debian")

