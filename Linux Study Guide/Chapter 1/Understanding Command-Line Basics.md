# Understatnding Command-Line Basics
### Discussing Distributions
Các bản phân phối linux mặc dù tất cả chúng đều có nhân Linux (Linux kernel) ở cốt lõi, nhưng các tính năng khác nhau và có thể bao gồm sự khác biệt về dòng lệnh.
### Reaching a Shell
Nếu bạn sử dụng giao diện người dùng đồ họa (GUI) của bản phân phối Linux của mình, bạn có thể đăng nhập và sau đó mở trình giả lập đầu cuối để truy cập dòng lệnh thông qua các bước sau:
* Trên bản phân phối Ubuntu Workstation, nhấn Ctrl + Alt + T.
* Trên CentOS 7 Everything và bản phân phối Fedora 29 Workstation, nhấp vào Tùy chọn menu Activity, nhập một cụm từ vào thanh tìm kiếm và chọn biểu tượng đầu cuối kết quả.
* Trên bản phân phối Leap openSUSE 15, hãy nhấp vào biểu tượng Menu Aplication ở góc dưới bên trái màn hình, nhập thuật ngữ vào thanh tìm kiếm và chọn một trong các biểu tượng đầu cuối kết quả.
### Exploring Your Linux Shell Options
Một số bản phân phối Shell
* Bash
* Dash
* KornShell
* tcsh
* Z shell
**Listing 1.1**: Hiển thị bản phân phối shell `/bin/sh` trên bản phân phối CentOS
```
[root@localhost ~]# readlink /bin/sh
bash
```
**Listing 1.2**: Hiển thị bản phân phối shell `/bin/sh` trên Ubuntu
```
