#!/bin/sh

while
    ping -c 1 -W 5 192.168.1.1 > /dev/null
    [ $? -eq 0 ];
do
    # echo "$(date): Ping is OK." >> /vmfs/volumes/5a29cc41-b5d585cc-bf15-00fd45fc877c/auto_shutdown/ping.log
    sleep 3m
done

echo "$(date): Ping is failure. try again after 1 minute!" >> /vmfs/volumes/5a29cc41-b5d585cc-bf15-00fd45fc877c/auto_shutdown/ping.log
sleep 1m

ping -c 1 -W 10 192.168.1.1 > /dev/null
if [ $? -eq 0 ]
then
    echo 'Try again, Ping is OK!' >> /vmfs/volumes/5a29cc41-b5d585cc-bf15-00fd45fc877c/auto_shutdown/ping.log
else
    echo 'Ping is failure again, shut down Now!' >> /vmfs/volumes/5a29cc41-b5d585cc-bf15-00fd45fc877c/auto_shutdown/ping.log
    /bin/shutdown.sh
    halt
fi