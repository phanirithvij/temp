IFS=$'\n'
link=$1
if [ $# -ne 1 ]
then
echo Enter link from manganelo.com
read link
fi
wget -q $link -O ch.html
cat ch.html | grep -E '<span><a' | cut -d "\"" -f2 > chlist.txt
di=$(echo $link | cut -d "/" -f5) 
mkdir $di
cp imgget.sh cp.sh $di/
for i in $(cat chlist.txt)
do
cd $di
wget -q --show-progress $i
cd ..
k=$(echo $i | cut -d "/" -f6)
j="$di/$k"
echo '<html>' > $j.html
echo '<body>' >> $j.html
echo "<select id=\"c_chapter\" onchange=\"Changes('c_chapter');\" style=\"400px\">" >> $j.html
cat $j | grep '<option value="' | grep 'chapter' | sort | uniq | tr "\"" "\t" | sort -k3 -n -r | tr "\t" "\"" >> $j.html
echo '</select>' >> $j.html
echo '<script>
function Changes(idcontrol){
            var myselect = document.getElementById(idcontrol);
            var chapter_id = myselect.options[myselect.selectedIndex].value;
            var url = "chapter_1";
            window.location = url.substring(0,url.length - 1) + chapter_id + ".html" ;
            }
</script>
' >> $j.html
echo '<div>' >> $j.html
cat $j | grep -E '<img src="' | grep -E "chapter" | sed 's/>/>\n/g' >> $j.html
echo '</body>' >> $j.html
echo '</html>' >> $j.html
rm $di/$k
done
