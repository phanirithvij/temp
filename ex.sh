IFS=$'\n'
echo "IFS=$'\n'" > ex2.sh
cat .tmp.txt >> ex2.sh
chmod 777 ex2.sh
./ex2.sh > output.txt
if [ -f gitauto.sh  ]
then
chmod 777 gitauto.sh
./gitauto.sh
fi
