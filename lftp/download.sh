#!/bin/sh

LFTP_HOME=/root/

HOST=127.0.0.1
REMOTE_DIR=~
LOCAL_DIR=~

HOST=$1
REMOTE_DIR=$2
LOCAL_DIR=$3


lftp <<EOF
set cmd:default-protocol sftp
set sftp:auto-confirm yes
set cmd:interactive no
open $HOST
cd $REMOTE_DIR
mirror -e -c -P2 --use-pget-n=5 ./ $LOCAL_DIR
exit
EOF