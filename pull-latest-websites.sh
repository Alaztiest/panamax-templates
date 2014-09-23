#!/bin/bash

for d in `find . -type f -name 'sync.wordpress' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
	echo $d
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
		touch synched.wordpress
		cd ..
done

for d in `find . -type f -name 'sync-custom.sh' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
	echo $d
	cd $d
	if [ ! -f $d/synched-custom.wordpress ]; then
		git clean -df
		touch g2g.wordpress
	fi
		git fetch --depth 1 sync-custom master:synchedcustom
		git merge -q -X theirs -m "synchedcustom" synchedcustom
		./sync-custom.sh
		touch synched-custom.wordpress
		cd ..
done