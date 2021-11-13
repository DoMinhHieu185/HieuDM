# Sử dụng sort
để sắp xếp dữ liệu trong các tệp theo một trình tự

### Section 18.1: Sort command output(Sắp xếp đầu ra lệnh)
Sort dùng để sắp xếp một danh sách các dòng
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

```
* Đầu vào từ một file
```
[root@localhost ~]# sort hieu.txt

05
18
1999
AT140612
Do Minh Hieu
nghia lo
xem phim
Yen Bai
```
* Đầu vào từ một lệnh: Bạn có thể sắp xếp bất kỳ lệnh đầu ra nào. Trong ví dụ, danh sách tệp tên text.txt.
```
[root@localhost ~]# cat hieu.txt | sort

05
18
1999
AT140612
Do Minh Hieu
nghia lo
xem phim
Yen Bai
```

### Section 18.2: Make output unique(Tạo đầu ra duy nhất)
Nếu mỗi dòng của đầu ra cần phải là duy nhất, hãy thêm tùy chọn -u-(unique)

Để hiển thị chủ sở hữu của các tệp trong thư mục
```
[root@localhost ~]# ls -l | awk '{print $3}' | sort -u

root
```

### Section 18.3: Numeric sort(Sắp xếp theo số)
Để sắp xếp tệp này theo số, hãy sử dụng `sort` với tùy chọn `-n`

Để đảo ngược thứ tự sắp xếp, hãy sử dụng tùy chọn `-r`
```
sort -rn file
``
