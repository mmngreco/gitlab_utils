# Gitlab's Utils

## Requirements:

- curl
- awk
- [jq](https://github.com/stedolan/jq)
- bash
- awk (only for uploading times)
- [bashly](https://github.com/DannyBen/bashly) (for development)


We require the following variables, in order to provide access to gitlab api.
Example of `bashrc`:
```bash
export GITLAB_HOST=gitlab.com
export GITLAB_TOKEN=asfasdf-dfdfs
```

More information on GitLab tokens can be found [here](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html).

### Using Windows Git Bash with Non-Administrative Permission

If you cannot install the requirements due to permission restrictions,
you can follow these steps as a workaround.

* Download the `jq` Windows executable from `https://github.com/stedolan/jq/releases`.
* Store it somewhere in your computer and create a bash alias in the `.bashrc` or `.bash_profile` files, e.g.:
    ```bash
    alias jq='path/to/executable/jq-win64.exe'
    ```

# Usage

<<<<<<< HEAD
Note: For Windows Git Bash users, 
for the alias to be effective you will have to launch 
the script with `. <script>` instead of `bash <script>`.

It should work with the 
[latter](https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment/415444#415444), 
but for some reason the alias is lost. 

## Given url and estimate post to gitlab.

This requires a `votes.txt` file with url and estimates.

```bash
./gutils
```

# Development


After update any script in `src` requires execute the following command:

```bash
bashly gen
```
