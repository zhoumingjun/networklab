#!/usr/bin/env bash
for idx in {1..2}
do

PID=`lsns --type net | grep "mininet:h"${idx} | awk '{print $4}'`
SUBMAC=`printf "%02d" $idx`
nsenter -n -t ${PID} ip link set address 00:00:00:00:00:${SUBMAC} dev h${idx}-eth0
echo h${idx} information
nsenter -n -t ${PID} ip address show h${idx}-eth0 

done




