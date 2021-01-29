#!/bin/bash
source .env

FILE="${1:-votes.txt}"
ENDPOINT="https://$HOST/api/v4/projects/324/issues"

./votes2gitlab.awk -v TOKEN="$TOKEN" -v ENDPOINT="$ENDPOINT" $FILE > ./curl_post_votes.sh && sh ./curl_post_votes.sh

