#!/bin/sh
# Source: https://gohugo.io/hosting-and-deployment/hosting-on-github/

# If a command fails then the deploy stops
set -e

hugo -t hugo-theme-codex # if using a theme, replace with `hugo -t <YOURTHEME>`

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

cd public
git add .
printf "\033[0;32mDeploying build to GitHub...\033[0m\n"
git commit -m "$msg"
git push origin master

cd -
git add .
printf "\033[0;32mPushing source updates to GitHub...\033[0m\n"
git commit -m "$msg"
git push origin master
