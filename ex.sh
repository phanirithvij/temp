IFS=$'\n'
cat Rnew.md > ex2.sh
echo "IFS=$'n'" >> ex2.sh
chmod 777 ex2.sh
./ex2.sh
