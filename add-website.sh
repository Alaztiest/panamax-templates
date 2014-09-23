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

if [ ! -d "gitcaches/startupbooster.reference" ]; then
  git clone --mirror https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/startup-booster.git gitcaches/startupbooster.reference
fi

git clone --reference gitcaches/startupbooster.reference https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/startup-booster.git $1
cd $1
git remote add sync-custom https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/tayloredtechnology/$2.git