g=0
if [ ! -f Rhtold.md ]
then
if [ ! -f README.md ]
then
	wget -q https://github.com/phanirithvij/temp/blob/master/README.md
fi
mv README.md Rhtold.md
fi
st=$(cat Rhtold.md | egrep -n '<art' | cut -d ":" -f1)
en=$(cat Rhtold.md | egrep -n '</art' | cut -d ":" -f1)
cat Rhtold.md | head -$((en-1)) | tail -$((en-st)) > /tmp/old.txt
while [ $g -gt -2 ]
do
	wget -q https://github.com/phanirithvij/temp/blob/master/README.md
	mv README.md Rhtnew.md
	st=$(cat Rhtnew.md | egrep -n '<art' | cut -d ":" -f1)
	en=$(cat Rhtnew.md | egrep -n '</art' | cut -d ":" -f1)
	cat Rhtnew.md | head -$((en-1)) | tail -$((en-st)) > /tmp/latest.txt
	sa=$(diff /tmp/latest.txt /tmp/old.txt)
	if [[ $sa != "" ]]
	then
	#	echo ENTER y/n
	#	op='y'
	#	read op
	#	if [[ "$op" == "y" ]]
	#	then
	#	./ex.sh	
	#	fi
	#	if [[ "$op" == "n" ]]
	#	then
	echo HMMM
	fir=$(cat /tmp/latest.txt | grep '<artic')
	las=$(cat /tmp/latest.txt | grep '</p>')
	#	fi
		break
	else
		#echo No change
		g=$((g+1))
	fi
done	

