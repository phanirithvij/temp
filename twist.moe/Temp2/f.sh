echo new process
if [ ! -f ex.sh ]
then
echo 'IFS=$"\n"
echo "#start" > output.txt
for i in $(cat .tmp.txt)
do
echo $i > ex2.sh
chmod +x ex2.sh
echo $i >> output.txt
./ex2.sh >> output.txt
echo " " >> output.txt
done
if [ -f gitauto.sh  ]
then
echo "#Git sucessful" >> output.txt
chmod 777 gitauto.sh
./gitauto.sh
fi
' > ex.sh
chmod +x ex.sh
fi
g=0
if [ ! -f Rhtold.md ]
then
if [ ! -f README.md ]
then
	wget -q https://github.com/phanirithvij/Temp2/blob/master/README.md
fi
mv README.md Rhtold.md
fi
st=$(cat Rhtold.md | egrep -n '<art' | cut -d ":" -f1)
en=$(cat Rhtold.md | egrep -n '</art' | cut -d ":" -f1)
cat Rhtold.md | head -$((en-1)) | tail -$((en-st)) > /tmp/old.txt
while [ $g -gt -2 ]
do 
    if [ -f README.md ]
    then
    rm README.md
    fi
	wget -q https://github.com/phanirithvij/Temp2/blob/master/README.md
    if [ -f README.md ]
    then
	mv README.md Rhtnew.md
    fi
	st=$(cat Rhtnew.md | egrep -n '<art' | cut -d ":" -f1)
	en=$(cat Rhtnew.md | egrep -n '</art' | cut -d ":" -f1)
	cat Rhtnew.md | head -$((en-1)) | tail -$((en-st)) > /tmp/latest.txt
	sa=$(diff /tmp/latest.txt /tmp/old.txt)
	if [[ $sa != "" ]]
	then
	echo FILE HAS BEEN CHANGED
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
   	cp /tmp/latest.txt /tmp/old.txt
	#fir=$(cat /tmp/latest.txt | grep '<artic' | cut -d ">" -f3)
	#las=$(cat /tmp/latest.txt | grep '</p>' | cut -d "<" -f1)
	#echo $fir > .tmp.txt
	#cat Rhtnew.md | head -$((en-3)) | tail -$((en-st-3)) >> .tmp.txt
	#echo $las >> .tmp.txt
	cat /tmp/latest.txt | sed -e 's/<[^>]*>//g' > .tmp.txt 
	chmod +x ex.sh
	source ./ex.sh
	#	fi
    break
	else
		#echo No change
		g=$((g+1))
	fi
done	
source ./f.sh
