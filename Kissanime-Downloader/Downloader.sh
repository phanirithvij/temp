#THANKS TO https://github.com/ceesvanegmond

echo "SCRIPT BY ANIMEBRO1"
FOLDER="$(pwd)" #Change this if you want to
#For example if you make it /User/photonmaster/Downloads
#The downloads will be stored there

if [ ! -d ${FOLDER} ]; then
  mkdir -p ${FOLDER};
fi

if [ ! -f ${FOLDER}/list.txt ]; then
    echo "Please copy the list.txt to this folder"
    exit
fi

while read p; do
  NAME=${p##*[}
  URL=${p%[*}

  curl -L -k -e "auto;" -b cookies.txt -c cookies.txt -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36" -o ${FOLDER}/${NAME} {$URL}
done <${FOLDER}/list.txt
