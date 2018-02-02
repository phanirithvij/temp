#LINKS LIKE http://ww1.readshokugeki.com/
link=$1
if [ $# -ne 1 ]
then
	echo enter link from animecruzers readmangasection
	read link
fi
./chapters.sh $link
di=$(echo $link | cut -d '.' -f2) 
if [ ! -d $di ]
then
	echo Creating $di
	mkdir $di
fi
echo Fetching Info ...
cp wget.sh $di/
cd $di
IFS=$'\n'
for i in $(cat ../chapterlinks.txt)
do
	tdi=$(echo $i | cut -d "/" -f5)
	if [ ! -d $tdi ]
       	then 
	mkdir $tdi
	fi
	wget -O $tdi/$tdi.html $i
	cat $tdi/$tdi.html | grep '<img class=' | cut -d "\"" -f4 > $tdi/imagelinks.txt
	cd $tdi
	sed -e "s/^M//" imagelinks.txt > tempimg.txt
	mv tempimg.txt imagelinks.txt
	cd ..
done
cd ..
