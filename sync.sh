#!/bin/sh

git pull --all
for branch in `git branch -r | grep ' *upstream/' | sed 's/^[^\/]*\///g'` ; do git branch --quiet --set-upstream-to=upstream/$branch $branch 2> /dev/null ; done
git push --all origin
git push --tags origin
