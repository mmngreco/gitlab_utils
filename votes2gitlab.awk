#!/usr/bin/awk -f

# The format expected is as follows :
# https://host/group/project/-/issues/791	57.5
# Usage :
# $ ./votes2gitlab.awk votes.txt
# Output:
# curl --request POST --header "PRIVATE-TOKEN: <token>" "https://host/api/v4/projects/324/issues/1137/time_estimate?duration=6.0d"

BEGIN {

FS="\t"
TMPL="curl --request POST --header \"PRIVATE-TOKEN: %s\" \"%s/%s/time_estimate?duration=%sd\"\n"

}

NR>1 && $2>0 { split($1, IP, "/"); printf TMPL, TOKEN, ENDPOINT, IP[9], $2 }

END {}
