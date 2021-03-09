#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
source .env
ENDPOINT="https://$HOST/api/v4/groups/253/projects"
TMPL="curl --header \"PRIVATE-TOKEN: $TOKEN\" \"$ENDPOINT\"\n"
MILESTONE="${1:-sprint:39}"
SEP="\t"

curl \
    --header \
    "PRIVATE-TOKEN: $TOKEN" \
    "$ENDPOINT?scope=all&milestone=$MILESTONE&per_page=100" \
    | jq -r ".[] | .name "

