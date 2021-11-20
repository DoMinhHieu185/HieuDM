# touch - thay đổi thời gian truy cập và sửa đổi tệp

### 1. Notes
Theo mặc định, `touch` lệnh thay đổi thời gian sửa đổi và truy cập của tệp.

Nếu tệp không tồn tại, nó sẽ được tạo (tệp trống) với quyền mặc định (tên người dùng và tên nhóm của người dùng sẽ được sử dụng làm chủ sở hữu tệp).

### 2. Examples
* Tạo tệp nếu nó không tồn tại.
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  folder  folder1  hfile1  hieu.txt
[root@localhost ~]# touch file1
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  folder1  hfile1  hieu.txt
```
* Không tạo tệp nếu nó không tồn tại
```
[root@localhost ~]# touch -c file2
[root@localhost ~]# ls file2
ls: cannot access file2: No such file or directory
```
