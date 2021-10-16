# Chuyển hướng
|Tham số||Thông tin chi tiết|
|-||-|
|bộ mô tả tệp nội bộ||Một số nguyên|
|phương hướng||Một trong số >,< hoặc <>|
bộ mô tả tệp bên ngoài hoặc đường dẫn & theo sau là một số nguyên cho bộ mô tả tệp hoặc một đường dẫn.

### Section 9.1: Redirecting standard output(Chuyển hướng đầu ra tiêu chuẩn)
`>` chuyển hướng đầu ra tiêu chuẩn (hay còn gọi là STDOUT) của lệnh hiện tại thành một tệp hoặc bộ mô tả khác.
* Các ví dụ này ghi kết quả đầu ra của lệnh ls vào tệp tin file.txt
```
[root@localhost ~]# ls >file.txt

Hoặc

[root@localhost ~]# >file.txt ls
```

* Tệp đích được tạo nếu nó không tồn tại, nếu không tệp này sẽ bị cắt bớt.
* Nếu không tồn tại hoặc không có giá trị nào được chỉ định. Lệnh sẽ in ra lỗi và STDOUT sẽ không có dữ liệu.
```
[root@localhost ~]# ls 1 > file2.txt
ls: cannot access 1: No such file or directory
```
  > Lưu ý: chuyển hướng được khởi tạo bởi shell được thực thi chứ không phải bởi lệnh được thực thi, do đó nó được thực hiện trước khi thực hiện lệnh.

### Section 9.2: Append vs Truncate(Nối và Cắt bớt)
**Truncate >**
  1. Tạo tệp được chỉ định nếu nó không tồn tại.
  2. Truncate (loại bỏ nội dung của tệp)
  3. Ghi vào tệp
```
[root@localhost ~]# echo "Dong mot" > /root/line.txt
[root@localhost ~]# echo "Dong hai" > /root/line.txt
[root@localhost ~]# cat /root/line.txt
Dong hai
```

**Append >>**
  1. Tạo tệp được chỉ định nếu nó không tồn tại.
  2. Nối tệp (viết ở cuối tệp)
```
[root@localhost ~]# echo "Dong mot" > /root/line.txt
[root@localhost ~]# echo "Dong hai" >> /root/line.txt
[root@localhost ~]# cat /root/line.txt
Dong mot
Dong hai
```

### Section 9.3: Redirecting both STDOUT and STDERR(Chuyển hướng cả STDOUT và STDERR)
Các bộ mô tả tệp như 0 và 1 là các con trỏ. Chúng tôi thay đổi những gì mà bộ mô tả tệp trỏ đến bằng chuyển hướng. `> /dev/null` có nghĩa là 1 điểm đến `/dev/null`.  /dev/null-là một tệp Thiết bị giả và thuộc loại tệp ký tự đặc biệt, chập nhận và loại bỏ tất cả đầu vào được ghi vào nó.

Mọi thứ trong linux đều là một file, ngay cả các STDIN, STDOUT,STDERR cũng đều là file. Mỗi file đều có một định danh gì đó để có thể cầm lắm hay thao tác được. Còn /dev/null cũng là một device hay cũng là một file đặc biệt trong linux thường được sử dụng để chứa các dữ liệu rác từ các Input stream khi chúng ta không muốn sử lý hay muốn hiển thị nó.

Đầu tiên chúng ta trỏ 1 (STDOUT) vào / dev / null sau đó trỏ 2 (STDERR) vào bất kỳ 1 điểm nào.
```
echo 'hello' > /dev/null 2>&1
```

