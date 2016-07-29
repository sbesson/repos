# repos
A super-module of all the repositories in use

## Setup

For all repositories, you will want to add an "upstream" remote which
contains the the source branch that you are looking to release. Where
upstream and origin are the same, you'll likely want *both*.

## Release steps

### Checkout the associated branches

    git submodule foreach git fetch upstream
    cd openmicroscopy/
    git checkout upstream/metadata52
    # etc for all repos
    git commit -a -m "Tagging 0.0.6: staging version"

### Tag and push all subcomponents

    git submodule foreach 'if [ "/opt/idr-repos/idr-metadata" != "$(pwd)" ]; then git tag -s -m "Tag 0.0.6 - mid-summer version" IDR-0.0.6; fi'
    git submodule foreach 'if [ "/opt/idr-repos/idr-metadata" != "$(pwd)" ]; then git  push origin IDR-0.0.6; fi'

    cd idr-metadata/
    git tag -s -m "Tag 0.0.6 - mid-summer version" 0.0.6
    git push origin 0.0.6

### Tag an push the super repository

    cd ..
    git tag -s -m "Tag 0.0.6 - mid-summer version" 0.0.6
    git push origin 0.0.6
