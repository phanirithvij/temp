link=$1
wget -O ch.html -q $link
cat ch.html | grep chapter | grep '<a href' | cut -d "\"" -f2 | grep -v 'spoilers' | grep -v '<' | uniq > chapterlinks.txt
