for d in `find . -type f -name 'sync-remote.sh' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
	echo $d
	cd $d
	if [ ! -f ./synched.wordpress ]; then
		git clean -df
		./sync-remote.sh
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
		git fetch --depth 1 wordpress $1-branch:synchedwordpress
		git fetch --depth 1 upstream master:synchedupstream
		git merge -q -X theirs -m "synchedupstream" synchedupstream
		git merge -q -X theirs -m "synchedwordpress" synchedwordpress
		touch synched.wordpress
		#remote wordpress sync to differentiate the custom from original
		rm -rf sync-wordpress.sh
		cd ..
done

for d in `find . -type f -name 'sync-wordpress.sh' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
	echo $d
	cd $d
	if [ ! -f $d/synched.wordpress ]; then
		git clean -df
		./sync-wordpress.sh
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
		git fetch --depth 1 wordpress $1-branch:synchedwordpress
		git merge -q -X theirs -m "synchedupstream" synchedwordpress
		touch synched.wordpress
		cd ..
done