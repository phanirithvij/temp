file=$1
uri=$2
if test -e "$file"
then zflag="-z '$file'"
else zflag=
fi
curl -o "$file" $zflag "$uri"
