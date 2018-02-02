IFS=$'\n'
link=$1
if [ $# -ne 1 ]
then
echo Enter link from manganelo.com
read link
fi
di=$(echo $link | cut -d "/" -f5)
echo di $di
if [[ "${PWD##*/}" != "$di" ]]
then
	#echo hmmm
	q=1
else
	for i in $(ls -1 | grep 'html' )
	do	
	#echo ${i::-5}
	if [ ! -d ${i::-5} ]
	then
	mkdir ${i::-5}
	fi	
	cat $i | grep "<img src" | cut -d "\"" -f2 > ${i::-5}/imglist.txt
	cd ${i::-5}
	echo ${i::-5}
	cat ../$i | grep "<img src" | cut -d "\"" -f1,2 --complement > .list.txt
	pw=$(pwd)"/"
	cp ../$i ./
	for l in $(cat imglist.txt)
	do
	wget -c -q --show-progress $l
	f=$(echo $l | rev | cut -d "/" -f1 | rev)
	im=$pw$f
	echo $im >> impath.txt
	echo $f >> imname.txt
	done
	paste -d \" impath.txt .list.txt > res.txt
	cat $i | grep "<img src" | cut -d "\"" -f1 > .l2.txt
	paste -d \" .l2.txt res.txt > f.html
	cat $i | grep -v '<img src' | sed '/^$/d' |  head -n -3 > t.html
	cat t.html f.html > $i
	echo '</div>' >> $i
	echo '</body>' >> $i
	echo '</html>' >> $i
	#cp $i ../
	cd ..
	done
fi
#for i in $(cat chlist.txt)
#do
#cd $di
#wget -q --show-progress $i
#cd ..
#k=$(echo $i | cut -d "/" -f6)
#j="$di/$k"
#echo '<html>' > $j.html
#echo '<body>' >> $j.html
#echo "<select id=\"c_chapter\" onchange=\"Changes('c_chapter');\" style=\"400px\">" >> $j.html
#cat $j | grep '<option value="' | grep 'chapter' | sort | uniq | tr "\"" "\t" | sort -k3 -n -r | tr "\t" "\"" >> $j.html
#echo '</select>' >> $j.html
#echo '<script>
#function Changes(idcontrol){
#            var myselect = document.getElementById(idcontrol);
#            var chapter_id = myselect.options[myselect.selectedIndex].value;
#            var url = "chapter_1";
 #           window.location = url.substring(0,url.length - 1) + chapter_id + ".html" ;
 #           }
#</script>
#' >> $j.html
#echo '<div>' >> $j.html
#cat $j | grep -E '<img src="' | grep -E "chapter" | sed 's/>/>\n/g' >> $j.html
#echo '</body>' >> $j.html
#echo '</html>' >> $j.html
#rm $di/$k
#done
