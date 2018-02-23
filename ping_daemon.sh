#!/bin/sh

NUM=`ps -c | grep ping.sh | grep -v grep | wc -l`

if [ "${NUM}" -lt "1" ];then
    /vmfs/volumes/5a29cc41-b5d585cc-bf15-00fd45fc877c/auto_shutdown/ping.sh &
    echo "$(date): Ping daemon start" >> /vmfs/volumes/5a29cc41-b5d585cc-bf15-00fd45fc877c/auto_shutdown/ping.log
fi

exit 0