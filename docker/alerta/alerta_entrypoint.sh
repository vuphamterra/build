#!/usr/bin/env bash
set -e

service nginx restart
/opt/alerta/bin/uwsgi --ini /etc/uwsgi.ini &
./housekeeping_cron.sh &
#bash &
#echo "hello"
#sleep 1000
wait -n
