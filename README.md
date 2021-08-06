# Gitlab Utils

## Requirements:

- curl
- jq
- bash
- awk (only for `votes2gitlab`)

Also requires the following variables:

```
GITLAB_HOST=gitlab.com
GITLAB_TOKEN=asfasdf-dfdfs
```

You can define them writing it in a `.env` file or using `export` in your `bashrc`.

Example of `.env` file:

```
GITLAB_HOST=gitlab.com
GITLAB_TOKEN=asfasdf-dfdfs
```

Example of `bashrc`:

```
export GITLAB_HOST=gitlab.com
export GITLAB_TOKEN=asfasdf-dfdfs
```

# Usage

## Given a url and an estimation post to gitlab.

This requires a `votes.txt` file with url and estimates.

```bash
./votes2gitlab.sh ./votes.txt
```

## Given a issue id or a list of id's download their contents.

The issues will be located in `downloads` folder as markdown files.

```bash
./downloadIssues.sh 328 39
```

## Given a milestone prints out all issues and their time estimation.

```bash
./getMilestone.sh "sprint:39"
```

## Given a group prints out all projects

> For the moment only works with the group-id.

```bash
./getPorjectsByGroup.sh 253
```
