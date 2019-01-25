#!/bin/bash

SLACK_TOKEN_FILE=~/.slack-token

if [ $# -lt 2 ]; then
  echo "$0 <number_of_minutes> <reason>"
  exit 1
fi
NUM_OF_MINUTES="$1"
shift
REASON="$*"

if [ ! -f ${SLACK_TOKEN_FILE} ]; then
  echo "Please put slack token into ${SLACK_TOKEN_FILE}"
  exit 1
fi
SLACK_TOKEN=`cat ${SLACK_TOKEN_FILE}`

curl -s -o /dev/null -H "Authorization: Bearer ${SLACK_TOKEN}" https://slack.com/api/dnd.setSnooze?num_minutes=${NUM_OF_MINUTES}
STATUS_TEXT="I am occupied with ${REASON} till $(/bin/date -v+${NUM_OF_MINUTES}M '+%H:%M')"
curl -s -o /dev/null -H "Authorization: Bearer ${SLACK_TOKEN}" https://slack.com/api/users.profile.set -d "profile={ \"status_emoji\": \":raised_hand:\", \"status_text\": \"${STATUS_TEXT}\" }" -X POST

echo "$(/bin/date -v+${NUM_OF_MINUTES}M +'%M %H %d %m *') /usr/local/bin/unset-dnd.sh" | crontab -
