# Pipelines
### Section 43.1: Using |&
`|&` kết nối đầu ra tiêu chuẩn và lỗi tiêu chuẩn của lệnh đầu tiên với lệnh thứ hai trong khi | chỉ kết nốiđầu ra tiêu chuẩn của lệnh đầu tiên đến lệnh thứ hai

### Section 43.2: Show all processes paginated(Hiển thị tất cả các quy trình được phân trang)
```
ps -e | less
```
`ps -e` hiển thị tất cả các quá trình, đầu ra của nó được kết nối với đầu vào của nhiều hơn thông qua |, `less` phân trang kết quả 

### Section 43.3: Modify continuous output of a command(Sửa đổi đầu ra liên tục của một lệnh)
```
[root@localhost ~]# ping google.com | grep -o '^[0-9]\+[^()]\+'
64 bytes from hkg12s35-in-f14.1e100.net
64 bytes from hkg12s35-in-f14.1e100.net
64 bytes from hkg12s35-in-f14.1e100.net
64 bytes from hkg12s35-in-f14.1e100.net
64 bytes from hkg12s35-in-f14.1e100.net
64 bytes from hkg12s35-in-f14.1e100.net
```
Các pipe ( | ) kết nối các thiết bị xuất chuẩn của `ping` đến stdin của `grep` , mà xử lý nó ngay lập tức. Vài lệnh khác như sed mặc định để đệm stdin của chúng , có nghĩa là nó phải nhận đủ dữ liệu, trước khi xuất bất cứ thứ gì, có thể gây ra sự chậm trễ trong quá trình xử lý tiếp theo