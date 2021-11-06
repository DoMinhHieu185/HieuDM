# Hướng dẫn cài đặt WordPress trên 2 server
## Mô hình mạng
![](/Linux/image/wp1.png)
## IP Planning
![](/Linux/image/wp2.png)
## Cài đặt
### Trên máy Database
**Bước 1**: Cài đặt MariaDB 5.5
```
[root@localhost ~]# yum install mariadb-server
```
* Cấu hình theo chuẩn utf8
```
[root@localhost ~]# vi /etc/my.cnf
[mysqld]
character-set-server=utf8
```

![](/Linux/image/db1.png)

* Khởi động dịch vụ
```
[root@localhost ~]#  systemctl start mariadb
[root@localhost ~]# systemctl enable mariadb
Created symlink from /etc/systemd/system/multi-user.target.wants/mariadb.service to /usr/lib/systemd/system/mariadb.service.
```
* Xem phiên bản mariadb
```
[root@localhost ~]# mysql -V
mysql  Ver 15.1 Distrib 5.5.68-MariaDB, for Linux (x86_64) using readline 5.1
```

**Bước 2**: Cấu hình secure MariaDB
Câu lệnh sử dụng
```
mysql_secure_installation
```
* Cài đặt password cho tài khoản root MariaDB

![](/Linux/image/setroot.png)

* Remove tài khoản Anonymouns

![](/Linux/image/db2.png)

* Không cho phép đăng nhập root từ xa

![](/Linux/image/db3.png)

* Xóa cơ sở dữ liệu thử nghiệm

![](/Linux/image/db4.png)

* Cập nhập các cấu hình trên vào bảng đặc quyền(privilege tables)

![](/Linux/image/db5.png)

**Bước 3**: Truy cập vào MariaDB
```
mysql -u root -p
```
* Nhập mật khẩu tài khoản ở bước 2

Tạo một cơ sở dữ liệu
```
MariaDB [(none)]> create database wordpress;
Query OK, 1 row affected (0.00 sec)
```

Tạo user và mật khẩu
```
MariaDB [(none)]> create user 'hieu'@'192.168.2.128' identified by 'Admin@123';
Query OK, 0 rows affected (0.00 sec)
```
* 192.168.2.128 : là địa chỉ của của máy Web truy cập MySQL
* hieu : là user để wordpress sử dụng để đăng nhập vào MySQL
* Admin@123 : là mật khẩu của hieu

Tiếp theo, ta set quyền cho user để có quyền truy cập vào cơ sở dữ liệu.
```
MariaDB [(none)]> grant all privileges on wordpress.* to 'hieu'@'%' identified by 'Admin@123';
Query OK, 0 rows affected (0.00 sec)
```
Bây giờ user đã có quyền truy cập vào cơ sở dữ liệu, thực hiện lệnh flush privileges; để MySQL cập nhật thay đổi:
```
MariaDB [(none)]> flush privileges;
Query OK, 0 rows affected (0.00 sec)
```
```
MariaDB [(none)]> exit
Bye
```
Cấu hình tường lửa cho dịch vụ MariaDB
```
[root@localhost ~]# firewall-cmd --add-service=mysql --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```


### Trên máy web server
**Bước 1**: Cài đặt Apache
```
[root@localhost ~]# yum install httpd -y
```
khởi động dịch vụ Apache và cho phép nó khởi động cùng hệ thống
```
[root@localhost ~]# systemctl start httpd
[root@localhost ~]# systemctl enable httpd
Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
```
Xem phiên bản dịch vụ apache
```
[root@localhost ~]# httpd -v
Server version: Apache/2.4.6 (CentOS)
Server built:   Oct 19 2021 13:53:40
```
Cấu hình tường lửa cho dịch vụ apache
```
[root@localhost ~]# firewall-cmd --add-service=http --permanent
success
[root@localhost ~]# firewall-cmd --add-service=https --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```

**Bước 2**: Cài đặt PHP
```
[root@localhost ~]# yum install php php-mbstring php-pear -y
```
Khởi động lại dịch vụ apache
```
[root@localhost ~]# systemctl restart httpd
```
Xem phien bản PHP
```
[root@localhost ~]# php -v
PHP 5.4.16 (cli) (built: Apr  1 2020 04:07:17)
Copyright (c) 1997-2013 The PHP Group
Zend Engine v2.4.0, Copyright (c) 1998-2013 Zend Technologies
```
**Bước 3**: Cài đặt Wordpress
```
[root@localhost ~]# yum install epel-release -y
[root@localhost ~]# yum --enablerepo=epel install wordpress -y
```
Cấu hình file wp-config.php
```
[root@localhost ~]# vi /etc/wordpress/wp-config.php
```

![](/Linux/image/wp3.png)

* Lưu ý : 192.168.2.129 là địa chỉ ip localhost của sql .
Tiếp theo ta tiến hành tắt cổng IFace ens33 trên máy sql để máy không thể đi ra ngoài mạng và chỉ sử dụng để kết nối trong local .

Cấu hình file wordpress.conf
```
vi /etc/httpd/conf.d/wordpress.conf

# line 8: add
Require all granted
```

## Kết quả
Vào trình duyệt Web và điều hướng đến địa chỉ ip của Web server "http://(server's hostname or IP address)/wordpress/"

![](/Linux/image/wp4.png)