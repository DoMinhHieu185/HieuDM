# Using Regular Expressions
### Using `grep`
Sử dụng `grep` để lọc văn bản. Lệnh `grep` rất mạnh trong việc sử dụng các biểu thức chính quy, đièu này giúp lọc các tệp văn bản.
* Cú pháp cơ bản cho tiện ích grep như sau:
```
grep [OPTION] PATTERN [FILE...]
```
* **Ví dụ 1**: Sử dụng lệnh grep đơn giản để tìm kiếm tệp
```
[root@localhost ~]# grep hieu /etc/passwd
hieu:x:1000:1000::/home/hieu:/bin/bash
```
* **Ví dụ 2**: Sử dụng lệnh grep để tìm kiếm các mẫu được lưu trữ trong tệp văn bản
```
[root@localhost ~]# cat grep.txt
hieu
root
tuan
[root@localhost ~]# fgrep -f grep.txt /etc/passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
hieu:x:1000:1000::/home/hieu:/bin/bash
tuan:x:1001:1001::/home/tuan:/bin/bash
[root@localhost ~]# grep -F -f grep.txt /etc/passwd
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
hieu:x:1000:1000::/home/hieu:/bin/bash
tuan:x:1001:1001::/home/tuan:/bin/bash
```

### Understanding Basic Regular Expressions(Hiểu các Cụm từ Thông dụng Cơ bản)
  * Dấu hoa thị(*) đại diện cho nhiều ký tự
  * Dấu mũ (^) để tìm các bản ghi tệp văn bản bắt đầu bằng 1 ký tự cụ thể 
  * Ký hiệu đô la ($) dể tìm các bản ghi tệp văn bản trong đó các ký tự cụ thể ở cuối bản ghi
* **Ví dụ 1**: Sử dụng lệnh grep với mẫu biểu thức chính quy cơ bản
```
[root@localhost ~]# grep daemon.*nologin /etc/passwd
daemon:x:2:2:daemon:/sbin:/sbin/nologin
[root@localhost ~]# grep ^root /etc/passwd
root:x:0:0:root:/root:/bin/bash
```
  * Sử dụng -v để tìm ra các bản ghi tệp văn bản không chứa mẫu

* **Ví dụ 2**: Sử dụng lệnh grep để kiểm tra tệp mật khẩu
```
[root@localhost ~]# grep -v nologin$ /etc/passwd
root:x:0:0:root:/root:/bin/bash
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
hieu:x:1000:1000::/home/hieu:/bin/bash
tuan:x:1001:1001::/home/tuan:/bin/bash
```

### Understanding Extended Regular Expressions (Hiểu các Cụm từ Thông dụng Mở rộng)
* **Ví dụ 1**: Tìm 2 dòng bắt đầu bằng từ `root` và `dbus` trong file /etc/passwd.
```
[root@localhost ~]# grep -E "^root|^dbus" /etc/passwd
root:x:0:0:root:/root:/bin/bash
dbus:x:81:81:System message bus:/:/sbin/nologin
```
* lệnh grep sử dụng tùy chọn -E để chỉ ra mẫu là một biểu thức chính quy mở rộng. Nếu bạn không sử dụng tùy chọn -E, kết quả không thể đoán trước sẽ xảy ra. Dấu ngoặc kép xung quanh mẫu ERE bảo vệ nó khỏi bị hiểu sai.
* Lệnh tìm kiếm bất kỳ bản ghi tệp mật khẩu nào bắt đầu bằng từ root hoặc từ dbus. Do đó, dấu mũ (^) được đặt trước mỗi từ và thanh dọc (|) phân biệt các từ để chỉ ra rằng bản ghi có thể bắt đầu bằng một trong hai từ.
* egrep = grep -E
