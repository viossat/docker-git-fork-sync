# viossat/git-fork-sync

Simple tool to keep a Git repository synchronized with its upstream.

- Alpine-based, 24.8 MB
- Synchronizes all branches and tags
- Uses Cron, no webhook, no API
- SSH ready
- Environment variables
  - `FORK`: fork URL
  - `UPSTREAM`: upstream URL
  - `CRON`: Cron expression which launchs the synchronization, `* * * * *` by default

## Usage

Remote SSH fork on GitHub:
```bash
docker run -d -e UPSTREAM=git@github.com:rails/rails.git -e FORK=git@github.com:your_username/rails.git -v /path/ssh/private_key_rsa:/ssh/id_rsa viossat/git-fork-sync
```

Local fork of an HTTPS remote repo:
```bash
docker run -d -e UPSTREAM=https://gitlab.com/gitlab-org/gitlab-ce.git -e FORK=/fork -v /path/local/fork:/fork viossat/git-fork-sync
```
