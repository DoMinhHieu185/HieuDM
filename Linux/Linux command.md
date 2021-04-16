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
### 3.3, export *NAME*=*value*
Đặt *$NAME* thành giá trị
### 3.4, $PATH
Đường dẫn tím kiếm thực thi
![](/Linux/image/path.png)
### 3.5, $HOME
Thư mục chính
![](/Linux/image/home.png)
### 3.6, $SHELL
shell hiện tại

## 4, Directory Operations( hoạt động của thư mục)
### 4.1, pwd
Hiển thị thư mục hiện tại
![](/Linux/image/pwd.png)
### 4.1, mkdir *dir* (dir có thể thay thế bằng tên thư mục khác)
Tạo thư mục *dir*
![](/Linux/image/pwd.png)
### 4.2, cd *dir*
đi đến thư mục *dir*
![](/Linux/image/pwd.png)
### 4.3, cd.. 
đi đến thư mục nào đó
### 4.4, ls
Liệt kê các tệp
![](/Linux/image/ls.png)

## 5, ls option( các tùy chọn của lệnh 'ls')
### 5.1, -a
Hiển thị tất cả bao gồm cả tệp ẩn
![](/Linux/image/ls-a.png)
### 5.2, -R
Danh sách đệ quy
![](/Linux/image/ls-R.png)
### 5.3, -r
Đảo ngược thứ tự tệp
![](/Linux/image/ls-rt.png)
### 5.4, -t
Sắp xếp theo lần sửa đổi cuối cùng
![](/Linux/image/ls-t.png)
### 5.5, -S
Sắp xếp theo kích cỡ tệp
![](/Linux/image/ls-s.png)
### 5.6, -l
Hiển thị tất cả thông tin các mục
![](/Linux/image/ld-l.png)
### 5.7, -1
hiển thị mỗi tệp trên mỗi dòng
![](/Linux/image/ls-1.png)
### 5.8, -m 
Hiển thị các tệp được phân cách bằng dấu phẩy(,)
![](/Linux/image/ls-m.png)
### 5.9, -Q
Hiển thị các tệp được trích dẫn bằng dấy nháy đôi("")
![](/Linux/image/ls-q.png)

## 6, Search file(tìm kiếm trong file)
### 6.1, grep hieu hieu.pro
Tìm kiếm "hieu" trong file "hieu.pro"
![](/Linux/image/grep.png)
### 6.1, grep -i
Tìm kiếm không phân biệt hoa thường
![](/Linux/image/grep-i.png)
### 6.2, grep -r
Tìm kiếm đệ quy(tìm kiếm tất cả các tệp trong thư mục hiện tại)
![](/Linux/image/grep-r.png)
### 6.3, grep -v
In các dòng không chứa từ khóa.
![](/Linux/image/grep-v.png)
### 6.4, grep -o
Chỉ hiển thị từ khóa cần tìm
![](/Linux/image/grep-o.png)
### 6.5, find /*root* -name *text1.txt*
Tìm file với tên cụ thể
![](/Linux/image/find1.png)
### 6.6, find /*root* -user *root*
Tìm file với tên chủ sở hữu
![](/Linux/image/find2.png)
### 6.7 whereis
Dùng để tìm vị trí tệp nguồn, binary file của một lệnh hoặc phần hướng dẫn sử dụng cho một tệp được chỉ định.
![](/Linux/image/whereis.png)

## 7, File Operations(Thao tác tệp)
### 7.1, touch *file1*
Tạo file
![](/Linux/image/touch.png)
### 7.2, cat *file1* *file2*
Nối các tệp và kết xuất
![](/Linux/image/cat.png)
### 7.3, less file1
Xem và phân trang *file1*
![](/Linux/image/less.png)
### 7.4, file *file1*
định dạng của *file1*
![](/Linux/image/file.png)
### 7.5, cp *file1* *file2*
copy file1 sang file2
![](/Linux/image/cp.png)
### 7.6, mv *file1* *file2*
đổi tên tệp
![](/Linux/image/mv.png)
di chuyển tệp tin thư mục
![](/Linux/image/mv2.png)
### 7.7, rm *file1*
xóa file
![](/Linux/image/rm.png)
### 7.8, head *file1*
Hiển thị 10 dòng đầu tiên của tệp 1
![](/Linux/image/head.png)
### 7.9, tail *file1*
Hiển thị 10 dòng cuối của file 1
![](/Linux/image/tail.png)
