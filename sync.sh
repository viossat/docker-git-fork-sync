#!/bin/sh

git pull --all
for branch in `git branch -r | grep ' *upstream/' | sed 's/^[^\/]*\///g'` ; do git branch --track $branch upstream/$branch 2> /dev/null ; done
git push --all
git push --tags
