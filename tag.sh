#!/bin/bash

PREVIOUS=0.3.0-rc1
UPCOMING=0.3.0
MESSAGE="Tagging $UPCOMING: demo3 testing version"


# Usage:
# 0. Update the variables above!
# 1. Checkout the commit to be tagged in all repositories.
# 2. Run `git submodule foreach $PWD/tag.sh`
# 3

git remote get-url origin | grep idr-metadata && {
  # No prefix for idr-metadata
  OLD=$PREVIOUS
  NEW=$UPCOMING
} || {
  OLD=IDR-$PREVIOUS
  NEW=IDR-$UPCOMING
}

git rev-parse "$NEW" >/dev/null 2>&1 && {
  echo $NEW exists
} || {
  echo Creating $NEW
  git tag -s -m "$MESSAGE" $NEW
  git push origin $NEW
}
