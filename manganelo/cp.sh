IFS=$'\n'
for i in $(ls -1 | grep 'html')
do
	if [ -d ${i::-5} ]
	then
		cp ${i::-5}/$i ./ 
	fi
	
done
