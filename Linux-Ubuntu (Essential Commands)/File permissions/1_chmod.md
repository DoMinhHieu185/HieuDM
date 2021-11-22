# chmod - thay đổi chế độ tệp
### 1. Notes
```
chmod mode file ...
```
* Lệnh `chmod` có thể được sử dụng để thay đổi chế độ tập tin của tập tin và thư mục.
* Lệnh chmod cũng có thể được sử dụng để sửa đổi Danh sách Kiểm soát Truy cập (ACL) được liên kết với các tệp và thư mục
* Tệp (và thư mục) có quyền sở hữu được đặt cho người dùng, nhóm hoặc những người khác. Mỗi người trong số họ có thể xác định ba loại quyền thông thường: đọc (r), ghi (w) và thực thi (x). Ký tự gạch ngang (-) được sử dụng khi không đặt quyền. Quyền đối với tệp (hoặc thư mục) được đặt bằng cách sử dụng 9 bit (rwxrwxrwx) xác định quyền đọc, ghi và thực thi cho người dùng, nhóm và những người khác. 3 bit đầu tiên xác định quyền đọc, ghi và thực thi cho người dùng, 3 bit tiếp theo cho nhóm và 3 bit cuối cùng cho những người khác.
* Theo mặc định, quyền của một tệp (hoặc thư mục) mới được tạo được đặt bằng giá trị của umask (mặc định là 002). Để đặt quyền của tệp (hoặc thư mục) được tạo mới, giá trị của umask 002 được kết hợp với quyền mặc định của tệp là 666 (hoặc thư mục 777). Vì vậy, theo mặc định, tệp được tạo mới có quyền rw-rw-r-- (664) và thư mục được tạo mới có quyền rwxrwxr-x (775).

### 2. Examples
* Đặt quyền "read", "write", and "execute" cho  "user", "group", and "others" trên tệp "file1".

Sử dụng bất kỳ lệnh nào sau đây:
```
[root@localhost ~]# chmod 777 file1
[root@localhost ~]# ls -l | grep "file1"
-rwxrwxrwx. 1 root root    0 Nov 22 14:00 file1
```
Cách khác
```
chmod ugo+rwx file1

chmod ugo=rwx file1

chmod a=rwx file1
```
* Đặt quyền "read", "write", and "execute" cho "user" và đặt quyền "read" and "execute" cho "group" and "others" trên tệp "file1".

Sử dụng bất kỳ lệnh nào sau đây:
```
$ chmod 755 file1

$ chmod u=rwx,go=rx file1

$ chmod u=rwx,go=u-w file1
```
* Thêm quyền " read" và " write" vào " user" và " group" trên tệp "file1".

Nếu người dùng hoặc nhóm đã có quyền thực thi, họ sẽ giữ quyền này.
```
$ chmod ug+rw file1
```
* Từ chối quyền " read" và " write" đối với " user" và " group" trên tệp "file1".

Nếu người dùng hoặc nhóm đã có quyền thực thi, họ sẽ giữ quyền này.
```
$ chmod ug-rw file1
```
* Từ chối tất cả quyền đối với " group" và " others" trên tệp "file1"

Sử dụng bất kỳ lệnh nào sau đây:
```
$ chmod go-rwx file1

$ chmod go= file1
```
* Đặt quyền " read", " write" và " search/execute" thành " user", " group" và " others" trên thư mục "folder1" và tất cả các tệp và thư mục con của nó.

Sử dụng bất kỳ lệnh nào sau đây:
```
$ chmod -R 777 folder1/

$ chmod -R ugo+rwx folder1/

$ chmod -R ugo=rwx folder1/

$ chmod -R a=rwx folder1/
```

