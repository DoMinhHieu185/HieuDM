# Linux Command
## 1, Bash Commands
### 1.1, uname -a
Hiển thị hệ thống và hạt nhân
![](/Linux/image/uname-a.png)
### 1.2, head -n1 /etc/issue
Hiển thị phân phối 
![](/Linux/image/issue.png)
### 1.3, mount
Hiện thị hệ thông tệp được gắn kết
![](/Linux/image/mount.png)
### 1.4, date
Hiển thị ngày hệ thống
![](/Linux/image/date.png)
### 1.5, uptime
Hiển thị thời gian hoạt động
![](/Linux/image/uptime.png)
### 1.6, whoami
Hiển thị tên người dùng của bạn
![](/Linux/image/whoami.png)
### 1.7, man *command*
Hiển thị hướng dẫn sử dụng lệnh( command: là các lệnh trong linux)
  - q để thoát
  - ví dụ: man ls
![](/Linux/image/man.png)
## 2, Bash Shortcuts
### 2.1, CTRL-c
Dừng lệnh hiện tại
### 2.2, CTRL-z 
Chương trình ngủ
### 2.3, Ctrl-a
Đi đến đầu dòng
### 2.4, CTRL-e
Đi đến cuối dòng
### 2.5, CTRL-u
Cắt từ đầu dòng
### 2.6, CTRL-k
Cắt từ cuối dòng
### 2.7, CTRL-r
Lịch sử tìm kiếm
### 2.8, !!
Lặp lại lệnh cuối
### 2.9, ! *abc* (abc: là các số thứ tự lệnh mình từng chạy)
Chạy lệnh cuối cùng bắt đầu bằng *abc*
### 2.10, !abc:p
In lệnh cuối cùng bắt đầu bằng *abc*
### 2.11, !$
Đối số cuối cùng của lệnh trước 
### 2.11, !*
Tất cả các đổi số của lệnh trước

## 3, Bash variables
### 3.1, env
Hiển thị các biến môi trường
![](/Linux/image/env.png)
### 3.2, echo *$NAME*
Giá trị đầu ra của biến $ NAME
![](/Linux/image/echo.png)
### 3.3, export NAME=value