# Gitlab Utils

## Requirements:

- curl
- awk
- [jq](https://github.com/stedolan/jq)
- bash
- .env file

We require an `.env` file where you need to fill with the `HOST` and `TOKEN` fields
in order to provide access to gitlab api.

The content of the `.env` file should look like this:
```
TOKEN=asfasdf-dfdfs
HOST=gitlab.com
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

Note: For Windows Git Bash users, for the alias to be effective you will have to launch the script with `. <script>` instead of `bash <script>`.

It should work with the [latter](https://stackoverflow.com/questions/415403/whats-the-difference-between-bashrc-bash-profile-and-environment/415444#415444), but for some reason the alias is lost. 

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
