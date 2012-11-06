#!/bin/sh
VERSION=3.1.2.2
svn export https://svn.java.net/svn/glassfish~svn/tags/$VERSION-no-delete glassfish-$VERSION
tar Jcvpf glassfish-$VERSION-src.tar.xz --numeric-owner glassfish-$VERSION

