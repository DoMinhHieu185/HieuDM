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
- Ví dụ: 
  - #cp /etc/passwd /root/passwd
## 11 – Thay đổi tên tập tin hoặc di chuyển
- #mv <tên-tập-tin-cũ> <tên-tập-tin-mới>
- Ví dụ:
  - #mv /etc/testfile /opt/
## 12 – Tìm kiếm tập tin , chuỗi
- #find [đường-dẫn] -name [biểu-thức-tìm-kiếm] // Tìm kiếm tập tin
- Ví dụ:
  - #find /etc -name test // Tìm thư mục test có trong /etc nhưng không rõ đường dẫn.
- #grep [biểu-thức-tìm-kiếm] [tên-tập-tin] //Tìm kiễm chuỗi kí tự trong 1 tập tin
- Ví dụ:
  - #grep “root” /etc/passwd //tìm các dòng có root trong file passwd
## 13 – Chỉnh sửa tập tin
- #vi {tập tin}
- VD: vi /etc/test.txt
- Ấn
  - I : để sửa file
  - Esc : để thoát câu lệnh nhưng vẫn ở trong file
  - :wq! : lưu lại file sau khi sửa và quit
  - /{kí tư} : tìm kiếm file , ấn N để next kết quả
- #nano {tập tin}
- Để cài nano gõ lệnh : yum install nano -y
## 14 – Chỉnh time trong centos
- #date // Kiểm tra thời gian
- #yum install ntp -y // Cài dịch vụ NTP
- #ntpdate vn.pool.ntp.org // Chỉnh time theo múi giờ Việt Nam
## 15 – Cài / Gỡ / Cập nhật phần mềm
- #yum install {tên-phần-mềm} -y // Cài phần mềm
  - VD : yum install ntp -y
- #yum remove {tên-phần-mềm} -y // Gỡ phần mềm
  - VD : yum remove ntp -y
- #yum update {tên-phần-mềm} -y //cật nhập phần mềm
  - VD: yum update bind -y
- hoặc
- #rpm -Uvh {tên-tập-tin.rpm}
  - VD : rpm -Uvh foo-2.0-1.i386.rpm //Cập nhật phần mềm không xóa cấu hình
- #yum update -y // Cập nhật hệ thống bao gồm các phần mềm
## 16 – Nén và giải nén thư mục
- Nén thư mục hoặc tập tin :
- #gzip {tập tin}
  - VD : gzip /etc/passwd


- #tar -cvf {tập tin}
  - VD : tar -cvf /etc/passwd


- Giải nén thư mục hoặc tập tin :
- #gunzip /etc/passwd.gz
- #tar -zxvf /etc/passwd.tar

## 17 – Tạo và xóa user / group
- **Tạo và xóa user**
- #useradd {tên-user} //Tạo user
  - VD: useradd vncloud
- #userdel {tên user} //Xóa user
  - VD: userdel vncloud
- **Tạo và xóa group**
- #groupadd {tên-group} //Tạo group
  - VD: groupadd vnitnewsgroup
- #groupdel {tên-group} // Xóa group


- Gán user vào group :
- #usermod -g {tên-group} {tên-user}
  - VD: usermod -g vnitnewsgroup vnitnewsuser

## 18 – Phân quyền tập tin
- **Kiểm tra phần quyền các tập tin trong /etc**
- #cd /etc
- #ls -l 
- Có 3 quyền trong Linux: read (r) , write (r) , execute(x) tương ứng với: đọc-ghi-thực thi
- Và 3 dạng đối tượng: sở hữu (owner) , nhóm sở hữu (group owner) , người khác (other owner)
- Đối với thư mục khi ls -l sẽ có chữ d ở đầu, c cho thiết bị ngoại vi, b cho block, còn với file thì không có
  - VD: drwxr-xr-x.
- Ngoài ra, 3 quyền trong Linux sẽ có giá trị tương ứng : read = 4 , write = 2 , execute = 1
  - VD: Full quyền = read + write + execute = 4 + 2 + 1 = 7

- **Phân quyền thao tác tập tin (read – write – execute) :**
- #chmod {giá-trị-quyền} {tập-tin}
  - VD: chmod 777 testfile.txt

- **Phân quyền người dùng tập tin**
- #chown -R {tên-user:tên-nhóm} {thư-mục hoặc tập tin}
  - VD: chown -R vnitnews testfile.txt


- Thay đổi nhóm sở hữu tập tin
  - #chgrp {nhóm-sở-hữu} {thư mục hoặc tập tin }

## 19 – Tải phần mềm
- #yum install wget -y
- #wget {đường-dẫn}
  - VD: wget https://vnitnews.com/vnitnews.logo

## 20 – Cấu hình mạng Centos
- #ifconfig // Kiểm tra card mạng hiện thời
- #ifconfig -a //Kiểm tra tất cả card mạng
- Để cấu hình card mạng:
  - #vi /etc/sysconfig/network-scripts/ifcfg-eth0 //Thư mục chỉnh card mạng
- Reset card mạng:
  - #service network restart

