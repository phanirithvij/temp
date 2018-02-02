#PWD is inside tokyoghoulre
IFS=$'\n'
pw=$(pwd)
#if [[ "$pw" == "" ]]
#then
for i in $(ls -v -1)
do
	if [ -d $i ]
	then
	echo $i
	cd $i
	cp ../../conv.sh ./
	echo '' > order.txt
	sed -e "s/^M//" imagelinks.txt > newt.txt
	mv newt.txt imagelinks.txt
	for j in $(cat imagelinks.txt)
	do
		#echo $j
		wget -q --show-progress $j
		ord=$(echo $j | rev | cut -d "/" -f1 | rev)
		echo $ord >> order.txt
	done	
	for j in $(ls *%0D*)
	do
		n=$(echo $j | cut -d "%" -f1)
		mv $j $n
	done
	for j in $(ls *.png.* *.jpg.* *.jpeg.* )
	do
		n=$(echo $j| rev | cut -d "." -f2- | rev)
		mv $j $n
	done
	for j in $(ls -1 -v)
        do
                chmod 777 *.sh
                ./conv.sh $j
        done
	cd ..
	fi
done
#fi
