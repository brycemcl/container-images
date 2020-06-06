#!/bin/bash
tgtd --iscsi portal=:3260,nop_interval=5,nop_count=6 -D &
P1=$!
#other_command &
#P2=$!
wait $P1 #$P2