IFS=$'\n'
for i in $(ls -1 -v | grep -E 'png$|jpg$|jpeg$')
do
typ=$(file $i | cut -d ":" -f2 | cut -d "," -f1 | cut -d " " -f2)
if [[ $typ == "JPEG" ]]
then
	n=$(echo $i | rev | cut -d '.' -f2- | rev)
	#echo jpg
	t=$(echo $i | rev | cut -d '.' -f1 | rev)
	if [[ $t != "jng" ]]
	then
	echo mv $i $n.jpg
	fi
fi
if [[ $typ == "PNG" ]]
then
	n=$(echo $i | rev | cut -d '.' -f2- | rev)
	#echo png
	t=$(echo $i | rev | cut -d '.' -f1 | rev)
	if [[ $t != "png" ]]
	then
	echo mv $i $n.png
	fi
fi
done
