#!/bin/bash

# Ensure Cache is up to date
if [ -d "gitcaches/startupbooster.reference" ]; then
	cd gitcaches/startupbooster.reference
else
	cd gitcaches/cyberspaced.reference
fi
git fetch 
cd ../..

for d in `find . -type f -name 'sync.wordpress' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
	echo ""
	echo "--------------------"
	echo $d
	echo "--------------------"
	echo ""
	cd $d
	if [ ! -f ./synched.wordpress ]; then
		git clean -df
		touch g2g.wordpress
	else
		git checkout master
		git reset --hard
		git branch -D synched
		rm -rf synched.wordpress
		git pull
	fi
		git branch synched
		git checkout synched
		
		# Update Custom repo and merge if they exist
		if git remote -v | grep sync-custom; then
			git fetch sync-custom master:synchedcustom
			git merge -q -X theirs -m "synchedcustom" synchedcustom
			./sync-custom.sh
		fi
		touch synched.wordpress
		cd ..
done