#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
source .env
PROJECT_ID=324
ENDPOINT="https://$HOST/api/v4/projects/$PROJECT_ID"
MILESTONE="sprint:38"
ISSUES="issues?iids[]="

for iid in "$@"
do
    echo Exporting $iid from gitlab to $iid.md
    URL="$ENDPOINT/issues?iids[]=$iid"
    curl -s --header "PRIVATE-TOKEN: $TOKEN" "$URL" | jq -r '.[] | "# " + .title + "\n\n" + .description' > $iid.md
    echo
done

