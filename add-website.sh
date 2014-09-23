#!/bin/bash

if [ ! -d "gitcaches/startupbooster.reference" ]; then
  git clone --mirror https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/startup-booster.git gitcaches/startupbooster.reference
fi

git clone git clone --reference gitcaches/startupbooster.reference https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/NURVING/startup-booster.git $1
cd $1
git remote add sync-custom https://TT-API:2ppROmtPfA5mKKFUagA7XGut@bitbucket.org/tayloredtechnology/$1.git