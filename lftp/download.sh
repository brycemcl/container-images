#!/bin/bash

HOST=$1
LOCAL_DIR=$3
REMOTE_DIR=$2

lftp $HOST <<EOF
set sftp:auto-confirm yes
cd $REMOTE_DIR
mirror -c -P2 --use-pget-n=5 ./ $LOCAL_DIR
exit
EOF