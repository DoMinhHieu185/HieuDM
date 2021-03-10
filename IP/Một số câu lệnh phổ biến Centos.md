# Một số câu lệnh phổ biến
## 1. Tắt máy(shutdown)
- #init 0
- #shutdown -hy -t // tắt may sau khoảng thời gian. Đơn vị : giây(s)
- #poweroff
## 2. Khởi động hệ thống
- #init 6
- #reboot
## 3.liên kết tập tin
Bạn muốn tập tin hieu trong đường dẫn /usr/hieu sẽ xuất hiện trong thư mục /usr/test
- #ln /usr/testfile /user/test
- #ln <nguồn> <đích>