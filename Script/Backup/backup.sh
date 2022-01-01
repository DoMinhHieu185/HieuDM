#!/bin/bash
passroot="Admin@123"
userdb="root"
dbname="sinhvien"
/opt/rh/rh-mariadb103/root/usr/bin/mysqldump -u $userdb -p$passroot $dbname --single-transaction --quick --lock-tables=false > /home/mariadb_backup/backup-$(date +%F).sql

