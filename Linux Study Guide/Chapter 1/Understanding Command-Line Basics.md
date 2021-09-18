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
root@hieukma:~# readlink /bin/sh
dash
```
**Listing 1.3**: Hiển thị trình shell và phiên bản của shell hiện tại trên CentOS
```
[root@localhost ~]# echo $SHELL
/bin/bash
[root@localhost ~]# echo $BASH_VERSION
4.2.46(2)-release
```
**Listing 1.4**:  Hiển thị bản phân phối Linux
```
root@hieukma:~# uname
Linux
root@hieukma:~# uname -r
4.15.0-156-generic
root@hieukma:~# uname -a
Linux hieukma 4.15.0-156-generic #163-Ubuntu SMP Thu Aug 19 23:31:58 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
[root@localhost ~]# uname -r
3.10.0-1160.42.2.el7.x86_64
[root@localhost ~]# uname -a
Linux localhost.localdomain 3.10.0-1160.42.2.el7.x86_64 #1 SMP Tue Sep 7 14:49:57 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
```
* -r để hiện thị phiên bản
* -a hiển thị tất cả thông tin

### Using a Shell
Để chạy một chương trình từ shell, tại dòng lệnh, bạn chỉ cần gõ lệnh của nó, sử dụng cú pháp thích hợp và nhấn Enter để thực thi nó.
**Listing 1.5**: Sử dụng lệnh echo
```
[root@localhost ~]# echo I Love Linux
I Love Linux
```
### Quoting Metacharacters
Trong Bash shell là một số ký tự có ý nghĩa và chức năng đặc biệt. Những ký tự này được gọi là siêu ký tự. Các siêu ký tự của Bash shell bao gồm những điều sau:
```
* ? [ ] ' " \ $ ; & ( ) | ^ < >
```
Ví dụ, ký hiệu đô la ($) thường chỉ ra rằng các ký tự theo sau nó là một tên biến. Khi được sử dụng với lệnh echo, chương trình sẽ cố gắng truy xuất giá trị của biến và hiển thị nó.
**Listing 1.6**: Sử dụng lệnh echo với siêu ký tự $
```
[root@localhost ~]# echo It cost $1.00
It cost .00
```
* Ký hiệu \: để trích dẫn siêu kí tự
* Ký hiệu "": cũng để trích dẫn siêu kí tự(đỗi với 1 đoạn nhiều siêu ký tự)
**Listing 1.7**: Sử dụng lệnh echo và shell trích dẫn một siêu ký tự
```
[root@localhost ~]# echo It cost \$1.00
It cost $1.00
[root@localhost ~]# echo "Is Schrodinger's cat alive or dead?"
Is Schrodinger's cat alive or dead?
```
### Navigating the Directory Structure
* Khi bạn đăng nhập vào hệ thống Linux, thư mục làm việc hiện tại của quy trình là thư mục chính của tài khoản của bạn.
* Sử dụng lênh `cd` để di chuyển giữa các thư mục và lệnh `pwd` để xem vị trí thư mục hiện tại
**Listing 1.8**: Sử dụng lệnh `cd` và `pwd`
```
[root@localhost ~]# cd /etc
[root@localhost etc]# pwd
/etc
[root@localhost etc]# cd lvm
[root@localhost lvm]# pwd
/etc/lvm
```
* Khi sử dụng lệnh `cd`, bạn có thể sử dụng các tham chiếu thư mục tuyệt đối hoặc tương đối.
* `pwd` luôn hiển thị thư mục bằng cách sử dụng tham chiếu thư mục tuyệt đối.
* Hai dấu chấm (..) đại diện cho thư mục phía trên thư mục hiện tại, là thư mục mẹ.
* Dấu chấm đại diện cho thư mục hiện tại. Mặc dù dấu chấm đơn không được sử dụng với lệnh cd, nhưng nó thường được sử dụng cho các tác vụ như sao chép hoặc di chuyển tệp.
### Understanding Internal and External Commands
Trong một trình shell, một số lệnh mà bạn nhập vào dòng lệnh là một phần của (bên trong) chương trình trình shell. Các lệnh nội bộ này đôi khi được gọi là lệnh tích hợp. Các lệnh khác là các chương trình bên ngoài, vì chúng không phải là một phần của trình bao.
**Listing 1.12**: Sử dụng `type` để xác định một lệnh là bên ngoài hay bên trong
```
[root@localhost lvm]# type echo
echo is a shell builtin
[root@localhost lvm]# type ls
ls is aliased to `ls --color=auto'
[root@localhost lvm]# type netstat
netstat is /usr/bin/netstat
```
### Using Environment Variables
* Các biến môi trường theo dõi thông tin hệ thống cụ thể, chẳng hạn như tên của người dùng đã đăng nhập vào shell, thư mục chính mặc định cho người dùng, đường dẫn tìm kiếm mà shell sử dụng để tìm các chương trình thực thi, v.v.
* Bạn có thể hiển thị danh sách đầy đủ các biến môi trường hoạt động có sẵn trong trình bao của mình bằng cách sử dụng lệnh `set`
* Bên cạnh tiện ích `set`, bạn cũng có thể sử dụng các lệnh `env` và `printenv` để hiển thị các biến.
* Vì Hello.sh nằm trong thư mục không có trong PATH nên không thể trực tiếp chạy Hello.sh
```
[root@localhost ~]# hello.sh
-bash: hello.sh: command not found
```
mà chỉ ra đường dẫn đến file đó:
```
[root@localhost ~]# /root/hieu/hello.sh
Hello World
```
* Nếu một chương trình nằm trong thư mục PATH, bạn có thể chạy chương trình đó bằng cách chỉ cần nhập tên của lệnh. Nếu muốn, bạn cũng có thể thực thi nó bằng cách bao gồm tham chiếu thư mục tuyệt đối của nó
```
[root@localhost ~]# echo Hieu
Hieu
[root@localhost ~]# /usr/bin/echo Hieu
Hieu
```
### Getting Help
* Sử dụng lệnh `man` để xem trợ giúp về các tùy chọn hoặc cú pháp của lệnh
cú pháp: `man [option] [command]`
* Sử dụng lệnh `history` để xem lại các lệnh thực hiện gần đây:
```
   58  cd hieu
   59  vi hello.sh
   60  hello.sh
   61  /root/hieu/hello.sh
   62  /root/hieu/Hello.sh
   63  echo $PATH
   64  ls /root/hieu/Hello.sh
   65  reboot
   66  /root/hieu/hello.sh
   67  ls -a /root/hieu/hello.sh
   68  ls /root/hieu/hello.sh
   69  set
   70  chmod 777 /root/hieu/hello.sh
   71  /root/hieu/hello.sh
   72  vi /root/hieu/hello.sh
   73  /root/hieu/hello.sh
   74  hello.sh
   75  which hello.sh
   76  which echo
   77  which ls
   78  echo Hieu
   79  /usr/bin/echo Hieu
   80  history
```
Để quay lại 1 lệnh mới sử dụng trước
```
[root@localhost ~]# !45
pwd
/root
```
* Hiển thị vị trí tệp lịch sử
```
[root@localhost ~]# echo $HISTFILE
/root/.bash_history
```