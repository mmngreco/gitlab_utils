#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues

# Usage
#    ./getIssues.sh 33 22 233

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

PROJECT_ID=487
ENDPOINT="http://$GITLAB_HOST/api/v4/projects/$PROJECT_ID"

for iid in "$@"
do
    URL="$ENDPOINT/issues?iids[]=$iid"
    echo curl -s --header "\"PRIVATE-TOKEN: $GITLAB_TOKEN\"" "\"$URL\""
done
