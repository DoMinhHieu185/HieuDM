#!/bin/bash
passroot="Admin@123"
userdb="root"
dbname="wordpress"
token=5094261714:AAEeGzcFh4biDdQqHHaXrWCTHJXoEPN15_I
ID=-646313268
url=https://api.telegram.org/bot${token}/sendMessage
noidung="Backup success"
mysqldump -u $userdb -p$passroot $dbname --single-transaction --quick --lock-tables=false > /home/backup-$(date +%F).sql
curl -d chat_id=$ID -d text="$noidung" $url > /dev/null 2>&1
