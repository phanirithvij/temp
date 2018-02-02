IFS=$"\n"
echo "#start" > output.txt
cat .tmp.txt > ex2.sh
chmod +x ex2.sh
echo $i >> output.txt
./ex2.sh >> output.txt
if [ -f gitauto.sh  ]
then
echo "#Git sucessful" >> output.txt
chmod 777 gitauto.sh
./gitauto.sh
fi

