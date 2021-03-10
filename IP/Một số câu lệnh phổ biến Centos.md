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
- #ln /usr/hieu /user/test
- #ln <nguồn> <đích>
- Chú ý : Nếu có sự thay đổi của nguồn thì đích sẽ thay đổi
## 4. Quản lí dung lượng đĩa, ram
Dung lượng đĩa:
- #df -h //Liệt kê file system
- #fdisk -l //Liệt kê partition

Ram:
- #free -m
## 5. Xác định vị trí thư mục hiện tại
- #pwd