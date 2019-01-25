#!/bin/bash

SLACK_TOKEN_FILE=~/.slack-token

if [ ! -f "${SLACK_TOKEN_FILE}" ]; then
  echo "Please put slack token into ${SLACK_TOKEN_FILE}"
  exit 1
fi
SLACK_TOKEN=`cat ${SLACK_TOKEN_FILE}`

curl -s -o /dev/null -H "Authorization: Bearer ${SLACK_TOKEN}" https://slack.com/api/dnd.endSnooze
curl -s -o /dev/null -H "Authorization: Bearer ${SLACK_TOKEN}" https://slack.com/api/users.profile.set -d "profile={ \"status_emoji\": \":apple:\", \"status_text\": \"Available\" }" -X POST



