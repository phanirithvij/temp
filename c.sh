g=0
if [ ! -f README.md ]
then
	wget -q -N https://raw.githubusercontent.com/phanirithvij/temp/master/README.md
fi
	mv README.md Rold.md
while [ $g -gt -2 ]
do
	wget -q -N https://raw.githubusercontent.com/phanirithvij/temp/master/README.md
	mv README.md Rnew.md
	sa=$(diff Rold.md Rnew.md)
	if [[ $sa != "" ]]
	then
		echo ENTER y/n
	#	op='y'
		read op
		if [[ "$op" == "y" ]]
		then
		./ex.sh	
	fi
		if [[ "$op" == "n" ]]
		then
			echo HMMMMM
		fi
		break
	else
	./cat.sh	
	fi
done	

