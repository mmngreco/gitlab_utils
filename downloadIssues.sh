#!/usr/bin/env bash
# https://docs.gitlab.com/ce/api/issues.html#list-project-issues
source .env
PROJECT_ID=324
ENDPOINT="https://$GITLAB_HOST/api/v4/projects/$PROJECT_ID"
MILESTONE="sprint:39"
ISSUES="issues?iids[]="
OUTPUT="downloads"

[ ! -d "$OUTPUT" ] && mkdir $OUTPUT

for iid in "$@"
do
    echo Exporting $iid from gitlab to $iid.md
    URL="$ENDPOINT/issues?iids[]=$iid"
    curl -s --header "PRIVATE-TOKEN: $GITLAB_TOKEN" "$URL" | jq -r '.[] | "# " +
.title + "\n\n" + .description' > $OUTPUT/$iid.md
    echo
done

