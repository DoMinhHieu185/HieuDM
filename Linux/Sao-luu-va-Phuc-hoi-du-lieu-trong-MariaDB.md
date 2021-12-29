# Sao lưu và phục hồi dữ liệu trong MariaDB
### I, Backup – Sao lưu dữ liệu
Cú pháp:
```
mysqldump -u [username] -p [databaseName] > [filename]-$(date +%F).sql
```
username – tên người dùng có quyền sao lưu cơ sở dữ liệu
databasename – tên cơ sở dữ liệu cần sao lưu
filename – tên của bản sao dữ liệu
-$(date +%F) mốc thời gian sao lưu dữ liệu

* Ví dụ 1: Tạo bản sao lưu của toàn bộ hệ thống quản lý cơ sở dữ liệu
```
mysqldump --all-databases --single-transaction --quick --lock-tables=false > full-backup-$(date +%F).sql -u root -p 
```
* Ví dụ 2: Sao lưu một sơ sở dữ liệu cụ thể. Thay test bằng tên cơ sở dữ liệu bạn muốn sao lưu.
```
mysqldump -u root -p test --single-transaction --quick --lock-tables=false > test-backup-$(date +%F).sql
```
* Ví dụ 3: Sao lưu một bảng duy nhất từ một cơ sở dữ liệu. Thay test bằng tên cơ sở dữ liệu chứa bảng, thay sinhvien bằng tên bảng bạn muốn sao lưu.
```
mysqldump -u root -p --single-transaction --quick --lock-tables=false test sinhvien > test-sinhvien-$(date +%F).sql
```
Phân tích các tùy chọn lệnh được sử dụng ở trên:

--single-transaction – đưa ra câu lệnh BEGIN SQL trước khi vào máy chủ
--quick – Đọc các bảng lớn theo cách không yêu cầu có đủ RAM để phù hợp với toàn bộ bảng trong bộ nhớ.
--lock-tables=false – Không khóa bảng cho phiên sao lưu.

### II, Khôi phục dữ liệu được backup
Cú pháp
```
mysql -u user -p -h host database_name < backupfile.sql
```
user – tên tài khoản bạn dùng để khôi phục dữ liệu
host – phần hostname của tài khoản(%, localhost, IP)
database_name – tên cơ cở dữ liệu bạn muốn khôi phục vào
backupfile.sql – file dữ liệu đã sao lưu bạn dùng để khôi phục.

* Ví dụ: Trên server restore khôi phục CSDL có trong test-backup-2019-08-10.sql vào CSDL test
```
mysql -u root -p -h localhost test < /home/mariadb_backup/test-backup-2019-08-10.sql
```

