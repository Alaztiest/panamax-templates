for d in `find . -type f -name 'g2g.wordpress' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
    ( echo $d && cd $d && git pull )
done
for d in `find . -type f -name 'sync-remote.sh' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
    ( echo $d && cd $d && git fetch upstream && git merge upstream/master )
	echo "merging upstream changes into custom distribution"
done
