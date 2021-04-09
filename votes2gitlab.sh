#!/bin/bash
source .env

FILE="${1:-votes.txt}"
PB_ID=324
ENDPOINT="https://$HOST/api/v4/projects/$PB_ID/issues"

./votes2gitlab.awk -v TOKEN="$TOKEN" -v ENDPOINT="$ENDPOINT" $FILE > ./curl_post_votes.sh && sh ./curl_post_votes.sh
