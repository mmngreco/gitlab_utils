#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
PROJECT_ID=324
ENDPOINT="https://$GITLAB_HOST/api/v4/projects/$PROJECT_ID"
MILESTONE="sprint:39"
ISSUES="issues?iids[]="
OUTPUT=${args[--output]}
query='.[] | "# " + .title + "\n\n" + .description'
header="PRIVATE-TOKEN: $GITLAB_TOKEN"

[ ! -d "$OUTPUT" ] && mkdir $OUTPUT

echo Exporting...

for iid in ${args[--issues]}; do

    URL="$ENDPOINT/issues?iids[]=$iid"
    content=$(curl -s --header "${header}" ${URL} | jq -r "${query}")

    if [ -n "$content" ]; then
        echo Writing $OUTPUT/$iid.md
        echo "$content" > $OUTPUT/$iid.md
    else
        echo "Couldn't retrieve content for the issue ${iid}."
    fi

done

