#!/bin/sh

LFTP_HOME=/root/

HOST=127.0.0.1
REMOTE_DIR=~
LOCAL_DIR=~

HOST=$1
REMOTE_DIR=$2
LOCAL_DIR=$3

cp /netrc/.netrc /root/.netrc

lftp <<EOF
set cmd:default-protocol sftp
set net:timeout 5
set net:max-retries 30
set net:reconnect-interval-multiplier 1
set net:reconnect-interval-base 5
set sftp:auto-confirm yes
set xfer:use-temp-file yes
set cmd:interactive no
open $HOST
cd $REMOTE_DIR
mirror -v -e -c --parallel=4 ./ $LOCAL_DIR
exit
EOF


#set pget:min-chunk-size 50m
#mirror -v -e --parallel=2 --use-pget-n=5 ./ $LOCAL_DIR