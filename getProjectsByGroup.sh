#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
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
ENDPOINT="https://$GITLAB_HOST/api/v4/groups/253/projects"
TMPL="curl --header \"PRIVATE-TOKEN: $GITLAB_TOKEN\" \"$ENDPOINT\"\n"
MILESTONE="${1:-sprint:39}"
SEP="\t"

curl \
    --header \
    "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    "$ENDPOINT?scope=all&milestone=$MILESTONE&per_page=100" \
    | jq -r ".[] | .name "

