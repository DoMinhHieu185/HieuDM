# Đổi shell
### Section 35.1: Find the current shell(Tìm shell hiện tại)
Có một số cách để xác định shell hiện tại
```
echo $0
ps -p $$
echo $SHELL
```

### Section 35.2: List available shells(Liệt kê các trình shell có sẵn)
Để liệt kê các shell đăng nhập có sẵn
```
[root@localhost ~]# cat /etc/shells
/bin/sh
/bin/bash
/usr/bin/sh
/usr/bin/bash
```

### Section 35.3: Change the shell(Thay đổi trình shell)
Để thay đổi bash hiện tại, hãy chạy các lệnh này
```
export SHELL=/bin/bash
exec /bin/bash
```
để thay đổi bash mở khi khởi động, hãy chỉnh sửa `.profile` và thêm những dòng đó
