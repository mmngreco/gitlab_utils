#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
# Usage
#    ./getMilestone.sh "sprint:40"

if [ -f .env ]; then
    source .env
fi

if [[ ! -v GITLAB_HOST ]]; then
    echo '
    The following varibles are required:

        GITLAB_HOST=gitlab.com
        GITLAB_TOKEN="asdfasdfkasdf"

    You can define them using `export` in your shell configuration or creating
    a `.env` file, see the README.md for more information.
    '
    exit
fi

ENDPOINT="https://$GITLAB_HOST/api/v4/projects/324/issues"
TMPL="curl --header \"PRIVATE-TOKEN: $GITLAB_TOKEN\" \"$ENDPOINT\"\n"
MILESTONE="${1:-sprint:40}"
SEP="\t"
header="PRIVATE-TOKEN: $GITLAB_TOKEN"
url="$ENDPOINT?scope=all&milestone=$MILESTONE&per_page=100"
jq_query=".[] | (.iid | tostring) + \"$SEP\" + .title  +\"$SEP\" + .web_url  + \"$SEP\" + (.time_stats.time_estimate / 28800 | tostring)"


curl -S -s --header "$header" "$url" | jq -r "$jq_query"
