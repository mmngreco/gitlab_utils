# Gitlab Utils

## Requirements:

- curl
- awk
- jq
- bash
- .env file

Also requires a `.env` file where you need to fill with the HOST and TOKEN
in order to provide access to gitlab api.

The content of `.env` file, looks like the following:

```
TOKEN=asfasdf-dfdfs
HOST=gitlab.com
```

# Usage

## Given url and estimate post to gitlab.

This requires a `votes.txt` file with url and estimates.

```bash
bash votes2gitlab.sh ./votes.txt
```

## Given a issue id or a list of id's download their contents.

The issues will be located in `downloads` folder as markdown files.

```bash
bash downloadIssues.sh 328 39
```

## Given a milestone prints all issues and their time.

```bash
bash getIssues.sh "sprint:39"
```
