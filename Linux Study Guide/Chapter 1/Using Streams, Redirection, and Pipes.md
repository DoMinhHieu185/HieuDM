# Using Streams, Redirection, and Pipes
### Redirecting Input and Output (Chuyển hướng đầu vào và đầu ra)
Khi các lệnh được thực thi, theo mặc định sẽ có 3 luồng: 

1. Đầu vào tiêu chuẩn hoặc stdin
2. Đầu ra tiêu chuẩn hoặc stdout
3. Lỗi tiêu chuẩn hoặc stderr

Trong Linux, tất cả các tệp đang mở được thể hiện bên trong bằng cái được gọi là bộ mô tả tệp. Nói một cách đơn giản, chúng được biểu thị bằng các số bắt đầu từ số 0. Các stdin là tập tin mô tả 0, stdout là tập tin mô tả 1, và stderr là mô tả tập tin 2.

#### Handling Standard Output(Xử lý đầu ra tiêu chuẩn)
* STDOUT là bạn có thể chuyển hướng nó thông qua các toán tử chuyển hướng trên dòng lệnh. Toán tử chuyển hướng cho phép bạn thay đổi hành vi mặc định của nơi gửi đầu vào và đầu ra. Đối với STDOUT, bạn chuyển hướng đầu ra bằng toán tử ">"
* **Ví dụ 1**: Chuyển hướng đầu ra lệnh grep vào file `stdout.txt`
```
[root@localhost ~]# grep hieu /etc/passwd
hieu:x:1000:1000::/home/hieu:/bin/bash
```
```
[root@localhost ~]# grep hieu /etc/passwd > stdout.txt
```
```
[root@localhost ~]# cat stdout.txt
hieu:x:1000:1000::/home/hieu:/bin/bash
```
* Sử dụng toán tử ">>" để nối tiếp đầu ra lệnh vào file `stdout.txt`
```
[root@localhost ~]# echo "My name is Hieu" >> stdout.txt
[root@localhost ~]# cat stdout.txt
hieu:x:1000:1000::/home/hieu:/bin/bash
My name is Hieu
```

#### Redirecting Standard Error(Chuyển hướng lỗi tiêu chuẩn)
* Toán tử chuyển hướng cơ bản để gửi STDERR tới một tệp là toán tử "2>"
Ghi lỗi vào tệp err.txt
```
[root@localhost ~]# cat dominhhieu.txt
cat: dominhhieu.txt: No such file or directory
```
```
[root@localhost ~]# cat dominhhieu.txt 2> err.txt
```
```
[root@localhost ~]# cat err.txt
cat: dominhhieu.txt: No such file or directory
```
#### Regulating Standard Input(Quy định đầu vào tiêu chuẩn)
Sử dụng nguồn đầu vào là file num.txt.
```
[root@localhost ~]# cat num.txt
1 2 3 4 5 6 7
[root@localhost ~]#  tr " " "," < num.txt
1,2,3,4,5,6,7
```

### Piping Data between Programs (Dữ liệu đường ống giữa các chương trình)
* Với pipe, bạn có thể chuyển hướng STDOUT, STDIN và STDERR giữa nhiều liên kết trên một dòng lệnh.
* đầu ra của `COMMAND1` thành đầu vào của `COMMAND2`.
* Cú pháp
```
COMMAND1 | COMMAND2 [| COMMANDN]…
```
* **Ví dụ**:
```
[root@localhost ~]# grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /var/log/secure | sort | uniq -c | sort -n
      1 0.0.0.0
      2 192.168.122.1
```

### Using `sed`
* Lệnh `sed` để gọi trình chỉnh sửa luồng.
* Tiện ích `sed` chỉnh sửa luồng dữ liệu văn bản dựa trên một nhóm lệnh bạn cung cấp trước thời hạn.
* Trình soạn thảo sed thay đổi dữ liệu dựa trên các lệnh được nhập vào dòng lệnh hoặc được lưu trữ trong tệp văn bản. Quá trình mà trình chỉnh sửa trải qua như sau:
  * 1. Đọc một dòng văn bản tại một thời điểm từ luồng đầu vào
  * 2. Khớp văn bản đó với các lệnh soạn thảo được cung cấp
  * 3. Sửa đổi văn bản như được chỉ định trong các lệnh
  * 4. Hiển thị văn bản đã sửa đổi
* Sau khi trình chỉnh sửa sed khớp với tất cả các lệnh được chỉ định với một dòng văn bản, nó sẽ đọc dòng văn bản tiếp theo và lặp lại quy trình biên tập
* Khi sed đến cuối các dòng văn bản, nó sẽ dừng lại.
* cú pháp cơ bản của lệnh:
```
sed [OPTIONS] [SCRIPT]… [FILENAME]
```
* Theo mặc định, sed sẽ sử dụng văn bản từ STDIN để sửa đổi nó theo chỉ địnhcác lệnh
* **Ví dụ**: Sử dụng `sed` command để chỉnh sửa file( Thay thế văn bản trong file) mà không cần mở file. 
- Thay thế cake thành donuts:

```
[root@centos7 ~]# echo "I like cake." | sed 's/cake/donuts/'
I like donuts.
```

- Nếu có nhiều biến cake, thì ta phải sử dụng `g` để đặt thành global, lúc đó tất cả các biến mới được thay thế. 

```
[root@centos7 ~]# echo "I love cake and more cake." | sed 's/cake/donuts/'
I love donuts and more cake.
```

```
[root@centos7 ~]#  echo "I love cake and more cake." | sed 's/cake/donuts/g'
I love donuts and more donuts.
```

* Sửa file
```
[root@localhost ~]# cat dohieu.txt
do minh hieu
do minh hieu
i love music
I'm a good boy
thank
```
```
[root@localhost ~]# sed 's/hieu/trang/' dohieu.txt
do minh trang
do minh trang
i love music
I'm a good boy
thank
```
* Xóa 1 từ trong file
```
[root@localhost ~]# sed '/thank/d' dohieu.txt
do minh hieu
do minh hieu
i love music
I'm a good boy

```
* Nếu muốn thay đổi diễn ra hoàn toàn trong file, sử dụng tùy chọn -i.
```
[root@localhost ~]# sed -i 's/hieu/trang/' dohieu.txt
[root@localhost ~]# cat dohieu.txt
do minh trang
do minh trang
i love music
I'm a good boy
thank

```
#### Generating Command Lines
* Sử dụng xargs command để xây dựng và thực thi các lệnh từ đầu vào tiêu chuẩn.
VD: Tạo các thư mục `Folder`, `Folder1`, `Folder2`: 

```
echo "file1 file2 file 3" | xargs mkdir
```
```
[root@centos7 ~]# ls -l | grep "Folder"
drwxr-xr-x. 2 root root    6 Mar  1 18:45 Folder
drwxr-xr-x. 2 root root    6 Mar  1 18:45 Folder1
drwxr-xr-x. 2 root root    6 Mar  1 18:45 Folder2
```
* Bằng cách chuyển STDOUT từ các lệnh khác vào tiện ích xargs, bạn có thể xây dựng các lệnh dòng lệnh một cách nhanh chóng.