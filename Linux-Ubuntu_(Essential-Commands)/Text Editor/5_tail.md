# tail - hiển thị những dòng cuối cùng của tệp
### 1. Notes
```
tail file ...
```
In 10 dòng cuối cùng của mỗi tệp ở đầu ra tiêu chuẩn.

Với nhiều tệp, hãy đặt trước mỗi tệp một tiêu đề cho tên tệp.

Khi không có tệp hoặc khi có tệp - , hãy đọc đầu vào chuẩn.

### 2. Examples
```
[root@localhost ~]# tail hieu.txt
dr-xr-xr-x. 19 root root  267 Nov 23 12:25 ..
-rw-------.  1 root root 1249 Nov 22 10:14 anaconda-ks.cfg
-rw-------.  1 root root 1052 Nov 23 15:35 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root   47 Nov 26 16:02 file1
-rw-r--r--.  1 root root   64 Nov 26 16:48 hieu.txt
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
```
[root@localhost ~]# tail -n 2 hieu.txt
-rw-r--r--.  1 root root   64 Nov 26 16:48 hieu.txt
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
