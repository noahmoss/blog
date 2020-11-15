#!/bin/sh
# Original source: https://gohugo.io/hosting-and-deployment/hosting-on-github/

# If a command fails then the deploy stops
set -e

cd ~/blog

printf "\033[0;32mRebuilding site\033[0m\n"
hugo -t hugo-theme-codex # if using a theme, replace with `hugo -t <YOURTHEME>`

commit_msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	commit_msg="$*"
fi

cd public
git add .
printf "\033[0;32mDeploying build to GitHub...\033[0m\n"
git commit -m "$commit_msg"
git push origin master

cd -
git add .
printf "\033[0;32mPushing source updates to GitHub...\033[0m\n"
git commit -m "$commit_msg"
git push origin master
