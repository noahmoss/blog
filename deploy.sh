#!/bin/sh
# Source: https://gohugo.io/hosting-and-deployment/hosting-on-github/

# If a command fails then the deploy stops
set -e

printf "\033[0;32mPushing source updates to GitHub...\033[0m\n"

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git add .
git commit -m "$msg"
git push origin master

# Build the project.
hugo -t hugo-theme-codex # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
printf "\033[0;32mDeploying build to GitHub...\033[0m\n"
git commit -m "$msg"

# Push source and build repos.
git push origin master

cd -
