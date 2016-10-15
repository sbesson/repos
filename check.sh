#!/bin/bash

# Require all repos to push to the IDR org
git remote get-url origin | grep -q github.com:idr/
