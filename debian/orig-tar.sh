#!/bin/sh -e

VERSION=$1
TAR=../saxonhe_$VERSION+dfsg.orig.tar.xz
DIR=saxonhe-$VERSION
TAG="$VERSION"

svn -q export https://dev.saxonica.com/repos/archive/opensource/tags/${TAG}/hej $DIR
XZ_OPT=--best tar cJf $TAR \
 --exclude 'javax' \
 --exclude 'net/sf/saxon/dotnet' \
 --exclude 'net/sf/saxon/data/w3c' \
 --exclude 'net/sf/saxon/option' $DIR
rm -rf $DIR ../$TAG
