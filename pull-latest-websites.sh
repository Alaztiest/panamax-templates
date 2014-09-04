for d in `find . -type f -name 'g2g.wordpress' |sed 's#\(.*\)/.*#\1#' |sort -u`
do
    ( echo $d && cd $d && git pull )
done
