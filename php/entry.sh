#!/bin/sh
#crond -L /var/log/cron/cron.log "$@"
#chown -R www:www /var/www/symfony
/fpm.sh -D
status=$?
if [ $status -ne 0 ]; then
  echo "php-fpm5 Failed: $status"
  exit $status
  else echo "Starting PHP-FPM: OK"
fi

sleep 2

while /bin/true; do
  ps aux | grep 'php-fpm: master process' | grep -q -v grep
  PHP_FPM_STATUS=$?
  echo "Checking PHP-FPM, Status Code: $PHP_FPM_STATUS"
  sleep 2

  if [ $PHP_FPM_STATUS -ne 0 ];
    then
      echo "$(date +%F_%T) FATAL: PHP-FPM Raised a Status Code of $PHP_FPM_STATUS and exited"
      exit -1
  fi
  sleep 60
done
