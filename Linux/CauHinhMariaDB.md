# Hướng dẫn cài đặt và cấu hình MariaDB
## 1, Cài đặt MariaDB 5.5
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

## 2, Cấu hình secure MariaDB
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

## 3, Truy cập vào MariaDB
```
mysql -u root -p
```
* Nhập mật khẩu tài khoản ở bước 2

## 4, Cấu hình Firewall
```
[root@localhost ~]# firewall-cmd --add-service=mysql --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```


# Cài đặt phpMyadmin
### 1, Cài đặt apache
* Cài đặt httpd
```
[root@localhost ~]# yum install httpd -y
```

* Khởi động dịch vụ httpd
```
[root@localhost ~]# systemctl start httpd
[root@localhost ~]# systemctl enable httpd
Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
```
* Cấu hình firewall cho dịch vụ httpd
```
[root@localhost ~]# firewall-cmd --add-service=http --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```

### 2, Cài đặt PHP
* Cài đặt php
```
[root@localhost ~]# yum -y install php php-mbstring php-pear
```
* Khởi động lại dịch vụ httpd
```
[root@localhost ~]# systemctl restart httpd
```

### 3, Cài đặt phpMyadmin
* Cài đặt phpMyadmin từ EPEL
```
[root@localhost ~]# yum --enablerepo=epel -y install phpMyAdmin php-mysql php-mcrypt
```

* Cấu hình file phpMyadmin.conf
```
[root@localhost ~]# vi /etc/httpd/conf.d/phpMyAdmin.conf
```
* Cấu hình địa chỉ IP bạn cho phép truy cập
![](/Linux/image/db6.png)

* Khởi động lại dịch vụ httpd
```
[root@localhost ~]# systemctl restart httpd
```

### 4