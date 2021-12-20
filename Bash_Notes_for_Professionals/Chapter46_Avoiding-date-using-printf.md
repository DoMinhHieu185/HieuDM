# Avoiding date using printf
Trong Bash 4.2, một chuyển đổi thời gian tích hợp sẵn shell cho printf đã được giới thiệu
### Section 46.1: Get the current date(Lấy ngày hiện tại)
```
[root@localhost ~]# printf '%(%F)T\n'
1970-01-01
```

### Section 46.2: Set variable to current time(Đặt biến thành thời gian hiện tại)
```
[root@localhost ~]# printf -v now '%(%T)T'
[root@localhost ~]# echo "$now"
08:00:00
```
