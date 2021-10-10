# Sử dụng lệnh `cat`
### Section 5.1: Concatenate files(Nối các tệp)
Đây là mục đích chính của `cat` là lấy thông tin từ file1, file2 và file3 rồi ghi vào file_all .
```
[root@localhost ~]# cat file1
Do
[root@localhost ~]# cat file2
Minh
[root@localhost ~]# cat file3
Hieu
[root@localhost ~]# cat file1 file2 file3 > file_all
[root@localhost ~]# cat file_all
Do
Minh
Hieu
```
`cat` cũng có thể được sử dụng tương tự để nối các tệp như một phần của đường dẫn
```
[root@localhost ~]# cat file1 file2 file3 | grep Hieu
Hieu
```

### Section 5.2: Printing the Contents of a File(In nội dung của tệp)
In ra nội dung của tệp:
```
[root@localhost ~]# cat file_all
Do
Minh
Hieu
```
Nếu tệp chứa các ký tự không phải ASCII, bạn có thể hiển thị các ký tự đó một cách tượng trưng bằng `cat -v`. Điều này có thể khá hữu ích cho các tình huống mà các nhân vật điều khiển sẽ không thể nhìn thấy được.

Tuy nhiên khi cat để hiển thị ra một văn bản quá dài thì bạn chỉ xem được phần cuối cùng còn hiển thị trên màn hình. less và more sử dụng để tương tác được nhiều hơn và có thể sử dụng mũi tên điều hướng để hiển thị văn bản.

Để chuyển nội dung của tệp làm input cho một lệnh. Câu lệnh sau đây có chức năng như lệnh cat:
```
tr A-Z a-z <file.txt 
```
Trong trường hợp nội dung cần được liệt kê ngược so với phần cuối của nó, lệnh tac ngược lại với cat liệt kê từ dòng cuối cùng
```
[root@localhost ~]# tac file_all
Hieu
Minh
Do
```
Nếu bạn muốn in nội dung có số dòng, hãy sử dụng -n với cat:
```
[root@localhost ~]# cat -n file_all
     1  Do
     2  Minh
     3  Hieu
```
### Section 5.3: Write to a file(Ghi vào tệp)
Nó sẽ cho phép bạn viết văn bản và sẽ được lưu trong một tệp có tên tệp.
```
[root@localhost ~]# cat > file1
Do Minh Hieu
AT14
[root@localhost ~]# cat file1
Do Minh Hieu
AT14
```
```
[root@localhost ~]# cat >> file1
0965510185
Yen Bai
[root@localhost ~]# cat file1
Do Minh Hieu
AT14
0965510185
Yen Bai
```
* `>` Bash sẽ xóa hết dữ liệu có trong file và viết dữ liệu mà bạn nhập vào file

* `>>` Bash sẽ ghi tiếp dữ liệu mà bạn nhập vào file

* Khi bạn muốn kết thúc thực hiện tổ hợp phím `Ctrl + d`

### Section 5.4: Show non printable characters(Hiển thị các ký tự không in được)
Điều này rất hữu ích để xem liệu có bất kỳ ký tự không thể in được hoặc ký tự không phải ASCII nào không
```
[root@localhost ~]# echo '” ' | cat -vE
M-bM-^@M-^] $
```
Bạn cũng có thể muốn sử dụng `cat -A` (A for All) tương đương với `cat -vET`. Nó sẽ hiển thị các ký tự TAB (dưới dạng ^ I), các ký tự không in được và cuối mỗi dòng:

### Section 5.5: Read from standard input(Đọc từ đầu vào chuẩn)
```
[root@localhost ~]# cat < file_all
Do
Minh
Hieu
```
Đầu ra giống như `cat file_all`, nhưng nó đọc nội dung của tệp từ đầu vào chuẩn thay vì trực tiếp từ tệp.
```
[root@localhost ~]# printf "first line\nSecond line\n" | cat -n
     1  first line
     2  Second line
```
Lệnh echo trước dấu (|) để xuất ra hai dòng. Lệnh `cat` sau dấu (|) hoạt động trên đầu ra để thêm số dòng.

### Section 5.6: Display line numbers with output(Hiển thị số dòng với đầu ra)
Sử dụng cờ `--number` để in số dòng trước mỗi dòng. Ngoài ra, `-n` cũng làm điều tương tự.
```
[root@localhost ~]# cat --number file_all
     1  Do
     2  Minh
     3
     4  Hieu
```
Để bỏ qua các dòng trống khi đếm dòng, hãy sử dụng `--number-nonblank` hoặc đơn giản là `-b`.
```
[root@localhost ~]# cat -b file_all
     1  Do
     2  Minh

     3  Hieu
```

### Section 5.7: Concatenate gzipped files(Nối các tệp đã nén)
Các tệp được nén bởi gzip có thể được nối trực tiếp thành các tệp gzipped lớn hơn
```
[root@localhost ~]# gzip file1 file2 file3
[root@localhost ~]# ls
anaconda-ks.cfg  cat.txt  dohieu  file  file1.gz  file2.gz  file3.gz  file_all  hello.sh  hieu.txt
[root@localhost ~]# cat file1.gz file2.gz file3.gz > combined.gz
```
```
[root@localhost ~]# gunzip combined.gz
[root@localhost ~]# cat combined
Do
Minh
Minh
Hieu
```
Khi thực hiện lệnh trên thì sẽ nén file và gộp 3 file nén vào 1 file gzip chung.

Câu lệnh sau thực hiện gọn hơn mà file vẫn giữ nguyên
```
[root@localhost ~]# ls
anaconda-ks.cfg  combined.gz  dohieu  file1  file2  file3  file_all  hello.sh  hieu.txt
[root@localhost ~]# cat file1 file2 file3 | gzip > all.gz
[root@localhost ~]# ls
all.gz  anaconda-ks.cfg  combined.gz  dohieu  file1  file2  file3  file_all  hello.sh  hieu.txt
```

