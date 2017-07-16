#!/bin/sh
set -u

cp -f /ssh/id_rsa /root/.ssh/id_rsa 2> /dev/null
chmod 600 /root/.ssh/id_rsa 2> /dev/null
echo "$CRON /sync.sh" > /etc/crontabs/root

if [ ! "$(ls -A $REPO)" ]; then
  git clone $FORK $REPO
  git remote add upstream $UPSTREAM
fi

/sync.sh

git show-ref refs/heads/master
rc=$?
if [[ $rc != 0 ]]
then
  git update-ref refs/heads/master upstream/master
fi

exec "$@"
