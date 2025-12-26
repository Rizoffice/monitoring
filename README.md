#!/bin/bash
#Maintainer riz1992.shaikh@gmail.com
#This script will monitoring the CPU, RAM and Storage usage of the system.
#Variables
CPU_THRESHOLD=80
RAM_THRESHOLD=80
STORAGE_THRESHOLD=82
EMAIL_ID="riz1992.shaikh@gmail.com"
APP_PASSWORD="hyql ejxa ijio sqww"

echo "CPU, RAM and Storage usage of the system"
echo "The current date and time $(date)"

#Function for sending the email to gmail via curl
send_email() {
    SUBJECT="$1"
    BODY="$2"
    curl --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
      --mail-from "$EMAIL_ID" \
      --mail-rcpt "$EMAIL_ID" \
      --user "$EMAIL_ID:$APP_PASSWORD" \
      -T <(echo -e "From: $EMAIL_ID\nTo: $EMAIL_ID\nSubject: $SUBJECT\n\n$BODY")
}

#Check the cpu usage based on the current usage and send the email to gmail using the function using the condition on 80% threshold with if condition
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
CPU_USAGE_INT=${CPU_USAGE%.*}
if [ $CPU_USAGE_INT -gt $CPU_THRESHOLD ]; then
    send_email "CPU Usage Alert" "CPU usage is above the threshold of $CPU_THRESHOLD%. Current usage: $CPU_USAGE_INT%"
fi
