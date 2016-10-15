#!/bin/bash

PREVIOUS=0.2.1
UPCOMING=0.3.0-rc1
MESSAGE="Tagging $UPCOMING: demo3 testing version"


# Usage:
# 0. Update the variables above!
# 1. Checkout the commit to be tagged in all repositories.
# 2. Run `git submodule foreach $PWD/tag.sh`
# 3

OLD=$(git tag -l | grep $PREVIOUS) && {
    NEW=$(echo $OLD | perl -pe "s/$PREVIOUS/$UPCOMING/")
} || {
    # Most repositories will use the IDR- prefix
    NEW=IDR-$UPCOMING
}
git tag -s -m "$MESSAGE" $NEW
git push origin $NEW
