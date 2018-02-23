 #/etc/rc.local.d/local.sh
/bin/kill $(cat /var/run/crond.pid)
/bin/echo '*/3  *    *   *   *   /vmfs/volumes/5a29cc41-b5d585cc-bf15-00fd45fc877c/auto_shutdown/ping_daemon.sh' >> /var/spool/cron/crontabs/root
/bin/crond
