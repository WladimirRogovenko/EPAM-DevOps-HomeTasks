#!/bin/bash

#in command line for task:
# echo poem44.txt | ./streams.sh 1>/dev/null 2>error.file

echo Enter filename:
read filename
cat << EOF >$filename
An old silent pond...
A frog jumps into the pond,
splash! Silence again.

Autumn moonlight-
a worm digs silently
into the chestnut.

In the twilight rain
these brilliant-hued hibiscus -
A lovely sunset.
EOF

echo Task finished 1>&2
