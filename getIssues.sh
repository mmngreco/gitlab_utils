#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
source .env
PROJECT_ID=487
ENDPOINT="http://$HOST/api/v4/projects/$PROJECT_ID"
ISSUES="issues?iids[]="

for iid in "$@"
do
    URL="$ENDPOINT/issues?iids[]=$iid"
    echo curl -s --header "\"PRIVATE-TOKEN: $TOKEN\"" "\"$URL\""
done
