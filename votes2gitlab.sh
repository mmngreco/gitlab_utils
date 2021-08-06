#!/bin/bash
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

FILE="${1:-votes.txt}"
PB_ID=324
ENDPOINT="https://$GITLAB_HOST/api/v4/projects/$PB_ID/issues"

./votes2gitlab.awk -v TOKEN="$GITLAB_TOKEN" -v ENDPOINT="$ENDPOINT" $FILE > ./curl_post_votes.sh && sh ./curl_post_votes.sh
