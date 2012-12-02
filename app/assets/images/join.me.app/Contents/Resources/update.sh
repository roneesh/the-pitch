#!/bin/sh
#  Copyright 2011 LogMeIn. All rights reserved.

set -ex

INSTALLED_BUNDLE="$1"
UPDATE_PACKAGE="$2"

if [ -z "$INSTALLED_BUNDLE" -o -z "$UPDATE_PACKAGE" -o ! -r "$UPDATE_PACKAGE" ]; then
    echo "Usage: $0 <destination bundle> <update package>" 1>&2
    exit 1
fi

if [ ! -d "$INSTALLED_BUNDLE" ]; then
    echo "Can't find bundle $INSTALLED_BUNDLE" 1>&2
    exit 2
fi

if [ ! -r "$UPDATE_PACKAGE" ]; then
    echo "Can't read $UPDATE_PACKAGE" 1>&2
    exit 3
fi

echo "Updating $INSTALLED_BUNDLE with $UPDATE_PACKAGE"

ARCHIVE="/tmp/join.me.archive.tar.bz2"
/bin/rm -rf "$ARCHIVE" || true
/usr/bin/tar -cjf "$ARCHIVE" "$INSTALLED_BUNDLE"

BASEDIR="$(dirname "$UPDATE_PACKAGE")"

STAGEDIR="$BASEDIR/stage"
mkdir -p "$STAGEDIR"

/usr/bin/unzip "$UPDATE_PACKAGE" -d "$STAGEDIR"

if [ -d "$STAGEDIR/join.me.app" ]; then
	: # Nothing to do
elif [ -d "$STAGEDIR/join.me.pkg" ]; then
	pushd "$STAGEDIR"
	/bin/pax -rz -f "$STAGEDIR/join.me.pkg/Contents/Archive.pax.gz" -s '?^/??'
	popd
	/bin/mv -f \
		"$STAGEDIR/join.me.pkg/Contents/Resources/params.txt" \
		"$STAGEDIR/join.me.app/Contents/Resources" || true
    /bin/mv -f
        "$STAGEDIR/join.me.pkg/Contents/Resources/config.json" \
        "$STAGEDIR/join.me.app/Contents/Resources" || true
else
	echo "Error extracting update package: invalid/unknown contents"
	exit 1
fi

if [ -r "$STAGEDIR/join.me.app/Contents/Resources/params.txt" ]; then
    mv "$STAGEDIR/join.me.app/Contents/Resources/params.txt" "$STAGEDIR/params.txt"
    cat "$STAGEDIR/params.txt" | sed 's/-weblaunch//' > "$STAGEDIR/join.me.app/Contents/Resources/params.txt"
fi

rm -rf "$INSTALLED_BUNDLE" || true

/bin/mv -f "$STAGEDIR/join.me.app" "$INSTALLED_BUNDLE"
touch "$INSTALLED_BUNDLE"

POSTUPDATE="$INSTALLED_BUNDLE/Contents/Resources/postupdate.sh"
if [ -r "$POSTUPDATE" ]; then
    /bin/sh "$POSTUPDATE" "$INSTALLED_BUNDLE"
fi

cd /
/bin/rm -rf "$STAGEDIR"

echo "Update successful"
