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
## 6 – Truy cập thư mục
- #cd {thư mục}
- ví dụ: cd /hieu
## 7 - liệt kê nội dung thư mục
- #ls [-x / -l -a] {thư mục}
- #ls -x  // hiển thị thư mục nhiều cột
- #ls -l  // hiển thị chi tiết thông tin tập tin
- #ls -a  // hiển thị tất cả các tập tin, kể cả tập tin ẩn 
- ví dụ: ls -l /etc
## 8 - Tạo và xóa thư mục
- #mkdir {thư mục} // Tạo thư mục
- Ví dụ:
  - #cd /etc
  - #mkdir hieu.txt
- #rmdir {thư mục} // Xóa thư mục
- Ví dụ:
  - #cd /etc
  - #rmdir hieu.txt
## 9 – Xem tập tin văn bản
- #cat {tập tin}
- Ví dụ: cat /etc/test.txt
- #more {tập tin} // Xem tập tin theo từng trang màn hình
- Ví dụ : more /etc/passwd
## 10 – Sao chép tập tin
- #cp <tập-tin-nguồn> <tập-tin-đích>
-Ví dụ: 
  - #cp /etc/passwd /root/passwd
  
