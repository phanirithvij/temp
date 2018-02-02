daa=$(date '+%A %W %Y %X')
ho=$(hostname)
git init
git pull
git add output.txt
git commit -m "$daa $ho"
git push
