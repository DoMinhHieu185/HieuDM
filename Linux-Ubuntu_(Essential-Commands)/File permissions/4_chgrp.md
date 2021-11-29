# chgrp - thay đổi nhóm
### 1. Notes
```
chgrp group file ...
```
Lệnh `chgrp` thay đổi nhóm tệp và thư mục.

### 2. Examples
* Thay đổi nhóm của thư mục
```
[root@localhost ~]# chgrp root folder
[root@localhost ~]# ll
total 12
-rw-------. 1 root root 1224 Oct  7 11:57 anaconda-ks.cfg
-rwxrwxrwx. 1 root root    0 Nov 22 14:00 file1
drwxr-xr-x. 3 hieu root   47 Nov 22 13:33 folder
```
* Thêm tuỳ chọn -R để đặt quyền theo kiểu đệ quy
```
[root@localhost ~]# chgrp -R root folder
[root@localhost ~]# ll folder
total 4
-rw-r--r--. 1 hieu root 49 Nov 22 12:37 file1
lrwxrwxrwx. 1 hieu root  5 Nov 22 10:55 file2 -> file2
drwxr-xr-x. 3 hieu root 21 Nov 22 13:34 folder1
```

