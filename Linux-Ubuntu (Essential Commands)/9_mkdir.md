# mkdir - tạo thư mục
### 1. Notes
```
mkdir directory_name ...
```
Người dùng phải có quyền ghi trong thư mục mẹ.
### 2. Examples
* Tạo một thư mục
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  hieu.txt
[root@localhost ~]# mkdir folder1
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  folder1  hieu.txt
```
* Tạo nhiều thư mục và tùy chọn các thư mục con của chúng:
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  hieu.txt
[root@localhost ~]# mkdir folder folder/folder1 folder/folder2
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  hieu.txt
[root@localhost ~]# ls folder
folder1  folder2
```
* Bạn có thể sử dụng tùy chọn -p để tạo một thư mục con và thư mục cha của nó nếu chúng không tồn tại
```
[root@localhost ~]# mkdir -p folder1/folder2
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  folder1  hieu.txt
[root@localhost ~]# ls folder1
folder2
```
* Tạo một thư mục với một quyền cụ thể
```
[root@localhost ~]# mkdir -m 775 folder1
[root@localhost ~]# ls -l
total 12
-rw-------. 1 root root 1224 Nov 18 13:30 anaconda-ks.cfg
-rw-r--r--. 1 root root 1638 Nov 18 15:12 configwp.sh
-rw-r--r--. 1 root root    0 Nov 20 14:42 file1
drwxr-xr-x. 4 root root   36 Nov 20 17:03 folder
drwxrwxr-x. 2 root root    6 Nov 20 17:10 folder1
-rw-r--r--. 1 root root   41 Nov 18 16:04 hieu.txt
```
