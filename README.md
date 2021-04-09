# Gitlab Utils

## Requirements:

- curl
- awk
- jq
- bash
- .env file

Also requires a `.env` file where you need to fill with the HOST and TOKEN
in order to provide access to gitlab api.

Example of `.env` file:

```
TOKEN=asfasdf-dfdfs
HOST=gitlab.com
```

# Usage

## Given a url and an estimation post to gitlab.

This requires a `votes.txt` file with url and estimates.

```bash
bash votes2gitlab.sh ./votes.txt
```

## Given a issue id or a list of id's download their contents.

The issues will be located in `downloads` folder as markdown files.

```bash
bash downloadIssues.sh 328 39
```

## Given a milestone prints out all issues and their time estimation.

```bash
bash getMilestone.sh "sprint:39"
```

## Given a group prints out all projects

```bash
bash getPorjectsByGroup.sh
```
