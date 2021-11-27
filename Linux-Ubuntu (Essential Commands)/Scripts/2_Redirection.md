# Redirection/Pipe operators
### 1. Standard input/output/error redirection operators(Toán tử chuyển hướng đầu vào/đầu ra/lỗi tiêu chuẩn)
Toán tử chuyển hướng chuyển hướng đầu ra / đầu vào của một tập lệnh (hoặc tệp) sang một tập lệnh (hoặc tệp) khác làm đầu vào / đầu ra.
* "<", " 0<": Toán tử STDIN (tệp, bàn phím, chuột, ...)

* ">", " 1>": Toán tử STDOUT (tệp, màn hình, máy in, ...)

* "2>": Toán tử STDERR (tệp, màn hình, máy in, ...)

* "&>": Toán tử STDOUT & STDERR (tệp, màn hình, máy in, ...)

  * STDIN: đầu vào tiêu chuẩn
  * STDOUT: đầu ra tiêu chuẩn
  * STDERR: lỗi tiêu chuẩn
  * STDOUT và STDERR là hai luồng đầu ra khác nhau

### 2. STDIN redirection operator
Toán tử chuyển hướng "<" STDIN.

Tìm kiếm từ trong tệp 
```
[root@localhost ~]# grep hieu < hieu.txt
do minh hieu
```
Toán tử chuyển hướng "0<" STDIN (giống như "<").

Tìm kiếm từ trong tệp :
```
[root@localhost ~]# grep hieu 0< hieu.txt
do minh hieu
```
Việc sử dụng toán tử chuyển hướng STDIN "<" hoặc "0<" là tùy chọn, vì nó là toán tử mặc định trong trường hợp không có toán tử chuyển hướng rõ ràng.

Tìm kiếm từ trong tệp:
```
[root@localhost ~]# grep hieu hieu.txt
do minh hieu
```
Bạn cũng có thể sử dụng toán tử chuyển hướng "<<" cho phép bạn nhập văn bản có thể sử dụng đầu vào chuẩn cho một lệnh.
Cú pháp để sử dụng toán tử này như sau: `command << FLAG <ENTER> text <ENTER> ... FLAG <ENTER>`
Cờ từ sẽ hoạt động như một chỉ báo rằng bạn đã kết thúc việc nhập văn bản của mình.

Sắp xếp văn bản đã nhập trong đầu vào chuẩn (giữa `<<end` và `end`) :
```
[root@localhost ~]# sort <<end
> aaa
> ccc
> bbb
> end
aaa
bbb
ccc
```

### 3. STDOUT redirection operator
">" Toán tử chuyển hướng STDOUT

Ghi kết quả của lệnh "ls -al" vào tệp "file1":
```
[root@localhost ~]# ls -la > file1.txt
[root@localhost ~]# cat file1.txt
total 32
dr-xr-x---.  2 root root  168 Nov 26 15:29 .
dr-xr-xr-x. 19 root root  267 Nov 23 12:25 ..
-rw-------.  1 root root 1249 Nov 22 10:14 anaconda-ks.cfg
-rw-------.  1 root root 1052 Nov 23 15:35 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root    0 Nov 26 15:29 file1.txt
-rw-r--r--.  1 root root   63 Nov 26 15:23 hieu.txt
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
Toán tử chuyển hướng "1>" STDOUT (giống như ">")

Ghi kết quả của lệnh "ls -al" vào tệp "file1":
```
[root@localhost ~]# ls -la 1> file2.txt
[root@localhost ~]# cat file2.txt
total 36
dr-xr-x---.  2 root root  185 Nov 26 15:30 .
dr-xr-xr-x. 19 root root  267 Nov 23 12:25 ..
-rw-------.  1 root root 1249 Nov 22 10:14 anaconda-ks.cfg
-rw-------.  1 root root 1052 Nov 23 15:35 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root  586 Nov 26 15:29 file1.txt
-rw-r--r--.  1 root root    0 Nov 26 15:30 file2.txt
-rw-r--r--.  1 root root   63 Nov 26 15:23 hieu.txt
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
">>" Toán tử chuyển hướng STDOUT + nối thêm

