# Hướng dẫn chạy file script tự động backup DB
Yêu cầu:

* Sử dụng quyền root

### Bước 1: Tải file script
Thực hiện lệnh sau
```
yum install wget -y
wget https://raw.githubusercontent.com/DoMinhHieu185/HieuDM/master/Script/Backup/backup.sh
```

### Bước 2: Cấp quyền thực thi cho script
Thực hiện lệnh
```
chmod +x backup.sh
```

### Bước 3: Tiến hành sửa file backup.sh
```
vi backup.sh
```
Thực hiện chỉnh sửa các tham số sau:
```
passroot="Admin@123"
userdb="root"
dbname="sinhvien"
/home/mariadb_backup/backup-$(date +%F).sql
```
Trong đó:
* passroot: là mật khẩu user được truy cập vào database backup
* userdb: là tên user được phép truy cập vào database cần backup
* dbname: tên database cần backup
* /home/mariadb_backup/backup-$(date +%F).sql: thư mục và tên chứa bản backup

### Bước 4: Thiết lập Crontab để tự động backup hàng ngày
Thực hiện lệnh
```
crontab -e
```
Thêm dòng sau vào cuối cùng của file và lưu lại:
```
SHELL=/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# Backup du lieu
30 * * * * /root/backup.sh
```
Crontab sẽ thực hiện 30p backup DB 1 lần