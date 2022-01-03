# Viết chương trình gửi tin nhắn backup thành công tới Telegram

## 1. Tạo bot Telegram

Bước 1: Login vào Telegram thông qua số điện thoại

Bước 2: Tìm BotFather
Tại ô search của Telegram tìm BotFather:

![](/Linux/image/Timbot.png)

Bước 3: Tạo Bot
Chat /newbot vào khung chat với BotFather để tạo:
- Đặt tên cho bot
- Đặt username cho bot

    ![](/Linux/image/sms2.png)
- Nhận được mã token:
    ![](/Linux/image/sms2.png)

## 2. Thêm Bot vào 1 Group
- Tạo group mới:

    ![](/Linux/image/sms3.png)
- Đặt tên group:

    ![](/Linux/image/sms4.png)
- Thêm bot vào group:

    ![](/Linux/image/sms5.png)

- Khởi động bot bằng cách chat: /my_id @Alerts_hieu_bot

![](/Linux/image/sms6.png)

## 3. Lấy Chat ID của group
Để gửi thông báo về Group bạn cần phải có thêm Chat ID. Sử dụng URL sau:

Bước 1:  Truy cập đường dẫn  :https://web.telegram.org

Bước 2: Truy cập vào Group mà bạn muốn lấy ID và mở đường dẫn của Group  ở trình duyệt .
Trên thanh URL hiện giống như sau: https://web.telegram.org/z/#-646313268

![](/Linux/image/sms7.png)

Bước 3: Lấy ID Group Telegram của bạn. Ở đây là: -646313268( đây chính là ID group )

## 4. Gửi thông báo tới Telegram
Để gửi thông báo tới Telegram bạn có thể sử dụng method GET
- Trên trình duyệt web:
```
https://api.telegram.org/bot<token>/sendMessage?chat_id=<chat_id>&text=<noi_dung>
```
Hoặc sử dụng cURL (Trên Centos 7)
```
curl -d chat_id=<chat_id> -d text="noi_dung"  https://api.telegram.org/bot<token>/sendMessage
```

## 5. Tạo script backup gửi tin nhắn thông báo backup thành công tới 1 Group
Tạo 1 script backup có đường dẫn: /root/backup.sh
```
#!/bin/bash
passroot="Admin@123"
userdb="root"
dbname="wordpress"
token=5094261714:AAEeGzcFh4biDdQqHHaXrWCTHJXoEPN15_I
ID=-646313268
url=https://api.telegram.org/bot${token}/sendMessage
noidung="Backup success"
mysqldump -u $userdb -p$passroot $dbname --single-transaction --quick --lock-tables=false > /home/backup-$(date +%F).sql
curl -d chat_id=$ID -d text="$noidung" $url > /dev/null 2>&1
```
Phân quyền thực thi cho script backup:
```
chmod +x /root/backup.sh
```
Chạy script:
```
bash message.sh
```

## 6. Thiết lập Crontab để tự động backup hàng ngày
Thực hiện lệnh
```
crontab -e
```
Thêm dòng sau vào cuối cùng của file và lưu lại:
```
SHELL=/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/rh/rh-mariadb103/root/usr/bin/mysqldump

# Backup du lieu
30 * * * * /root/backup.sh
```
Crontab sẽ thực hiện 30p backup DB 1 lần