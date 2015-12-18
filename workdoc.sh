#!/bin/bash

DIR=$HOME/Documents/Workdoc/$(date +%Y-%m-%d)/
PREFIX=screen-$(date +%H-%M-%S)
SCREENSHOT=$DIR$PREFIX.jpg
WORK_IP="10.60."

# Disables script
#exit 0

# Don't document work if not at work
[ "$(ifconfig | grep $WORK_IP)" = "" ] && exit 0

[ -d $DIR ] || mkdir -p $DIR

# Create screenshots
/usr/sbin/screencapture -t jpg -x $DIR$PREFIX-0.jpg $DIR$PREFIX-1.jpg
# Concatenate screens into a single image
/usr/local/bin/montage -mode concatenate $DIR$PREFIX-*.jpg $SCREENSHOT

# clean up
if [ -f "$SCREENSHOT" ]; then
	rm -f $DIR$PREFIX-*.jpg
fi

echo "Screenshot created: $SCREENSHOT"

