g=0
cp README.md README.md.bak
curl https://raw.githubusercontent.com/phanirithvij/temp/master/README.md > README.md
while [ $g -gt -2 ]
do
	sizol=$(ls -l README.md | awk '{print $5}')
	curl https://raw.githubusercontent.com/phanirithvij/temp/master/README.md > README.md
	sizne=$(ls -l README.md | awk '{print $5}')
	if [ $sizol -eq $sizne ]
	then 
	#	echo No change
		g+=1
	else
		echo hmmmm
	fi
	sleep 4
done	
