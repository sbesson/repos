#!/bin/bash

PREVIOUS=0.2.0
UPCOMING=0.2.1
MESSAGE="Tagging $UPCOMING: demo2 version"


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
echo git tag -s -m "$MESSAGE" $NEW
echo git push origin $NEW
