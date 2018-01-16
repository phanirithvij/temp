if [ ! -f ex.sh ]
then
echo '
cat .tmp.txt > ex2.sh
chmod 777 ex2.sh
./ex2.sh > output.txt
if [ -f gitauto.sh  ]
then
	chmod 777 gitauto.sh
	./gitauto.sh
fi' > ex.sh
echmod +x ex.sh
fi
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
	cp Rhtnew.md Rhtold.md
	echo HMMM
	fir=$(cat /tmp/latest.txt | grep '<artic' | cut -d ">" -f3)
	las=$(cat /tmp/latest.txt | grep '</p>' | cut -d "<" -f1)
	echo $fir > .tmp.txt
	cat Rhtnew.md | head -$((en-3)) | tail -$((en-st-3)) >> .tmp.txt
	echo $las >> .tmp.txt
	chmod +x ex.sh
	./ex.sh
	#	fi
		break
	else
		#echo No change
		g=$((g+1))
	fi
done	

