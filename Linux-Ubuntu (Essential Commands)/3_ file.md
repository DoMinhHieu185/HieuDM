#  file -- display file type
### 1. Notes
Sử dụng
```
file file ...
```
Lệnh `file` có thể được sử dụng để xác định loại tập tin và mã hóa ký tự của nó.

### 2. Examples
* Hiển thị loại tệp
```
[root@localhost ~]# ls -l
total 28
-rw-------. 1 root root 1224 Nov 18 13:30 anaconda-ks.cfg
-rw-r--r--. 1 root root 1638 Nov 18 15:12 configwp.sh
-rw-r--r--. 2 root root   10 Nov 19 16:18 file1
-rw-r--r--. 1 root root    1 Nov 19 16:19 file2
-rw-r--r--. 1 root root    0 Nov 19 15:17 file3
-rw-r--r--. 1 root root  512 Nov 18 16:58 filex.cpio
drwxr-xr-x. 4 root root   36 Nov 19 14:35 folder
drwxr-xr-x. 2 root root    6 Nov 19 16:19 folder1
-rw-r--r--. 2 root root   10 Nov 19 16:18 hfile1
-rw-r--r--. 1 root root   41 Nov 18 16:04 hieu.txt
```
```
[root@localhost ~]# file ./*
./anaconda-ks.cfg: ASCII text
./configwp.sh:     Bourne-Again shell script, ASCII text executable
./file1:           ASCII text
./file2:           very short file (no magic)
./file3:           empty
./filex.cpio:      cpio archive
./folder:          directory
./folder1:         directory
./hfile1:          ASCII text
./hieu.txt:        ASCII text
```
* Bạn có thể sử dụng tùy chọn -i để hiển thị kiểu mime và mã hóa của tệp:
```
[root@localhost ~]# file -i ./*
./anaconda-ks.cfg: text/plain; charset=us-ascii
./configwp.sh:     text/x-shellscript; charset=us-ascii
./file1:           text/plain; charset=us-ascii
./file2:           application/octet-stream
./file3:           inode/x-empty; charset=binary
./filex.cpio:      application/x-cpio; charset=binary
./folder:          inode/directory; charset=binary
./folder1:         inode/directory; charset=binary
./hfile1:          text/plain; charset=us-ascii
./hieu.txt:        text/plain; charset=us-ascii
```
* Bạn cũng có thể sử dụng tệp lệnh để hiển thị loại tệp của tệp nhị phân thực thi (hiển thị thông tin hệ điều hành và các thư viện mà tệp thực thi yêu cầu)