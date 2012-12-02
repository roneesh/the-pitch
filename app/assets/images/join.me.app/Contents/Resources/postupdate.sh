#!/bin/sh

# Note that this file isn't run when upgrading from version 1.0.

APPBUNDLE="$1"

if [ -z "$APPBUNDLE" ]; then
    # Versions before 1.2 did not supply a bundle argument.
    # Find the bundle's location from the directory we are being run from.
    DIRNAME="$(dirname "$0")"
    APPBUNDLE="${DIRNAME%%join.me.app/*}"join.me.app
fi

if [ ! -d "$APPBUNDLE" ]; then
    echo "Usage: $0 <Bundle>" 1>&2
    exit 1
fi


echo "Starting post update script on bundle $APPBUNDLE"

set -xe
chmod 0755 "$APPBUNDLE/Contents/MacOS/join.me"
chmod 0755 "$APPBUNDLE/Contents/Resources/relaunch"
chmod 0755 "$APPBUNDLE/Contents/Resources/update.sh"
chmod 0755 "$APPBUNDLE/Contents/Resources/postupdate.sh"
set +xe

echo "Post update done"
