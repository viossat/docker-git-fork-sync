#!/bin/sh

git pull --all | grep -Fxv -e 'Already up-to-date.' -e 'Fetching origin' -e 'Fetching upstream'
for branch in `git branch -r | grep ' *upstream/' | sed 's/^[^\/]*\///g'` ; do git branch --quiet --set-upstream-to=upstream/$branch $branch 2> /dev/null ; done
git push --all origin 2>&1 | grep -Fxv 'Everything up-to-date'
git push --tags origin 2>&1 | grep -Fxv 'Everything up-to-date'
