# gzip / gunzip - nén / giải nén
### 1. Examples
* Nén tệp:

Thao tác này sẽ nén tệp " file1" và đổi tên tệp thành " file1.gz":
```
[root@localhost ~]# gzip file1
[root@localhost ~]# ls -al | grep "file1.gz"
-rw-r--r--.  1 root root   26 Nov 21 15:50 file1.gz
```
* Giải nén tệp
  * Thao tác này sẽ giải nén tệp " file1.gz" và đổi tên nó thành " file1"
```
[root@localhost ~]# gzip -d file1.gz
[root@localhost ~]# ls -al | grep "file1"
-rw-r--r--.  1 root root    0 Nov 21 15:50 file1
```
  * Giải nén tệp ( gunzip)
```
[root@localhost ~]# gunzip file1.gz
[root@localhost ~]# ls -al | grep "file1"
-rw-r--r--.  1 root root    0 Nov 21 15:50 file1
```