Nối kết quả của lệnh "ls -al" trong tệp "hieu.txt":
```
[root@localhost ~]# ls -la >> hieu.txt
[root@localhost ~]# cat hieu.txt
do minh hieu
do minh trang
nguyen thi thanh hien
do xuan thang
total 40
dr-xr-x---.  2 root root  185 Nov 26 15:30 .
dr-xr-xr-x. 19 root root  267 Nov 23 12:25 ..
-rw-------.  1 root root 1249 Nov 22 10:14 anaconda-ks.cfg
-rw-------.  1 root root 1052 Nov 23 15:35 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root  586 Nov 26 15:29 file1.txt
-rw-r--r--.  1 root root  639 Nov 26 15:30 file2.txt
-rw-r--r--.  1 root root   63 Nov 26 15:23 hieu.txt
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
Cách khác giống ">"
```
ls -la 1>> hieu.txt
```
### 4. STDERR redirection operator
Toán tử chuyển hướng "2>" STDERR

Viết lỗi (ls: -: No such file or directory) của lệnh "ls -" vào trong tệp "file1":
```
[root@localhost ~]# ls - 2> file1
[root@localhost ~]# cat file1
ls: cannot access -: No such file or directory
```
"2>>" Toán tử chuyển hướng STDERR + nối thêm

Nối lỗi (ls: -: No such file or directory) của lệnh "ls -" vào trong tệp "file1":
```
[root@localhost ~]# ls - 2>> file1
[root@localhost ~]# cat file1
ls: cannot access -: No such file or directory
ls: cannot access -: No such file or directory
```

### 5. Redirect the output to another "stream"(Chuyển hướng đầu ra đến một "luồng" khác)
" 1>&2" chuyển hướng STDOUT đến cùng một "luồng" như STDERR

Viết / nối kết quả của lệnh " ls -al" vào cùng một "luồng" như STDERR ("file1"):
```
[root@localhost ~]# ls -al 2> file1 1>&2

[root@localhost ~]# cat file1
total 32
dr-xr-x---.  2 root root  164 Nov 26 15:45 .
dr-xr-xr-x. 19 root root  267 Nov 23 12:25 ..
-rw-------.  1 root root 1249 Nov 22 10:14 anaconda-ks.cfg
-rw-------.  1 root root 1052 Nov 23 15:35 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root    0 Nov 26 15:52 file1
-rw-r--r--.  1 root root  702 Nov 26 15:32 hieu.txt
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
```
 ls -al 2>> file1 1>&2
```
" 2>&1" chuyển hướng STDERR đến cùng một "luồng" như STDOUT

Ghi / nối lỗi ( ls: -: No such file or directory) của lệnh " ls -" vào cùng một "luồng" như STDOUT ("file1"):
```
$ ls - > file1 2>&1

$ ls - >> file1 2>&1

$ ls - 1> file1 2>&1

$ ls - 1>> file1 2>&1
```
Chuyển hướng lỗi đến /dev/null:
```
ls - > file1 2>/dev/null
```

### 6. Redirect both STDOUT and STDERR to the same "stream"(Chuyển hướng cả STDOUT và STDERR đến cùng một "luồng")
" &>" cả toán tử chuyển hướng STDOUT và STDERR
* Ghi kết quả của comand " ls -al" vào tệp "file1"
```
[root@localhost ~]# ls -al &> file1
[root@localhost ~]# cat file1
total 32
dr-xr-x---.  2 root root  164 Nov 26 15:45 .
dr-xr-xr-x. 19 root root  267 Nov 23 12:25 ..
-rw-------.  1 root root 1249 Nov 22 10:14 anaconda-ks.cfg
-rw-------.  1 root root 1052 Nov 23 15:35 .bash_history
-rw-r--r--.  1 root root   18 Dec 29  2013 .bash_logout
-rw-r--r--.  1 root root  176 Dec 29  2013 .bash_profile
-rw-r--r--.  1 root root  176 Dec 29  2013 .bashrc
-rw-r--r--.  1 root root  100 Dec 29  2013 .cshrc
-rw-r--r--.  1 root root    0 Nov 26 16:01 file1
-rw-r--r--.  1 root root  702 Nov 26 15:32 hieu.txt
-rw-r--r--.  1 root root  129 Dec 29  2013 .tcshrc
```
* Viết lỗi ( ls: -: No such file or directory) của comand " ls -" trong tệp "file1":
```
[root@localhost ~]# ls - &> file1
[root@localhost ~]# cat file1
ls: cannot access -: No such file or directory
```

### 7. pipe operator
pipe toán tử chuyển hướng đầu ra của một lệnh (ở bên trái của đường ống) như là đầu vào của lệnh tiếp theo (ở bên phải của đường ống).
```
[root@localhost ~]# cat hieu.txt | grep trang
do minh trang
```
### 8. tee command
tee lệnh chuyển hướng đầu ra của một tập lệnh đến các tệp và STDOUT.
```
[root@localhost ~]# ls -1 | tee files
anaconda-ks.cfg
file1
files
hieu.txt
```


