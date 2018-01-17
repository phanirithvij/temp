daa=$(date '+%A %W %Y %X')
git init
git pull
git add output.txt
git commit -m "$daa Success"
git push
