#!/bin/bash

# For new repositories from the IDR organization,
# set the upstream to the origin.

git remote get-url upstream ||
    git remote add upstream $(git remote get-url origin)
