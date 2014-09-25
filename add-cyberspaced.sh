#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Argument 1: directory to clone into"
    echo "Argument 2: tayloredtechnology/$2.git custom git repository"
    exit 1
fi

if [ $# -eq 1 ]; then
    echo "Argument 2: tayloredtechnology/$2.git custom git repository has not been specified"
    echo "No Custom Repistory Specified"
    echo ""
fi

# Trim '/' if attached to the first argument
inst_location="${1//\/}"

# Ensure Cache is up to date
cd gitcaches/cyberspaced.reference
git fetch 
cd ../..

if [ ! -d "gitcaches/cyberspaced.reference" ]; then
  git clone --mirror https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/cyberspaced.git gitcaches/cyberspaced.reference
fi

if [ ! -e "$inst_location/resync-plugins-themes.sh" ]; then
    rm -rf $inst_location
    git clone --reference gitcaches/startupbooster.reference https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/startup-booster.git $inst_location
    if [ $# -eq 2 ]; then
        cd $inst_location
        git remote add sync-custom https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/tayloredtechnology/$2.git
    fi
else
    echo "Directory already cloned, run update or purge and try again"
fi