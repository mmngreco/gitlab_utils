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

group="${1:-253}"
url="https://$GITLAB_HOST/api/v4/groups/$group/projects?scope=all&per_page=100"
header="PRIVATE-TOKEN: $GITLAB_TOKEN"

curl -S -s --header "$header" "$url" | jq -r ".[] | .name "

