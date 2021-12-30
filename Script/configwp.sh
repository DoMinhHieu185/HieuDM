#!/bin/bash
cat /etc/os-release* |grep 'centos' > /dev/null 2>&1 && OS='CentOS' 
echo $OS
Install_LAMP(){
    yum install -y httpd epel-release php php-mbstring php-pear mariadb-server
    systemctl start httpd
    systemctl enable httpd
    systemctl start mariadb
    systemctl enable mariadb
}
config_wp(){
    yum --enablerepo=epel install wordpress -y
    sed -i -e "s/database_name_here/"$databasename"/g; s/username_here/"$username"/g; s/password_here/"$userpassword"/g; s/localhost/$host/g  " /etc/wordpress/wp-config.php
    sed -i -e '/\[mysqld\]/a character-set-server=utf8' /etc/my.cnf
    sed -i -e'/\<IfModule mod_authz_core.c\>/a Require all granted' /etc/httpd/conf.d/wordpress.conf
    systemctl restart httpd
}
install_mariadb(){
    echo -e "\ny\n$mysqlRootPass\n$mysqlRootPass\ny\ny\ny\ny\ny\n" |mysql_secure_installation --stdin
    mysql -u root -p$mysqlRootPass<<EOF 
    CREATE DATABASE $databasename;
    CREATE USER $username@$host IDENTIFIED BY '$userpassword';
    GRANT ALL PRIVILEGES ON $databasename.* TO $username@$host IDENTIFIED BY '$userpassword';
    FLUSH PRIVILEGES;
    exit
EOF
}
if [ "$OS"="CentOS" ]
then
        
    read -p "Nhap mat khau cho mysqlroot: " mysqlRootPass
    read -p "Nhap ten cho Database: " databasename
    read -p "Nhap Database username: " username
    read -p "Nhap Database password username: " userpassword
    read -p "Nhap MatiaDB host: (Enter for localhost):" host

    if [ "$host" = "" ]
    then 
    host="localhost"
    fi
    set -e
    Install_LAMP
    config_wp
    install_mariadb
    systemctl stop firewalld
    setenforce 0 
    systemctl restart httpd
fi
