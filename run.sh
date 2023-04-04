#/bin/sh
java -jar app.jar &
echo "0 * * * * /bin/sh /app/check_env.sh" > /etc/cron.d/check-env-cron
chmod 0644 /etc/cron.d/check-env-cron
crontab /etc/cron.d/check-env-cron
cron -f