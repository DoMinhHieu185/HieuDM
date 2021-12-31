#!/bin/bash
passroot="Admin@123"
/opt/rh/rh-mariadb103/root/usr/bin/mysqldump -u root -p$passroot sinhvien --single-transaction --quick --lock-tables=false > /home/mariadb_backup/backup-$(date +%F).sql

