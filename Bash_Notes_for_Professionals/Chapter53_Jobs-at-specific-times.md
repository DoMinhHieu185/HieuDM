# Jobs tại thời điểm cụ thể
### Section 53.1: Execute job once at specific time(Thực hiện job một lần tại một thời điểm cụ thể)
Lưu ý: `at` không được cài đặt theo mặc định trên hầu hết các bản phân phối mới.

Để thực hiện công việc một lần vào một thời điểm nào đó mà không phải lúc này, Trong ví dụ là 5 giờ chiều, bạn có thể sử dụng
```
echo "somecommand &" | at 5pm
```
Thêm nhiều định dạng thời gian hơn
```
echo "somecommand &" | at now + 2 minutes
echo "somecommand &" | at 17:00
echo "somecommand &" | at 17:00 Jul 7
echo "somecommand &" | at 4pm 12.03.17
```
Nếu không có năm hoặc ngày tháng nào được đưa ra, nó sẽ giả sử thời gian bạn chỉ định vào lần tiếp theo. Vì vậy, nếu bạn đưa ra một giờ đã trôi qua hôm nay, nó sẽ giả sử vào ngày mai và nếu bạn đưa ra 1 tháng đã trôi qua trong năm nay, nó sẽ giả sử vào năm sau.

Điều này cũng hoạt động cùng với `nohup` như bạn mong đợi:
```
echo "nohup somecommand > out.txt 2>err.txt &" | at 5pm
```
Có một số lệnh để kiểm soát các công việc được hẹn giờ:

  * atq liệt kê tất cả các công việc được hẹn giờ(atqueue)
  * atrm loại bỏ công việc đã hẹn giờ(atremove) Tất cả các lệnh áp dụng cho các công việc của người dùng đã đăng nhập. Nếu đăng nhập bằng quyền root, tất nhiên là các công việc trên toàn hệ thống sẽ được xử lý.

### Section 53.2: Doing jobs at specified times repeatedly using systemd.timer(Thực hiện các công việc vào những thời điểm cụ thể lặp đi lặp lại bằng cách sử dụng systemd.timer)
`systemd` cung cấp 1 triển khai hiện tại của cron. Để thực thi một tệp lệnh bất kỳ, cần có một dịch vụ và một tệp bộ đến thời gian. Các tệp dịch vụ và bộ hẹn giờ phải được đặt trong `/etc/systemd/{system,user}`
```
[Unit]
Description=Kịch bản hoặc chương trình của tôi làm tốt nhất và đây là mô tả
[Service]
# type là quan trọng
Type=simple
# program|script để gọi. Luôn sử dụng các path/đường dẫn tuyệt đối và 
# chuyển hướng STDIN & STDERR vì không có thiết bị đầu cuối trong khi 
#thực thi
ExecStart=/absolute/path/to/someCommand >>/path/to/output 2>/path/to/STDERRoutput
#[Install]
#WantedBy=multi-user.target
```
Tiếp theo tệp hẹn giờ:
```
[Unit]
Description=my very first systemd timer
[Timer]
# Cú pháp cho thông số ngày/giờ Y-m-d H:M:S
# a * = từng(từng giờ, từng phút, mỗi giờ 1 lần, mỗi ngày 1/n lần), và các danh mục được phân tách bằng dấu phẩy cũng có thể được cung cấp
# *-*-* *,15,30,45:00 Cho biết hàng năm, hàng tháng, hàng ngày, hàng giờ 
#ở phút 15,30,45 và 0 giây

OnCalendar=*-*-* *:01:00
# Cái này chạy mỗi giờ ở 1 phút 0 giây e.g. 13:01:00
```
