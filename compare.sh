#! /bin/bash
while read p; do
	cat words.txt | grep $p > intermediate/$p.txt
	for f in intermediate/*.txt; do
		while read q; do
			size=${#q}
			second=` expr $size - 2 `
#			echo $size $q $second $p
#			echo ` expr "$q" : "$p" `
			third=` expr "$q" : "$p" `
			if [ $second == $third ]; then
				echo $q >> build/$p.txt
				echo $size $q $second "==" $third $p
			fi
#			echo ${q:$second:$p} #>> build/$p.txt
		done <$f
	done
done <cctld.txt