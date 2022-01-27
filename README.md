# Gitlab's Utils

## Requirements:

- curl
- jq
- bash
- awk (only for uploading times)
- [bashly](https://github.com/DannyBen/bashly) (for development)

Also requires the following variables, (example of `bashrc`):

```bash
export GITLAB_HOST=gitlab.com
export GITLAB_TOKEN=asfasdf-dfdfs
```

# Usage


```bash
./gutils
```


# Development


After update any script in `src` requires execute the following command:

```bash
bashly gen
```
