#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
group="${1:-253}"
url="https://$GITLAB_HOST/api/v4/groups/$group/projects?scope=all&per_page=100"
header="PRIVATE-TOKEN: $GITLAB_TOKEN"

curl -S -s --header "$header" "$url" | jq -r ".[] | .name "

