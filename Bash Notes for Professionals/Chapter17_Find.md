# Find
Find là một lệnh dùng để tìm kiếm đệ quy một thư mục cho các tệp(hoặc thư mục) phù hợp với một tiêu chí và sau đó thực hiện một số thao tác trên các tệp đã chọn. 

### Section 17.1: Searching for a file by name or extension(Tìm kiếm một tệp theo tên hoặc phần mở rộng)
* Để tìm kiếm một tệp/ thư mục có tên cụ thể, liên quan đến pwd:
```
[root@localhost ~]# find . -name "hello.sh"
./hello.sh
```
* Tìm kiếm thư mục hoặc file có phần mở rộng cụ thể, hãy sử dụng ký tự đại diện:
```
[root@localhost ~]# find . -name "*.sh"
./hello.sh
./file1.sh
```
* Để tìm các tệp / thư mục phù hợp với một trong nhiều phần mở rộng, hãy sử dụng hoặc gắn cờ
```
[root@localhost ~]# find . -name "*.txt" -o -name "*.sh"
./hello.sh
./list.txt
./file1.sh
./hieu.txt
./loi.txt
./output.txt
```
* Tìm tệp và thư mục nằm trong mục cụ thể, nếu chỉ tìm kiếm các tệp sử dụng `-type f`, nếu chỉ tìm kiếm thư mục sử dụng `-type d`
```
find /path-directory
find /path-directory -type f
find /path-directory -type d
```

### Section 17.2: Executing commands against a found file(Thực thi các lệnh đối với một tệp được tìm thấy)
Đôi khi cúng ta sẽ cần chạy các lệnh đối với rất nhiều tệp. Điều này có thể được thực hiện bằng cách sử dụng `xargs`.
```
find /path -type d -print | xargs -r chmod 770
```
Lệnh trên sẽ tim một các đệ quy tất cả các thư mục (`-type d`) liên quan đến **/path** (thư mục làm việc) và thực thi chmod 770 trên chúng. Tùy chọn -r chỉ định để `xargs `không chạy chmod nếu không tìm thấy bất kỳ lệnh nào.

Nếu tên tệp hoặc thư mục có ký tự khoảng trắng trong đó, lệnh có thể bị nghẽn, giải pháp là
```
find /path -type d -print0 | xargs -r -0 chmod 770
```

`-print0` và `-0` là hai flag được sử dụng chỉ định rằng các tên tệp sẽ được phân tách bằng các sử dụng một byte rỗng, và cho phép sử dụng các ký tự đặc biệt, như dấu cách trong tên tệp. 

### Section 17.3: Finding file by access / modification time(Tìm tên tệp theo thời gian truy cập / sửa đổi)
Trên hệ thống mở rộng, mỗi tệp có quyền truy cập, sửa đổi và thay đổi được lưu trữ liên quan đến nó sử dụng `stat myfile.txt`; sử dụng với `find` có thể tìm kiếm các tệp đã được sửa đổi trong một khoảng thời gian nhất định.
* Tìm các tệp đã được sửa đổi trong vòng 2 giờ qua.:
```
find . -mmin -120
```
* Tìm các tệp tin không sửa đổi trong vòng 2 giờ qua:
```
find . -mmin +120
```
* Ví dụ trên chỉ tìm kiếm theo thời gian đã sửa đổi để tìm kiếm theo thời gian truy cập hoặc thời gian đã thay đổi
```
find . -amin -120 #access times
find . -cmin +120 #changed times
```
* Định dạng chung:
  * mmin n: Tệp đã được sửa đổi n phút trước
  * mmin -n: Tệp đã được thay đổi trong vòng n phút trước
  * mmin +n: Tệp đã được sửa đổi hơn n phút rồi.

* Tìm các tệp đã được sửa đổi trong vòng 2 ngày qua:
```
find . -mtime -2
```
* Tìm các tệp Không được sửa đổi trong vòng 2 ngày qua
```
find . -mtime +2
```
* Sử dụng `-atime` và `-ctime` cho thời gian truy cập và thời gian thay đổi trạng thái tương ứng.
* Định dạng chung:
  * -mtime n: File được sửa đổi trong vòng n ngày qua
  * -mtime -n: File được sửa đổi ít hơn n ngày
  * -mtime +n: File được sửa đổi nhiều hơn n ngày.

* Tìm các tệp được sửa đổi trong một phạm vi ngày, từ 01-02-2003 đến ngày 15-03-2003:
```
find . -type f -newermt 2003-02-01 ! -newermt 2003-03-15 
```

* Tìm tệp được truy cập trong một loạt dấu thời gian (sử dụng tệp làm dấu thời gian), từ 10 giờ trước đến 5 giờ trước:
```
touch -t $(date -d '10 HOUR AGO' +%Y%m%d%H%M.%S) start_date
touch -t $(date -d '5 HOUR AGO' +%Y%m%d%H%M.%S) end_date
timeout 10 find "$LOCAL_FOLDER" -newerat "start_date" ! -newerat "end_date" -print 
```

### Section 17.4: Finding files according to size(Tìm tệp theo kích thước)
* Tìm tệp lớn hơn 15MB:
```
find -type f -size +15M
```
* Tìm tệp nhỏ hơn 12KB:
```
find -type f -size -12k
```
* Tìm tệp có kích thước chính xác:
```
find -type f -size 12k
find -type f -size 12288c
find -type f -size 24b
find -type f -size 24
```
`find [options] -size n[cwbkMG]`
* Tìm tệp có kích thước n-block, trong đó +n có nghĩa là nhiều hơn n-block, -n có nghĩa là nhỏ hơn n-block và n là có nghĩa là chính xác
1. c: byte
2. w: 2bytes
3. b: 512 bytes
4. k: 1KB
5. M: 1MB
6. G: 1 GB

### Section 17.5: Filter the path(Tìm kiếm theo đường dẫn)
Tham số `-path` cho phép chỉ định một mẫu để khớp với đường dẫn của kết quả. Mẫu cũng có thể phù hợp với tên của chính nó.

* Để tìm các tệp chứa **log** ở bất kỳ đâu:
```
[root@localhost ~]# find . -type f -path '*log*'
./.bash_logout
```
* Để tìm các file có trong thư mục có tên là log ở bất kỳ đâu:
```
[root@localhost var]# find . -type f -path '*/log/*'
./log/tallylog
./log/grubby_prune_debug
```
* Tìm các tệp ngoại trừ trong thư mục bin, bin hoặc tệp tin có tên log
```
find . -type f -not -path '*/bin/*'
find . -type f -not -path '*log' -not -path '*/bin/*'
```

### Section 17.6: Finding files by type(Tìm tệp theo loại)
* Tìm tệp, sử dụng `-type f`
```
find . -type f
```
* Tìm các thư mục:
```
find . -type d
```
* Tìm block devices:
```
find /dev -type b
```
* Tìm symlinks:
```
find . -type l
```

### Section 17.7: Finding files by specific extension(Tìm tệp theo phần mở rộng cụ thể )
Ví dụ, muốn tìm tất cả các tệp các phần mở rộng là `.sh` từ thư mục hiện tại:
```
[root@localhost ~]# find . -maxdepth 1 -type f -name "*.sh"
./hello.sh
./file1.sh
```