### Section 9.4: Using named pipes(Sử dụng các đường ống được đặt tên)
Đôi khi bạn có thể muốn xuất một cái gì đó bằng một chương trình và nhập nó vào một chương trình khác, nhưng không thể sử dụng một đường ống tiêu chuẩn.
```
[root@localhost ~]# ls -l |  grep 'h'
drwxr-xr-x. 2 root root    6 Oct  8 15:26 dohieu
-rwxr-xr-x. 1 root root  343 Oct 10 14:08 hello.sh
-rw-r--r--. 1 root root   12 Oct 10 11:54 hello.txt
-rw-r--r--. 1 root root   69 Oct 10 12:01 hieu.txt
```
Bạn chỉ có thể ghi vào một tệp tạm thời:
```
[root@localhost ~]# touch pipe.txt
[root@localhost ~]# ls -l > pipe.txt
[root@localhost ~]# grep "h" < pipe.txt
drwxr-xr-x. 2 root root    6 Oct  8 15:26 dohieu
-rwxr-xr-x. 1 root root  343 Oct 10 14:08 hello.sh
-rw-r--r--. 1 root root   12 Oct 10 11:54 hello.txt
-rw-r--r--. 1 root root   69 Oct 10 12:01 hieu.txt
```
Điều này hoạt động tốt cho hầu hết các ứng dụng, tuy nhiên, sẽ không ai biết `pipe.txt` làm gì và ai đó có thể xóa nó nếu nó chứa đầu ra là ls -l trong thư mục đó. Đây là nơi mà một đường ống được đặt tên phát huy tác dụng:
```
[root@localhost ~]# mkfifo myPipe
[root@localhost ~]# ls -l > myPipe &
[1] 1934
[root@localhost ~]# grep '.txt' <myPipe
-rw-r--r--. 1 root root   12 Oct 10 11:54 hello.txt
-rw-r--r--. 1 root root   69 Oct 10 12:01 hieu.txt
-rw-r--r--. 1 root root   18 Oct 13 15:02 line.txt
-rw-r--r--. 1 root root  621 Oct 13 15:54 pipe.txt
[1]+  Done                    ls --color=auto -l > myPipe
[root@localhost ~]# ls
anaconda-ks.cfg  combined  dohieu  file1  file2  file3  file_all.gz  hello.sh  hello.txt  hieu.txt  line.txt  myPipe  pipe.txt
```
myPipe về mặt kỹ thuật là một tệp (mọi thứ đều có trong Linux), vì vậy hãy thực hiện lệnh ls -l trong một thư mục trống mà chúng ta vừa tạo một đường dẫn trong:
```
[root@localhost ~]# mkdir pipeFolder
[root@localhost ~]# cd pipeFolder
[root@localhost pipeFolder]# mkfifo myPipe
[root@localhost pipeFolder]# ls -l
total 0
prw-r--r--. 1 root root 0 Oct 13 16:09 myPipe
```
  > Lưu ý: ký tự `p` đầu tiên trong quyền, nó được liệt kê dưới dạng một đường ống, không phải tệp.
Khi tôi không sử dụng & ở cuối câu lệnh thì sẽ bị treo và hãy làm như sau:
```
[root@localhost pipeFolder]# mkfifo myPipe
[root@localhost pipeFolder]# echo "Hello from the other side" > myPipe &
[1] 1996
[root@localhost pipeFolder]# cat < myPipe
Hello from the other side
[1]+  Done                    echo "Hello from the other side" > myPipe
```
Bạn sẽ nhận thấy rằng sau khi "Hello from the other side" được xuất ra, chương trình trong thiết bị sẽ kết thúc tại đây

Named pipes có thể hữu ích cho việc di chuyển thông tin giữa các thiết bị đầu cuối hoặc giữa các chương trình.

