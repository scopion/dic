#cat unixfile | grep \? >>payload
#cat unixfile | grep -v \? >> nopayload
#rm unixfile 
cat nopayload | grep -v / >>filename
cat nopayload |awk -F '/' '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}'|tr -s ' ' '\n' >> 1dir
rm nopayload 
sort -k2n 1dir | uniq >> 1dir1

cat 1dir1 |grep '^.*\.' >> filename
cat 1dir1 |grep -v '^.*\.' >> firstdir
rm 1dir
rm 1dir1 
cat firstdir | grep  -i upload >> upload
cat firstdir | grep  -v -i upload >> noupload
rm firstdir 
cat noupload | grep -i edit >> editor
cat noupload | grep -v -i edit >> noeditor
rm noupload 

cat noeditor | grep  -i admin >> admin
cat noeditor | grep  -v -i admin >> noadmin
rm noeditor
cat noadmin | grep  -i conf >> conf
cat noadmin | grep  -v -i conf >> noconf
rm noadmin
cat noconf | grep  -i  upfile >> upload
cat noconf | grep -v  -i upfile >> noupload
rm noconf 
cat noupload | grep  -i manage >> admin
cat noupload | grep -v  -i manage >> lastdir
rm noupload

