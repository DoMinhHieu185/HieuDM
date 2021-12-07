# Chapter 28: Process substitution(Thay thế quy trình)
### Section 28.1: Compare two files from the web(So sánh hai tệp từ web)
So sánh hai tệp có sự khác biệt bằng cách sử dụng thay thế quy trình thay vì tạo tệp tạm thời.

```
diff <(curl http://www.example.com/page1) <(curl http://www.example.com/page2)
```

### Section 28.3: Concatenating files(Nối các tệp)
Bạn không thể sử dụng cùng một tệp cho đầu vào và đầu ra trong cùng một lệnh
```
[root@localhost ~]# cat do.txt hieu.txt >hieu.txt
cat: hieu.txt: input file is output file
```
không làm những gì bạn muốn. Vào thời điểm `cat` đọc hieu.txt , nó đã bị cắt bớt bởi chuyển hướng và nó trống. Kết quả cuối cùng sẽ là hieu.txt sẽ chỉ chứa nội dung của do.txt 

Người ta có thể nghĩ rằng để tránh điều này bằng cách thay thế quy trình, tức là lệnh
```
[root@localhost ~]# cat do.txt <(cat hieu.txt)> hieu.txt
```
Sẽ buộc nội dung gốc của `hieu.txt` bằng cách nào đó được lưu vào bộ đệm nào đó ở đâu đó trước khi tệp bị cắt ngắn bởi sự chuyển hướng. Nó không hoạt động. `cat` trong ngoặc đơn bắt đầu đọc tệp chỉ sau khi tất cả các ký tự đệ trình đã được thiết lập, giống như tệp bên ngoài. Không có ích gì khi cố gắng sử dụng thay thế quy trình trong trường hợp này.

Cách duy nhất để thêm một tệp vào một tệp khác là tạo một tệp trung gian:
```
[root@localhost ~]# cat do.txt hieu.txt >hieu.txt.new
[root@localhost ~]# mv hieu.txt.new hieu.txt
mv: overwrite ‘hieu.txt’? y
```
Khi đó là những gì sed hoặc perl hoặc các chương trình tương tự thực hiện bên dưới khi được gọi với tùy chọn chỉnh sửa tại chỗ

### Section 28.4: Stream a file through multiple programs at once(Truyền một tệp qua nhiều chương trình cùng một lúc)
Điều này đếm số dòng trong một tệp lớn bằng `wc -l` trong khi nén đồng thời bằng gzip. Cả 2 đều chạy đồng thời
```
[root@localhost ~]# tee >(wc -l >&2)< hieu.txt | gzip > hieu.txt.gz
2
[root@localhost ~]# ls
anaconda-ks.cfg  do.txt  hieu.txt  hieu.txt.gz  test.sh
```
Thông thường `tee` ghi đầu vào của nó vào một hoặc nhiều tệp (và stdout). Chúng ta có thể ghi vào các lệnh thay về các tệp có `tee > (command)` 

Ở đây, lệnh `wc -l >&2` đếm các dòng được đọc bởi `tee` (lần lượt được đọc từ file). (Số dòng được gửi đến stderr(>&2) để tránh lẫn lộn với đầu vào cho `gzip`). Stdout của tee được đồng thời đưa vào `gzip`

### Section 28.5: With paste command
Thay thế quy trình bằng lệnh paste là phổ biến. Để so sánh nội dung của hai thư mục.
```
[root@localhost ~]# paste <(ls dir1) <(ls dir2)
hieu1   hieu4
hieu2   hieu5
hieu3   hieu6
```

### Section 28.6: To avoid usage of a sub-shell(Để tránh sử dụng sub-shell)
Một khía canh chính của thay thế quy trình là có cho phép chúng ta trính sủ dụng sub-shell khi đặt các lệnh từ trình bao.

Điều này có thể được chứng minh bằng một ví dụ đơn giản dưới đây. Tôi có các tệp sau trong thư mục của mình:
```
[root@localhost ~]# find . -maxdepth 1 -type f -print
./.bash_logout
./.bash_profile
./.bashrc
./.cshrc
./.tcshrc
./anaconda-ks.cfg
./test.sh
./do.txt
./hieu.txt
./hieu.txt.gz
```

