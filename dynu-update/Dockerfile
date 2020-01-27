FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron curl dnsutils

# Create directory and copy shell script
RUN mkdir /etc/dynu/
COPY dynu.sh /etc/dynu/dynu.sh 
RUN chmod 0755 /etc/dynu/dynu.sh

# Copy hello-cron file to the cron.d directory
COPY dynu-cronjob /etc/cron.d/dynu-cronjob

# Give execution rights on the cron job
RUN chmod 0755 /etc/cron.d/dynu-cronjob

# Apply cron job
RUN crontab /etc/cron.d/dynu-cronjob

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Create the log file to be able to write to logs from cron
RUN touch /var/log/dynujob.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
