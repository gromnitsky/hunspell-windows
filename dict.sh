#!/bin/sh

usage() { echo "Usage: `basename "$0"` repo-dir output-dir" 1>&2; exit 1; }
aliases() { egrep -m1 "^$1\s" dict.txt | awk '{$1=""; print $0}'; }

[ -z "$1" -o -z "$2" ] && usage

repo=$1
out=$2

mkdir -p $out
for aff in `find $repo -name \*.aff`; do
    cp $aff $out/
    cp ${aff%.*}.dic $out/

    base=`basename $aff .aff`
    for alias in `aliases $base`; do
	cp $aff $out/$alias.aff
	cp ${aff%.*}.dic $out/$alias.dic
    done
done

ls $out/* | egrep -v '[a-z]{2}_[A-Z]{2}\.' | xargs rm
cp $out/en_US.aff $out/default.aff
cp $out/en_US.dic $out/default.dic
