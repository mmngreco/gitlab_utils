#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues

FILE=${args[--file]}
echo FILE = $FILE
PB_ID=${args[--projectid]}
echo PB_ID = $PB_ID
ENDPOINT="https://$GITLAB_HOST/api/v4/projects/$PB_ID/issues"

awk -v TOKEN="$GITLAB_TOKEN" \
    -v ENDPOINT="$ENDPOINT" \
    '
    BEGIN {

    FS="\t"
    TMPL="curl --request POST --header \"PRIVATE-TOKEN: %s\" \"%s/%s/time_estimate?duration=%sd\"\n"

    }

    NR>1 && $2>0 { split($1, IP, "/"); printf TMPL, TOKEN, ENDPOINT, IP[9], $2 }

    END {}
    ' $FILE > ./curl_post_votes.sh \
        && sh ./curl_post_votes.sh \
        && rm ./curl_post_votes.sh
