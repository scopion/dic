
cat unixfile | grep \? >>payload
cat unixfile | grep -v \? >> nopayload
rm unixfile 
cat nopayload | grep -v / >>filename
cat nopayload |awk -F '/' '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}'|tr -s ' ' '\n' >> 1dir
rm nopayload 
cat 1dir |grep '^.*\.' >> filename
cat 1dir |grep -v '^.*\.' >> firstdir
sort -k2n 1dir | uniq >> firstdir
rm 1dir
cat firstdir | grep  upload >> upload
cat firstdir | grep  -v upload >> noupload
rm firstdir 
cat noupload | grep edit >> editor
cat noupload | grep -v edit >> noeditor
rm noupload 
cat noeditor | grep   admin >> admin
cat noeditor | grep  -v  admin >> noadmin
rm noeditor
cat noadmin | grep   conf >> conf
cat noadmin | grep  -v conf >> noconf
rm noadmin
cat noconf | grep  upfile >> upload
cat noconf | grep -v upfile >> noupload
rm noconf 
cat noupload | grep manage >> admin
cat noupload | grep -v manage >> lastdir
rm noupload