Một số ví dụ:
```
[root@localhost ~]# { ls -l && cat line.txt; } >mypipe &
[1] 1998
[root@localhost ~]# cat < mypipe
total 28
-rw-------. 1 root root 1224 Oct  7 11:57 anaconda-ks.cfg
-rw-r--r--. 1 root root   18 Oct 10 11:45 combined
drwxr-xr-x. 2 root root    6 Oct  8 15:26 dohieu
-rw-r--r--. 1 root root   43 Oct 10 11:27 file_all.gz
-rwxr-xr-x. 1 root root  343 Oct 10 14:08 hello.sh
-rw-r--r--. 1 root root   12 Oct 10 11:54 hello.txt
-rw-r--r--. 1 root root   69 Oct 10 12:01 hieu.txt
-rw-r--r--. 1 root root   18 Oct 13 15:02 line.txt
-rw-r--r--. 1 root root    0 Oct 13 16:23 mypipe
drwxr-xr-x. 2 root root   20 Oct 13 16:14 pipeFolder
Dong mot
Dong hai
[1]+  Done                    { ls --color=auto -l && cat line.txt; } > mypipe
```
* Output: In dữ liệu `ls -l` và sau đó in nội dung `line.txt` trên màn hình

### Section 9.5: Redirection to network addresses(Chuyển hướng đến các địa chỉ mạng)
Bash coi một số đường dẫn là đặc biệt và có thể thực hiện một số giao tiếp mạng bằng cách viết thư vào `/dev/{udp|tcp}/host/port`. Bash không thể thiết lập một máy chủ lắng nghe, nhưng có thể khởi tạo kết nối và đối với TCP ít nhất có thể đọc kết quả.

Ví dụ, để gửi một yêu cầu web đơn giản
*  Lệnh exec khi sử dụng sẽ không nhận được STDOUT.
```
exec 3</dev/tcp/www.google.com/80
printf 'GET / HTTP/1.0\r\n\r\n' >&3
cat <&3
```
và kết quả của trang web sẽ được in ra STDOUT

  > exec là gì??. Lệnh exec là một công cụ mạnh mẽ để thao tác với bộ mô tả tệp (FD), tạo đầu ra và ghi lỗi trong các tập lệnh với một thay đổi nhỏ nhất. Trong Linux, theo mặc định, bộ mô tả tệp 0 là stdin (đầu vào tiêu chuẩn), 1 là stdout (đầu ra tiêu chuẩn) và 2 là stderr (lỗi tiêu chuẩn)
  > Lệnh này không tạo ra một tiến trình mới mà nó chỉ thay thế tiến trình bash hiện tại bằng lệnh được thực thi. Nếu lệnh thực thi thành công, nó sẽ không quay trở lại quá trình gọi. 

### Section 9.6: Print error messages to stderr(In thông báo lỗi ra stderr)
Thông báo lỗi thường được bao gồm trong một script cho mục đích gỡ lỗi hoặc để cung cấp trải nghiệm người dùng phong phú. Đơn giản chỉ cần viết thông báo lỗi như sau:
```
[root@localhost ~]# cmd || echo 'cmd failed'
-bash: cmd: command not found
cmd failed
```
có thể hoạt động đối với các trường hợp đơn giản nhưng không phải là cách thông thường. Trong ví dụ này, thông báo lỗi sẽ gây ô nhiễm đầu ra thực tế của tập lệnh bằng cách trộn lẫn cả lỗi và đầu ra thành công trong stdout.

Cách khác, thông báo lỗi sẽ chuyển đến stderr không phải stdout.
```
[root@localhost ~]# cmd || echo 'cmd failed' >/root/loi.txt
-bash: cmd: command not found
[root@localhost ~]# cat loi.txt
cmd failed
```
Một ví dụ khác:
```
if cmd; then
echo 'success'
else
echo 'cmd failed' >/dev/stderr
fi
```
Trong ví dụ trên, thông báo thành công sẽ được in trên stdout trong khi thông báo lỗi sẽ được in trên stder

Cách tốt hơn để in ra thông báo lỗi là xác định một hàm:
```
err(){
 echo "E: $*" >>/dev/stderr
}
```
bây giờ sử dụng function vừa tạo để in ra lỗi:
```
[root@localhost ~]# err "My error message"
E: My error message
```

