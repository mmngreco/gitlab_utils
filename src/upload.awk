BEGIN {
    # tab separated
    FS="\t";
    TMPL="curl --request POST --header \"PRIVATE-TOKEN: %s\" \"%s/%s/time_estimate?duration=%sd\"\n";
}


# For every time greater than zero.
$2>0 {
    split($1, IP, "/");
    printf(TMPL, TOKEN, ENDPOINT, IP[9], $2);
}

END {}
