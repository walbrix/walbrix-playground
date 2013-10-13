#!/usr/bin/python
import sys
import subprocess
import os
import re
import glob

WB="/usr/sbin/wb"
env = Environment(ENV = os.environ)

def get_deps(lstfile, arch, region):
    lstfile_deps = subprocess.Popen([WB, "find_lstfile_deps", "--arch="+arch, "--region="+region, lstfile], shell=False, stdout=subprocess.PIPE)
    deps = [lstfile]
    line = lstfile_deps.stdout.readline()
    while line:
        if line.endswith('\n'): line = line[:-1]
        deps.append(line)
        line = lstfile_deps.stdout.readline()
    if lstfile_deps.wait() != 0: raise Exception("lstfile_deps fail")
    return deps

def define_all():
    archs = ["x86_64","i686"]
    regions = ["jp","in"]
    lstfiles = glob.glob("*.lst")
    for lstfile in lstfiles:
        artifact = os.path.splitext(lstfile)[0]
        for arch in archs:
            for region in regions:
                define_target("%s-%s-%s.tar.xz" % (artifact, arch, region))

def define_target(target):
    (artifact, arch, region) = re.compile(r'^(.+)-(.+)-(.+)\.tar\.xz$').match(target).groups()
    lstfile = artifact + ".lst"
    deps = get_deps(lstfile, arch, region)
    env.Command(target, deps, "%s collect-sysfiles --arch=%s --region=%s -b -J ${TARGET} -r -f /var/db/wb/filedb %s ${TARGET}.tmp %s" % (WB, arch,region,arch,lstfile))

if len(COMMAND_LINE_TARGETS) > 0:
    for target in COMMAND_LINE_TARGETS:
        define_target(target)
else:
    define_all()
    

