# Copying (cp)
|Character|option|Description|
|-|-|-|
|-a|-archive|Kết hợp của các tùy chọn d, p & r|
|-b|-backup|Sao lưu trước khi xóa|
|-d|--no-deference |Giữ các liên kết|
|-f|--force|xóa các điểm đên hiện có mà không cần nhắc người dùng|
|-i|--interactive|Hiển thị tương tác trước khi ghi đè|
|-l|--link|Thay vì sao chép hãy liên kết đến các tệp thay thế|
|-p|--preserve|Bảo vệ các thuộc tính của tệp khi có thể|
|-R|--recursive|Sao chép đệ quy các thư mục|

### Section 16.1: Copy a single file(Sao chép một tệp duy nhất)
* Sao chép một tệp vào một thư mục. Có file `text.txt` từ **/home/user1/folder1/test/text.txt** đến thư mục **/user/user2/backup/file/**
```
cp home/user1/folder1/test/text.txt /user/user2/backup/file/
```
Sao chép một tệp đến một tệp khác. Có file `text.txt` từ **/home/user1/folder1/test/text.txt** đến thư mục **/user/user2/backup/file/filenew.txt**
```
cp /home/user1/folder1/test/text.txt /home/user2/backup/file/filenew.txt
```

### Section 16.2: Copy folders(Sao chép thư mục)
Sao chép một thư mục đến một thư mục khác:
```
cp -R /path-folder /path-folder-new
```
Tuy nhiên nếu **path-folder-new** không tồn tại thì sẽ được tạo 