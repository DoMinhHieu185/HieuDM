# cat - nối và in các tập tin
### 1. Notes
```
cat file ...
```
Lệnh cat lấy một danh sách các tên tệp cho các đối số của nó.

Nó xuất nội dung của những tệp đó trực tiếp ra đầu ra tiêu chuẩn, theo mặc định, được dẫn đến màn hình.

### 2. Examples
* Viết nội dung của một tệp
```
[root@localhost ~]# cat hieu.txt
do minh hieu
do minh trang
nguyen thi thanh hien
do xuan thang
```
Bạn có thể sử dụng tùy chọn -n để in số dòng:
```
[root@localhost ~]# cat -n hieu.txt
     1  do minh hieu
     2  do minh trang
     3  nguyen thi thanh hien
     4  do xuan thang
```
Viết nội dung của nhiều tệp
```
[root@localhost ~]# cat hieu.txt file1
do minh hieu
do minh trang
nguyen thi thanh hien
do xuan thang

ls: cannot access -: No such file or directory
```
Viết nội dung của nhiều tệp lần lượt ( enter EOF character ('^D') for each file)
```
[root@localhost ~]# cat hieu.txt - file1
```

