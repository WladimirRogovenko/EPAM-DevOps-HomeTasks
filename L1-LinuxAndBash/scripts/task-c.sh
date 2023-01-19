#!/bin/bash

if [ $# -lt 2 ]
	then
	echo "Error: Must be minimum 2 arguments: task-c.sh SourceDir DestignationDir [logfile]"
	exit 1
fi

source=$1
dest=$2
logfile="./rsync.log"
if [ $# -ge 3 ]
	then
	logfile=$3
fi

if ! [ -d $source ]
	then
	echo "Error: Source dir does not exist!"
	exit 1
fi
if ! [ -d $dest ]
	then
	echo "Error: Destignation dir does not exist!"
	exit 1
fi

rsync -carv --delete --log-file=$logfile $source $dest
