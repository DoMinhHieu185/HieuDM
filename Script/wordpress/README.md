# Hướng dẫn chạy file script tự động cài đặt Wordpress
Yêu cầu:

* Sử dụng quyền root

### Bước 1: Tải file script
Thực hiện lệnh sau
```
yum install wget -y
wget https://raw.githubusercontent.com/DoMinhHieu185/HieuDM/master/Script/wordpress/configwp.sh
```

### Bước 2: Cấp quyền thực thi cho script
Thực hiện lệnh
```
chmod +x createfile.sh
```

### Bước 3: Chạy script
Thực hiện lệnh
```
bash configwp.sh
```

### Bước 4: Nhập những thông tin cần thiết
```
[root@localhost ~]# bash configwp.sh
CentOS
Nhap mat khau cho mysqlroot: Admin@123
Nhap ten cho Database: wordpress
Nhap Database username: hieu
Nhap Database password username: Admin@123
Nhap MatiaDB host: (Enter for localhost):
```

### Bước 5: Kết quả

````
SHELL=/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# Backup du lieu
30 * * * * /root/backup.sh

```