#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues

ENDPOINT="https://$GITLAB_HOST/api/v4/projects/324/issues"
TMPL="curl --header \"PRIVATE-TOKEN: $GITLAB_TOKEN\" \"$ENDPOINT\"\n"
MILESTONE="${args[--milestone]}"
SEP="\t"
header="PRIVATE-TOKEN: $GITLAB_TOKEN"
url="$ENDPOINT?scope=all&milestone=$MILESTONE&per_page=100"
jq_query=".[] | (.iid | tostring) + \"$SEP\" + .title  +\"$SEP\" + .web_url  + \"$SEP\" + (.time_stats.time_estimate / 28800 | tostring)"

curl -S -s --header "$header" "$url" | jq -r "$jq_query"
