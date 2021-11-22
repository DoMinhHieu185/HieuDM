# chown - thay đổi chủ sở hữu tệp và nhóm của tệp
### 1. Notes
```
chown owner[:group] file ...

chown :group file ...
```
Lệnh `chown` thay đổi chủ sở hữu và / hoặc nhóm tệp và thư mục.

### 2. Examples
* Thay đổi chủ sở hữu của thư mục
```
[root@localhost hieu]# chown root Tailieu
[root@localhost hieu]# ll
total 0
-rwx------. 1 hieu hieu 0 Nov 22 14:40 file1
drwxr-xr-x. 2 root root 6 Oct  7 20:37 project
drwxrwxr-x. 2 root hieu 6 Nov 22 14:17 Tailieu
```
* Thay đổi nhóm sở hữu của thư mục
```
[root@localhost hieu]# chown :root Tailieu
[root@localhost hieu]# ll
total 0
-rwx------. 1 hieu hieu 0 Nov 22 14:40 file1
drwxr-xr-x. 2 root root 6 Oct  7 20:37 project
drwxrwxr-x. 2 root root 6 Nov 22 14:17 Tailieu
```
* Thay đổi chủ sở hữu và nhóm sở hữu của thư mục
```
[root@localhost hieu]# chown hieu:hieu Tailieu
[root@localhost hieu]# ll
total 0
-rwx------. 1 hieu hieu 0 Nov 22 14:40 file1
drwxr-xr-x. 2 root root 6 Oct  7 20:37 project
drwxrwxr-x. 2 hieu hieu 6 Nov 22 14:17 Tailieu
```
* Thêm tuỳ chọn -R để thay đổi kiểu đệ quy(các thư mục và tệp con đề giống với thư mục mẹ)
```
[root@localhost ~]# chown -R hieu:hieu folder
[root@localhost ~]# ll folder
total 4
-rw-r--r--. 1 hieu hieu 49 Nov 22 12:37 file1
lrwxrwxrwx. 1 hieu hieu  5 Nov 22 10:55 file2 -> file2
drwxr-xr-x. 3 hieu hieu 21 Nov 22 13:34 folder1
```
