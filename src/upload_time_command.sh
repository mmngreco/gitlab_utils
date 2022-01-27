#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues

FILE=$(realpath "${args[--file]}")
echo FILE = $FILE
PB_ID=${args[--projectid]}
echo PB_ID = $PB_ID
ENDPOINT="https://$GITLAB_HOST/api/v4/projects/$PB_ID/issues"

awk -v TOKEN="$GITLAB_TOKEN" \
    -v ENDPOINT="$ENDPOINT" \
    -f src/upload.awk $FILE > src/curl_post_votes.sh \
    && sh src/curl_post_votes.sh \
    && rm src/curl_post_votes.sh
