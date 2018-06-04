#!/usr/bin/env bash

# Prettier-Eslint Pre-Commit Hook
# This script runs prettier-eslint on files staged for commit.
#
# To run this pre-commit hook locally make sure you have `eslint` and
# `prettier-eslint-cli` installed.
# If not, run `npm i` to update dependencies.
#
# Setup:
# 1. copy this file into .git/hooks/pre-commit:
# `cp path/to/script/git_hooks/pre-commit .git/hooks/pre-commit`
# 2. then grant executable permission to the git hook:
# `chmod +x .git/hooks/pre-commit`
#
# Continue working normally and .js & .jsx files will be prettified in each commit.

# TODO: Refactor this file using overcommit: https://github.com/brigade/overcommit

# get all .js files from the commit
jsfiles_string=$(git diff --name-only --diff-filter=ACM | grep '\.jsx\|\.js\?$' | tr '\n' ' ')
# return if there are no .js files in this commit
[ -z "$jsfiles_string" ] && exit 0

# Make an array of javascript files, by splitting on space.
IFS=' ' read -r -a jsfiles <<< "$jsfiles_string"

# check that eslint is available
if ! type node_modules/.bin/eslint >/dev/null 2>&1;
then
  echo >&2 "eslint was not found. Please run 'npm i' and try again."
  exit 1;
fi

# check that prettier-eslint is available
# prettier-eslint-cli is the package required to make prettier-eslint available in the cli
if ! type node_modules/.bin/prettier-eslint >/dev/null 2>&1;
then
  echo >&2 "prettier-eslint-cli was not found. Please run 'npm i' and try again."
  exit 1;
fi

# run npm script that runs prettier-eslint
STRING=$(npm run prettier "${jsfiles[@]@Q}")

# print out the success or failure of prettier-eslint as it formats the files
echo "$STRING"

# make sure the modified files are still in the commit, to get the changes from prettier
git add "${jsfiles[@]@Q}"
