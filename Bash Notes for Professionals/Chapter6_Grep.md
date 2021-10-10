# Lệnh `Grep`
### Section 6.1: How to search a file for a pattern(Cách tìm kiếm một tệp cho một mẫu)
* Để tìm từ "Hieu" trong file "hieu.txt":
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
AT140612
Yen Bai
nghia lo
xem phim
18
05
1999
[root@localhost ~]# grep "Hieu" hieu.txt
Do Minh Hieu
```
Để tìm tất cả các dòng không chứa "Hieu" trong file "hieu.txt":
```
[root@localhost ~]# grep -v "Hieu" hieu.txt
AT140612
Yen Bai
nghia lo
xem phim
18
05
1999
```
  > Nên tìm hiểu thêm trên Internet về cách dùng `grep`
