# crontab
### 1. Notes
Lệnh crontab được sử dụng để quản lý danh sách các lệnh phải chạy theo một lịch trình cụ thể.

Mỗi người dùng có thể có crontab của riêng mình.

Nếu tệp " /usr/lib/cron/cron.allow" tồn tại, thì tên người dùng phải được liệt kê trong đó, nếu không người dùng sẽ không được phép sử dụng lệnh crontab.

Nếu tệp " /usr/lib/cron/cron.deny" tồn tại, thì tên người dùng không được liệt kê trong đó, nếu không người dùng sẽ không được phép sử dụng lệnh crontab.

### 2. Examples
Quản lý crontab của người dùng hiện tại
```
$ crontab -e
# this command "echo `date` >> /home/user1/crontab_test.log" will be executed every minute
* * * * * echo `date` >> /home/user1/crontab_test.log
```
Lưu và thoát. Bạn sẽ thấy các thông báo sau trong đầu ra tiêu chuẩn:
```
# crontab: no crontab for user1 - using an empty one
# crontab: installing new crontab
```
Bạn có thể kiểm tra xem crontab đã được cài đặt chưa
```
$ crontab -l
* * * * * echo `date` >> /home/user1/crontab_test.log
```
Bạn có thể liệt kê crontab của tất cả người dùng:
```
$ sudo ls -l /usr/lib/cron/tabs
-rw-------  1 root  root  284 14 Feb 09:00 user1
```
Bạn có thể kiểm tra crontab excution:
```
$ cat /home/user1/crontab_test.log
Sun Feb 25 09:01:00 EST 2014
Sun Feb 25 09:02:00 EST 2014
Sun Feb 25 09:03:00 EST 2014
Sun Feb 25 09:04:00 EST 2014
```
* Quản lý crontab của người dùng khác
```
$ sudo crontab -e -u user2
# this command "echo `date` >> /home/user2/crontab_test.log" will be executed every minute
* * * * * echo `date` >> /home/user2/crontab_test.log
```
lưu và thoát. Bạn sẽ thấy các thông báo sau trong đầu ra tiêu chuẩn:
```
crontab: no crontab for user2 - using an empty one
crontab: installing new crontab
```
Bạn có thể kiểm tra xem crontab đã được cài đặt chưa:
```
$ sudo ls -l /usr/lib/cron/tabs
-rw-------  1 root  root  285 14 Feb 09:35 user2
-rw-------  1 root  root  284 14 Feb 09:00 user1
```

