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
cd gitcaches/startupbooster.reference
git fetch 
cd ../..

if [ ! -d "gitcaches/startupbooster.reference" ]; then
  git clone --mirror https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/startup-booster.git gitcaches/startupbooster.reference
fi

if [ ! -e "$inst_location/resync-plugins-themes.sh" ]; then
	rm -rf $inst_location
	git clone --reference gitcaches/startupbooster.reference https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/startup-booster.git $inst_location
    cd $inst_location
    git branch synched
    git checkout synched
    touch synched.wordpress
    if [ $# -eq 2 ]; then
        git remote add sync-custom https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/tayloredtechnology/$2.git
        git fetch --depth 1 sync-custom master:synchedcustom
        git merge -q -X theirs -m "synchedcustom" synchedcustom
        ./sync-custom.sh
    fi
    cd ..
else
    echo "Directory already cloned, run update or purge and try again"
fi