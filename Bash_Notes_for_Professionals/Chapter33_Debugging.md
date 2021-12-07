# Debugging(Gỡ lỗi)
### Section 33.1: Checking the syntax of a script with "-n"(Kiểm tra cú pháp của script với "-n")
Cờ -n cho phép bạn kiểm tra cú pháp của một script mà không cần phải thực thi chúng
```
[root@localhost ~]# bash -n test.sh
```

### Section 33.2: Debugging using bashdb(Gỡ lỗi bằng bashdb)
Bashdb là một tiện ích tương tự như gdb, ở chỗ bạn có thể thực hiện những việc như đặt các điểm ngắt tại một dòng hoặc tại một hàm, in nội dung của các biến, bạn có thể khởi động lại quá trình thực thi tập lệnh và hơn thế nữa.

Sau đó, bạn có thể chạy nó với tập lệnh của mình dưới dạng tham số:
```
bashdb <YOUR SCRIPT>
```
Dưới đây là một số lệnh để giúp bạn bắt đầu:
```
l - hiển thị các dòng cục bộ, nhấn l lần nữa để cuộn xuống
s - bước sang dòng tiếp theo
print $VAR - lặp lại nội dung của biến
restart - chạy lại bashscript, nó tải lại trước khi thực thi.
eval - đánh giá một số lệnh tùy chỉnh, ví dụ: eval echo hi

b đặt điểm ngắt trên một số dòng
c - tiếp tục cho đến khi điểm dừng nào đó
i b - thông tin về điểm nghỉ
d - xóa điểm ngắt tại dòng #
shell - khởi chạy một sub-shell ở giữa quá trình thực thi, điều này rất tiện lợi cho việc thao tác với các biến
```

### Section 33.3: Debugging a bash script with "-x"(Gỡ lỗi tệp lệnh bash với "-x")
Sử dụng -x để kích hoạt debug của các dòng lệnh được thực thi. Nó có thể chạy trên toàn bộ phiên hoặc tệp lệnh, hoặc được bật theo chương trình trong một tập lệnh.
```
bash -x myscript.sh
```
Hoặc
```
bash --debug myscript.sh
```
