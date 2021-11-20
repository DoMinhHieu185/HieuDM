# rm - xóa tệp / thư mục
### 1. Notes
```
rm source_file ...
```
Lệnh rm không thể đảo ngược. Trình shell không cung cấp Thùng rác nơi có thể khôi phục các tệp và thư mục đã xóa.

Tùy chọn -i có thể được sử dụng để yêu cầu xác nhận trước khi xóa tệp hoặc thư mục.

### 2. Examples
* Xóa tệp
```
[root@localhost folder]# ls
doiten.txt  folder1  folder3  scp.txt
[root@localhost folder]# rm scp.txt
rm: remove regular file ‘scp.txt’? y
[root@localhost folder]# ls
doiten.txt  folder1  folder3
```
* Xóa tất cả các tệp (không bao gồm các thư mục con và các tệp bắt đầu bằng dấu chấm (.)) Trong thư mục
```
[root@localhost ~]# ls folder
doiten.txt  folder1  folder3
[root@localhost ~]# rm folder/*
rm: remove regular file ‘folder/doiten.txt’? y
rm: cannot remove ‘folder/folder1’: Is a directory
rm: cannot remove ‘folder/folder3’: Is a directory
[root@localhost ~]# ls folder
folder1  folder3
```
* Xóa tất cả các tệp bắt đầu bằng dấu chấm (.) Trong một thư mục (không bao gồm các thư mục con)
```
[root@localhost ~]# rm folder1/.*
```
* Xóa thư mục
```
[root@localhost ~]# ls folder
folder1  folder3
[root@localhost ~]# rm -R folder/folder1
rm: remove directory ‘folder/folder1’? y
[root@localhost ~]# ls folder
folder3
```
