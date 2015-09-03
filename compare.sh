#! /bin/bash
rm build -rf
mkdir build
cp words.txt words.work.txt
while read q; do
	while read p; do
		if [ ${q: -2} == $p ]; then
			echo $q >> build/$p.list
			echo $q > list.last
		fi
	done <cctld.txt
done <words.txt