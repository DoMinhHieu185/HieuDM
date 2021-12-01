# Chapter 24: Bash history substitutions(Sự thay thế lịch sử Bash)

### Section 24.1: Quick Reference(Tham khảo nhanh)
* Tương tác với lịch sử
  * Liệt kê các lệnh trước đó: history
  * Xóa lịch sử: history -c
* Người chỉ định sự kiện
```
# Thực hiện dòng lệnh n của lịch sử bash 
!n

# Thực hiện dòng lệnh cuối cùng
!!

# Thực hiện cuối cùng được bắt đầu bằng text
!text

# Thực hiện lệnh cuối cùng có chứa text
!?text

# Thực hiện lệnh n dòng trước
!-n

# Mở rộng đến lệnh cuối cùng với sự xuất hiện đầu tiền của "one" và được thay thế bằng "mot"
^one^mot^

# Thực hiện lệnh hiện tại
!#
```

**Word designators - Bộ chỉ định từ**
Có thể bỏ qua dấu hai chấm nếu từ chỉ địnhkhông bắt đầu bằng số :`!^` giống như `!:^` 
```
# Thực thi đối số đầu tiên của lệnh gần nhất
!^

# Thực thi đến đối số cuối cùng của lệnh gần đây nhất
!$

# Thực thi đến đối số n của lệnh gần đây nhất
!:3

# Mở rộng đến tất cả các từ của lệnh cuối cùng người từ lệnh 0
!* 
```

### Section 24.2: Repeat previous command with sudo(Lặp lại lệnh trước với sudo)
```
$ apt-get install r-base
E: Could not open lock file /var/lib/dpkg/lock - open (13: Permission denied)
E: Unable to lock the administration directory (/var/lib/dpkg/), are you root?
$ sudo !!
sudo apt-get install r-base
[sudo] password for <user>:
```

### Section 24.3: Search in the command history by pattern(Tìm kiếm trong lịch sử lệnh theo mẫu)
Sử dụng `crtl + r` và nhập một mẫu.

Ví dụ nếu gần đây bạn đã thực thi lệnh `man systemctl`, bạn có thể tìm thấy nó nhanh chóng bằng cách nhập "systemctl"
```
[hieu@localhost ~]$ history
    1  yum install httpd
    2  sudo yum install httpd
    3  man chmod
    4  history
    5  man chmod
    6  history
(reverse-i-search)`hi': history
```
``hi'` ở đó là chuỗi mà tôi đã gõ cho đến nay. Đây là một tìm kiếm gia tăng, vì vậy khi bạn tiếp tục nhập, kết quả tìm kiếm được cập nhật để khớp với lệnh gần đây nhất có chứa mẫu. Theo mặc định, tìm kiếm sẽ được thấy lệnh được thực hiện gần đâ nhất phù hợp với mẫu. Để quay lại lịch sử, nhấn ctrl + r. Bạn có thể nhấn liên tục cho đến khi tìm thấy lệnh mong muốn

### Section 24.4: Switch to newly created directory with !#:N(Chuyển sang thư mục mới tạo bằng !#:n)
```
[hieu@localhost ~]$ mkdir backup_data && cd !#:1
mkdir backup_data && cd backup_data
[hieu@localhost backup_data]$
```
Điều này sẽ thay thế đối số n của lệnh hiện tại. Trong ví dụ `!#:1` được thay thế bằng đối số đầu tiên, tức là **backup_data**

Section 24.5: Repeat the previous command with a substitution(Lặp lại lệnh trước đó với một lệnh thay thế)
```
[root@localhost ~]# cat file1
hieu
[root@localhost ~]# ^1^2^
cat file2
tuan
```
Lệnh này sẽ thay thế 1 bằng 2 trong lệnh đã thực hiện trước đó. Nó sẽ chỉ thay thế lần xuất hiện đầu tiên của chuỗi và tương đương với `!!:s/1/2/`
