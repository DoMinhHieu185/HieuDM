# head - hiển thị các dòng đầu tiên của tệp
### 1. Notes
```
head file ...
```
In 10 dòng đầu tiên của mỗi tệp ở đầu ra tiêu chuẩn.

Với nhiều tệp, hãy đặt trước mỗi tệp một tiêu đề cho tên tệp.

Khi không có tệp hoặc khi có tệp - , hãy đọc đầu vào chuẩn.

### 2. Examples
```[root@localhost ~]# head hieu.txt
do minh hieu
do minh trang
nguyen thi thanh hien
do xuan thang

total 36
dr-xr-x---.  2 root root  164 Nov 26 16:57 .
dr-xr-xr-x. 19 root root  267 Nov 23 12:25 ..
-rw-------.  1 root root 1249 Nov 22 10:14 anaconda-ks.cfg
-rw-------.  1 root root 1052 Nov 23 15:35 .bash_history
```
```
[root@localhost ~]# head -n 5 hieu.txt
do minh hieu
do minh trang
nguyen thi thanh hien
do xuan thang

```
