#!/bin/sh

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
PASSWD=****
USER_NAME=****

echo url="https://api.dynu.com/nic/update?myip=$IP&username=$USER_NAME&password=$PASSWD" | curl -k -o /var/log/dynujob.log -K - 
