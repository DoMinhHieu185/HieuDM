# Tìm hiểu Crontab

### I, Crontab là gì?
Cron là một tiện ích cho phép chạy các dòng lệnh theo một chu kỳ thời gian nào đó. Crond là một daemon process, điều này cho phép nó chạy ngầm mãi mãi trong hệ thống linux.

Crrontab(hay Crontable) là bảng chứa các câu lệnh cài đặt của cron. Nhờ có crontab, ta có thể sử dụng để có thể chạy những công việc tự động theo một lịch trình cụ thể đã cài đặt từ trước.

![](/Linux/image/contab-2.png)

### II, Cách thức hoạt động 
Một cron schedule đơn giản là một text file. Mỗi người dùng có một cron schedule riêng, file này thường nằm ở /var/spool/cron . Crontab files không cho phép bạn tạo hoặc chỉnh sửa trực tiếp với bất kỳ trình text editor nào, trừ phi bạn dùng lệnh crontab.

Một số lệnh thường dùng:
```
crontab -e  #tạo hoặc sửa file crontab 
crontab -l  #hiển thị file crontab 
crontab -r  #xóa file crontab
```

Thông thường, trên một số máy vps đã được cài sẵn tiện ích cron. Ta có thể kiểm tra bằng cách gõ `crontab -l`. Nếu máy thông báo lỗi cú pháp của crontab thì máy của bạn chưa được cài đặt tiện ích này.

Để cài đặt, bạn gõ lệnh như sau:
```
sudo yum -y install cronie
```
Khởi chạy crontab và tự khởi động khi đăng nhập:
```
systemctl start crond
systemctl enable crond
```

Dịch vụ cron sẽ check các file trong thư mục /var/spool/cron và /ect/cron.d, và file /etc/anacrontab. Các file này chứa nội dung xác định các công việc mà cron phải chạy trong những khoảng thời gian khác nhau. File cron của người dùng cá nhân được đặt trong /var/spool/cron. Các dịch vụ và ứng dụng hệ thống thường sẽ thêm các file công việc của cron vào /etc/cron.d.

### III, Cấu trúc file crontab
Một crontab file thường có 5 trường thiết lập thời gian, cuối cùng là lệnh sẽ được chạy định kỳ như sau:
```
*     *     *     *     *     command to be executed
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +----- day of week (0 - 6) (Sunday=0)
|     |     |     +------- month (1 - 12)
|     |     +--------- day of month (1 - 31)
|     +----------- hour (0 - 23)
+------------- min (0 - 59)
```

Nếu một cột được gán ký tự *, nó có nghĩa là tác vụ sau đó sẽ được chạy ở mọi giá trị cho cột đó.

```
| Field | Giải thích       | Giá trị cho phép          |
|-------|------------------|---------------------------|
| MIN   | phút             | 0 to 59                   |
| HOUR  | Giờ              | 0 to 23                   |
| DOM   | Ngày trong tháng | 1-31                      |
| MON   | Tháng            | 1-12                      |
| DOW   | Ngày trong tuần  | 0-6                       |
| CMD   | Lệnh             | Các lệnh có thể thực hiện |
```

Ví dụ: 
* Chạy một bash script 5 phút 1 lần:
```
5 * * * * sh simplescript.sh
```

* Chạy một python script vào 4h30 sáng thứ 5 hàng tuần:
```
30 4 * * 4 python3 pythonscript.py
```

* Tạo 1 tác vụ thực hiện 2 lần trong một ngày
```
00 07,21  * * * sh simplescript.sh
```
Chay script: 2 lần trong một ngày lúc 7:00 và 21:00 hàng ngày.

* Tạo một tác vụ chỉ thực hiện vào các giờ cụ thể(từ thứ 2 đến thứ 6)
```
00 09-18 * * 1-5 sh simplescript.sh
```
  > Lưu ý: để chạy các script, bạn phải thông báo môi trường chạy cho script đó.

### IV, Giới hạn truy cập cron trong crontab Linux
Việc thường xuyên sử dụng cron có thể dẫn đến một số lỗi, chẳng hạn như tài nguyên hệ thống (bộ nhớ, CPU…) bị sử dụng quá mức. Do đó, sysadmin có thể giới hạn quyền truy cập của người dùng để hạn chế lỗi xảy ra. Cụ thể, hãy tạo một file /ect/cron.allow, chứa danh sách người dùng có quyền tạo cron job. Tuy nhiên, người dùng root không thể bị chặn sử dụng cron.

Bằng cách ngăn người dùng non-root tạo cron job, các root có thể sẽ cần thêm các cron job vào root crontab. Tuy nhiên, việc này sẽ không chạy các job đó dưới quyền root.

Ví dụ sau đầy cho thấy một định nghĩa job, chạy dưới quyền người dùng là “student”:
```
04 07 * * * student /usr/local/bin/mycronjob.sh
```
Nếu không có người dùng được chỉ định, job sẽ chạy theo người dùng sở hữu file crontab. Trong trường hợp này chính là root.

### V, Một số chuỗi từ khóa contab đặc biệt
```
@reboot         Chạy một lần mỗi khi khởi động lại
@yearly          Chạy một lần mỗi năm    "0 0 1 1 *"
@annually     (Tương tự @yearly)
@monthly     Chạy  mỗi tháng một lần  "0 0 1 * *"
@weekly       Chạy mỗi tuần một lần  "0 0 * * 0"
@daily           Chạy một lần mỗi ngày    "0 0 * * *"
@midnight   (Tương tự @daily)
@hourly        Chạy một lần mỗi giờ    "0 * * * *"
```
* Chạy mỗi khi khởi động lại vps / server.
```
@reboot sh /bin/execute/this/script.sh
```