### Section 9.7: Redirecting multiple commands to the same file(Chuyển hướng nhiều lệnh đến cùng một tệp)
```
[root@localhost ~]# {
> echo "Noi dung thu muc"
> ls ~
> } > output.txt
```
```
[root@localhost ~]# cat output.txt
Noi dung thu muc
anaconda-ks.cfg
combined
dohieu
file_all.gz
hello.sh
output.txt
pipeFolder
```

### Section 9.8: Redirecting STDIN(Chuyển hướng STDIN)
`<` đọc từ đối số bên phải của nó và ghi vào đối số bên trái của nó
```
[root@localhost ~]# echo "b" > list.txt
[root@localhost ~]# echo "a" >> list.txt
[root@localhost ~]# echo "c" >> list.txt
[root@localhost ~]# sort < list.txt
a
b
c
```

### Section 9.9: Redirecting STDERR(Chuyển hướng STDERR)
2 là STDERR
1 là STDOUT
0 là STDIN
```
echo_to_stderr 2>/dev/null
```
echo_to_stderr là lệnh ghi "stderr" vào STDERR
```
[root@localhost ~]# echo_to_stderr() { echo stderr >&2; }
[root@localhost ~]# echo_to_stderr
stderr
```

### Section 9.10: STDIN, STDOUT and STDERR explained(Giải thích STDIN, STDOUT và STDERR)
Các lệnh có một đầu vào (STDIN) và hai loại đầu ra, đầu ra tiêu chuẩn (STDOUT) và lỗi tiêu chuẩn(STDERR)

**STDIN**
```
[root@localhost ~]# read
Nhập văn bản vào đây
```
Đầu vào chuẩn được sử dụng để cung cấp đầu vào cho một chương trình. (Ở đây chúng ta đang sử dụng `read` được xây dựng trong để đọc một dòng từ STDIN.)

**STDOUT**
```
[root@localhost ~]# ll
total 36
-rw-------. 1 root root 1224 Oct  7 11:57 anaconda-ks.cfg
-rw-r--r--. 1 root root   18 Oct 10 11:45 combined
drwxr-xr-x. 2 root root    6 Oct  8 15:26 dohieu
-rw-r--r--. 1 root root   43 Oct 10 11:27 file_all.gz
-rwxr-xr-x. 1 root root   84 Oct 13 16:59 hello.sh
```
Đầu ra tiêu chuẩn thường được sử dụng cho đầu ra "bình thường" từ một lệnh. Ví dụ: ls liệt kê các tệp, vì vậy các tệp được gửi đến STDOUT.

**STDERR**
```
[root@localhost ~]# CMD
-bash: CMD: command not found
[root@localhost ~]# hieu
-bash: hieu: command not found
```

* Lỗi tiêu chuẩn là (như tên của nó) được sử dụng cho các thông báo lỗi. Vì thư này không phải là danh sách các tệp, nó được gửi sang STDERR
* STDIN, STDOUT và STDERR là ba luồng tiêu chuẩn. Chúng được xác định với shell bằng một con số hơn một cái tên:
  * 0 = Đầu vào tiêu chuẩn(Standard in)
  * 1 = Đầu ra tiêu chuẩn(Standard out)
  * 2 = Lỗi tiêu chuẩn(tandard error)
* Mặc dịnh STDIN là bàn phím. STDOUT và STDERR đều được xuất hiện trong thiết bị đầu cuối(màn hình, remote)
* Bạn có thể chuyển hướng STDERR hoặc STDOUT đến bất kỳ thứ gì chúng ta cần. Giả sử bạn chỉ muốn in ra màn hình STDOUT và loại bỏ tất cả cac STDERR

**Chuyển hướng STDERR đến /dev/null**
```
[root@localhost ~]# ls file anotherfile 2>/dev/null
[root@localhost ~]# ls file anotherfile
ls: cannot access file: No such file or directory
ls: cannot access anotherfile: No such file or directory
```
Bạn sẽ không thể nhận được bất kỳ đầu ra lỗi nào trên màn hình hiển thị