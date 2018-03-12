#/etc/rc.local.d/local.sh
/bin/kill $(cat /var/run/crond.pid)
/bin/echo '*/3  *    *   *   *   /vmfs/volumes/datastore1/auto_shutdown/ping_daemon.sh' >> /var/spool/cron/crontabs/root
/bin/crond
