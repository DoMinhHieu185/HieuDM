# Tệp danh sách
### Section 4.1: List Files in a Long Listing Format(Liệt kê các tệp ở định dạng danh sách dài)
Tùy chọn `-l` của lệnh `ls` in nội dung của thư mục cụ thể ở định dạng danh sách dài. Nếu không có thư mục nào được chỉ định thì theo mặc định, nội dung của thư mục hiện tại sẽ được liệt kê.
```
[root@localhost ~]# ls -l /root
[root@localhost ~]# ls -l /var
total 8
drwxr-xr-x.  2 root root    6 Apr 11  2018 adm
drwxr-xr-x.  5 root root   44 Oct  7 11:51 cache
drwxr-xr-x.  2 root root    6 Jun  9 23:09 crash
```
Đầu tiên hiển thị `total`, cho biết tổng kích thước tính bằng khối của tất cả các tệp trong thư mục được liệt kê

Trong đó:
* Kí tự đầu tiên: định dạng:
  * -: file bình thường
  * d: thư mục
  * s: file socket
  *l: link file
* Trường 1: File permission
* Trường 2: Số lượng liên kết đến tệp hay thư mục đó
* Trường 3: Chủ sở hữu của tệp, thư mục
* Trường 4: Nhóm của tệp, thư mục
* Trường 5: Kích thước của tệp, thư mục đó(đơn vị: byte)
* Trường 6: Thời gian sửa đổi cuối cùng
* Trường 7: Tên của tệp, thư mục

### Section 4.2: List the Ten Most Recently Modified Files(Liệt kê mười tệp được sửa đổi gần đây nhất)
Phần sau sẽ liệt kê tối đa mười tệp được sửa đổi gần đây nhất trong thư mục hiện tại, sử dụng định dạng danh sách dài (-l) và được sắp xếp theo thời gian (-t).
```
ls -lt | head
```
* Output
```
[root@localhost etc]# ls -lt | head
total 1028
-rw-r--r--.  1 root root     74 Oct  8 15:03 resolv.conf
----------.  1 root root    686 Oct  7 20:36 shadow
-rw-r--r--.  1 root root     18 Oct  7 20:36 subgid
-rw-r--r--.  1 root root     18 Oct  7 20:36 subuid
----------.  1 root root    354 Oct  7 20:36 gshadow
-rw-r--r--.  1 root root    448 Oct  7 20:36 group
-rw-r--r--.  1 root root    837 Oct  7 20:36 passwd
-rw-r--r--.  1 root root  18629 Oct  7 12:23 ld.so.cache
drwxr-xr-x.  3 root root     54 Oct  7 12:23 udev
```

### Section 4.3: List All Files Including Dotfiles(Liệt kê tất cả các tệp bao gồm các tệp chấm)
Dotfile là một tệp có tên bắt đầu bằng dấu chấm (.). Chúng thường được ẩn bởi ls và không được liệt kê trừ khi được yêu cầu.
```
[root@localhost ~]# ls
anaconda-ks.cfg  hello.sh
```
Tùy chọn -a hoặc --all sẽ liệt kê tất cả các tệp, bao gồm các tệp dotfiles
```
[root@localhost ~]# ls -a
.  ..  anaconda-ks.cfg  .bash_history  .bash_logout  .bash_profile  .bashrc  .cshrc  hello.sh  .tcshrc
```
Tùy chọn -A hoặc –almost-all sẽ liệt kê tất cả các loại tệp, bao gồm các tệp Dotfiles, nhưng không liệt kê implied (.) và (..).
```
[root@localhost ~]# ls -A
anaconda-ks.cfg  .bash_history  .bash_logout  .bash_profile  .bashrc  .cshrc  hello.sh  .tcshrc
```

### Section 4.4: List Files Without Using `ls`(Liệt kê các tệp mà không sử dụng `ls`)
Sử dụng bash shell’s File name expansion(mở rộng tên tệp) và brace expansion(mở rộng dấu ngoặc nhọn) để lấy các tên tệp:
```
#hiển thị các tệp và thư mục có trong thư mục hiện tại
[root@localhost ~]# printf "%s\n" *
anaconda-ks.cfg
dohieu
hello.sh
```
```
# chỉ hiển thị các thư mục trong thư mục hiện tại
[root@localhost ~]# printf "%s\n" */
dohieu/
```
```
# liệt kê file có đuôi txt
[root@localhost ~]# printf "%s\n" *.txt
hieu.txt
```
```
# Liệt kê các file có đuôi txt,md,conf, nếu không có file thì dấu * sẽ được hiển
[root@localhost ~]# printf "%s\n" *.{txt,md,conf}
hieu.txt
*.md
*.conf
```
### Section 4.5: List Files(Liệt kê các tập tin)
Lệnh ls liệt kê nội dung của một thư mục được chỉ định, không bao gồm các tệp dotfiles. Nếu không có thư mục nào được chỉ định thì theo mặc định, nội dung của thư mục hiện tại sẽ được liệt kê.
Các tệp trong danh sách được sắp xếp theo thứ tự bảng chữ cái, theo mặc định và được căn chỉnh theo cột nếu chúng không vừa trên một dòng.
```
[root@localhost ~]# ls
anaconda-ks.cfg  dohieu  hello.sh  hieu.txt
```

### Section 4.6: List Files in a Tree-Like Format(Liệt kê các tệp ở định dạng giống cây thư mục)
Lệnh `tree` liệt kê nội dung của một thư mục được chỉ định ở định dạng giống như cây. Nếu không có thư mục nào được chỉ định thì theo mặc định, nội dung của thư mục hiện tại sẽ được liệt kê.
```
[root@localhost ~]# tree
.
├── anaconda-ks.cfg
├── dohieu
├── hello.sh
└── hieu.txt

1 directory, 3 files
```

* Để cài đặt và sử dụng lệnh cho Centos7: `sudo yum install tree` hoặc cho Ubuntu: `apt install tree`
* Sử dụng tùy chọn `-L` của lệnh tree để giới hạn độ sâu hiển thị và tùy chọn `-d` để chỉ liệt kê các thư mục.

### Section 4.7: List Files Sorted by Size(Liệt kê các tệp được sắp xếp theo kích thước)
Tùy chọn -S của lệnh ls sắp xếp các tệp theo thứ tự giảm dần về kích thước tệp
```
[root@localhost ~]# ls -S -l
total 8
-rw-------. 1 root root 1224 Oct  7 11:57 anaconda-ks.cfg
-rwxr-xr-x. 1 root root   65 Oct  7 20:21 hello.sh
drwxr-xr-x. 2 root root    6 Oct  8 15:26 dohieu
-rw-r--r--. 1 root root    0 Oct  8 15:30 hieu.txt
```

Khi được sử dụng với tùy chọn -r, thứ tự sắp xếp được đảo ngược.
```
[root@localhost ~]# ls -S -l -r
total 8
-rw-r--r--. 1 root root    0 Oct  8 15:30 hieu.txt
drwxr-xr-x. 2 root root    6 Oct  8 15:26 dohieu
-rwxr-xr-x. 1 root root   65 Oct  7 20:21 hello.sh
-rw-------. 1 root root 1224 Oct  7 11:57 anaconda-ks.cfg
```

