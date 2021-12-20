# Chuỗi lệnh và hoạt động
Có một số phương tiện để xâu chuỗi các lệnh lại với nhau. Những cái đơn giản như ký tự ; hoặc phức tạp hơn như chuỗi logic chạy tùy thuộc vào một số điều kiện. Lệnh thứ ba là lệnh đường ống pipe, chuyển giao dữ liệu đầu ra một cách hiệu quả cho lệnh tiếp theo trong chuỗi.
### Section 48.1: Counting a text pattern ocurrence(Đếm tỷ lệ xuất hiện của một mẫu văn bản)
Sử dụng một pipe làm đầu ra của một lệnh trở thành đầu vào của lệnh tiếp theo.
```
ls -1 | grep -c ".conf"
```
Trong trường hợp này, đầu ra của lệnh ls được sử dụng làm đầu vào của lệnh grep. Kết quả sẽ là số lượng tệp có hậu tố .config trong tên của chúng.

Điều này có thể được sử dụng để cấu trúc chuỗi các lệnh tiếp theo miễn là cần thiết:
```
s -1 | grep ".conf" | grep -c .
```

### Section 48.2: transfer root cmd output to user file(Chuyển đầu ra root cmd sang tệp người dùng)
Thường thì một người muốn hiện thị kết quả của một lệnh được thực thi bởi root cho những người khác. Lệnh tee cho phép dễ dàng ghi tệp với quyền của người dùng từ lệnh chạy dưới dạng root

Cmd tee: đọc thông tin nhập vào và viết ra kết quả vào files.
```
su -c <cmd> | tee ~/results-of-cmd.txt
```
Chỉ `<cmd>` được chạy dưới dạng root.

### Section 48.3: logical chaining of commands with && and ||(Chuỗi logic các lệnh: Với- &&, và- ||)
&& xâu chuỗi 2 lệnh. Lệnh thứ 2 chỉ chạy nếu lệnh đầu tiên thoát thành công.

|| xâu chuỗi hai lệnh nhưng lệnh thứ 2 chỉ chạy khi lệnh đầu tiên thất bại.

### Section 48.4: serial chaining of commands with semicolon(Chuỗi nối các lệnh bằng dấu chấm phẩy)
dấu chấm phẩy chỉ làm nhiệm vụ phân tách 2 câu lệnh.
```
[root@localhost ~]# echo "This is line1" ; echo "This is line2" ; echo "This is line3"
This is line1
This is line2
This is line3
```

### Section 48.5: chaining commands with |(Chuỗi lệnh với |)
Ký tự | trong shell- lấy đầu ra của lệnh bên trái và chuyển bó dưới dạng đầu vào của lệnh bên phải. Lưu ý rằng điều này được thực hiện trong subshell. Do đó, bạn không thể đặt giá trị của các biến của quá trình gọi trong một pipe.
