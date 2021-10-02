# Tìm hiểu về MySQL
## Khái niệm
MySQL là một hệ thống quản trị cơ sở dữ liệu mã nguồn mở (gọi tắt là RDBMS) hoạt động theo mô hình client-server. Với RDBMS là viết tắt của Relational Database Management System. MySQL được tích hợp apache, PHP. MySQL quản lý dữ liệu thông qua các cơ sở dữ liệu. Mỗi cơ sở dữ liệu có thể có nhiều bảng quan hệ chứa dữ liệu. MySQL cũng có cùng một cách truy xuất và mã lệnh tương tự với ngôn ngữ SQL.
## Lịch sử hình thành và phát triển
Quá trình hình thành và phát triển của MySQL được tóm tắt như sau:

* Công ty Thuy Điển MySQL AB phát triển MySQL vào năm 1994.
* Phiên bản đầu tiên của MySQL phát hành năm 1995
* Công ty Sun Microsystems mua lại MySQL AB trong năm 2008
* Năm 2010 tập đoàn Oracle thâu tóm Sun Microsystems. Ngay lúc đó, đội ngũ phát triển của MySQL tách MySQL ra thành 1 nhánh riêng gọi là MariaDB. Oracle tiếp tục phát triển MySQL lên phiên bản 5.5.
* 2013 MySQL phát hành phiên bản 5.6
* 2015 MySQL phát hành phiên bản 5.7
* MySQL đang được phát triển lên phiên bản 8.0
MySQL hiện nay có 2 phiên bản miễn phí (MySQL Community Server) và có phí (Enterprise Server).

## Ưu nhược điểm của MySQL
**Ưu điểm**
- Dễ sử dụng
- Bảo mật cao
- Đa tính năng
- Khả năng mở rộng mạnh mẽ
- Nhanh chóng
**Nhược điểm**
- Giới hạn 
- Độ tin cậy 
- Dung lượng hạn chế
## Tại sao nên dùng MySQL
* MySQL là CSDL có tốc độ khá cao, ổn định và khá dễ sử dụng có thể hoạt động được trên khá nhiều hệ điều hành.
* Tính bảo mật mạnh và sử dụng được trên nhiều ứng dụng mà MySQL còn hoàn toàn được sử dụng miễn phí.
* MySQL không chỉ dừng lại ở bổ trợ cho PHP và Perl, mà nó còn bổ trợ cho nhiều ngôn ngữ khác, Nó là nơi để lưu trữ thông tin trên các trang web được viết bằng Perl hoặc PHP.
## Một số thuật ngữ thường gặp của MySQL
### Database
Database là tập hợp dữ liệu theo cùng một cấu trúc được đặt trong một bộ dữ liệu chung dataset. Database được tổ chức sắp xếp giống như một bảng tính có sự liên kết chặt chẽ với nhau.
### Open Source
Mã nguồn mở ( Open Source ) là những phần mềm được cung cấp dưới cả dạng mã và nguồn , không chỉ là miễn phí về giá mua mà chủ yếu là miễn phí về bản quyền : người dùng có quyền sửa đổi , cải tiến , phát triển , nâng cấp theo một số nguyên tắc chung quy định trong giấy phép phần mềm nguồn mở mà không cần xin phép ai , điều mà họ không được phép làm đối với các phần mềm nguồn đóng ( tức là phần mềm thương mại )
### MySQL Server
MySQL Server là máy tính hay một hệ các máy tính cài đặt phần mềm MySQL dành cho server để giúp bạn lưu trữ dữ liệu trên đó, để máy khách có thể truy cập vào quản lý. Dữ liệu này được đặt trong các bảng, và các bảng có mối liên hệ với nhau. MySQL server nhanh, an toàn, đáng tin cậy. Phần mềm MySQL cũng miễn phí và được phát triển, phân phối và hỗ trợ bởi Oracle Corporatio
### MySQL Client
MySQL client không hẵn phải cài phần mềm MySQL của Oracle mà là nói chung của mọi phần mềm có thể thực hiện truy vấn lên một MySQL server và nhận kết quả trả về. MySQL client điển hình là đoạn mã PHP script trên một máy tính hay trên cùng server dùng để kết nối tới cơ sở dữ liệu MySQL database. Phpmyadmin cũng là một MySQL client có giao diện người dùng. Một số công cụ miễn phí dùng làm MySQL là:

  - MySQL Workbench (Mac, Windows, Linux), Miễn phí, mã nguồn mở
  - Sequel Pro (Mac), miễn phí, mã nguồn mở
  - HeidiSQL (Windows; chạy trên Mac hoặc Linux bằng WINE emulator), miễn phí
  - phpMyAdmin (web app), miễn phí, mã nguồn mở
### SQL
SQL là ngôn ngữ truy vấn dung để liên lạc giữa client với server 

## MySQL hoạt động như thế nào
![](/Linux/image/mysql.jpg)
Cách vận hành chính trong môi trường MySQL như sau:

* MySQL tạo ra bảng để lưu trữ dữ liệu, định nghĩa sự liên quan giữa các bảng đó.
* Client sẽ gửi yêu cầu SQL bằng một lệnh đặc biệt trên MySQL.
* Ứng dụng trên server sẽ phản hồi thông tin và trả về kết quả trên máy client.

# Tìm hiểu MariaDB
## Khái niệm
* MariaDB là hệ quản trị cơ sở dữ liệu miễn phí được phát triển từ hệ quản trị cơ sở dữ liệu mã nguồn mở MySQL. MariaDB được phát triển nhằm thay thế công nghệ cơ sở dữ liệu MySQL, vì thế nó tương thích và cho một hiệu suất cao hơn so với MySQL. 
* MariaDB được Michael “Monty” Widenius, developer hàng đầu của MySQL dẫn dắt và phát triển. Ưu điểm lớn nhất của hệ quản trị này là tương thích với nhiều hệ điều hành, bao gồm Linux CentOS, Ubuntu và Window với các gói cài đặt tar, zip, MSI, rpm cho cả 32bit và 64bit với hiệu suất cao hơn so với MySQL. 
* MariaDB được hình thành dựa trên nền tảng của MySQL, vì thế nó kế thừa được hầu hết các chức năng cơ bản cần thiết của MySQL. Bên cạnh đó, MariaDB cũng phát triển thêm nhiều tính năng mới và có sự nâng cấp hơn về cơ chế lưu trữ, tối ưu máy chủ.
* MariaDB có 2 bản trả phí và không cần trả phí. Tuy nhiên, với phiên bản không trả phí, người dùng vẫn có thể sử dụng đầy đủ các tính năng mà không ảnh hưởng đến việc chạy hệ thống
## Lịch sử phát triển
* Nền móng cơ sở đầu tiên của MariaDB được phát triển bởi “trụ cột” của MySQL AB là Michael “Monty” Widenius. Năm 2008, sau khi Sun mua lại MySQL AB, Michael “Monty” Widenius rời khỏi MySQL AB và tiếp tục phát triển một hệ cơ sở quản trị mới của mình.

* Đầu năm 2009, Michael cùng với 1 vài đồng nghiệp khác bắt đầu tiến hành dự án chuyên sâu về công cụ lưu trữ MySQL, sau này trở thành MariaDB. Tên gọi MariaDB được đặt tên theo tên con gái út của Widenius – Maria. Sau nhiều lần nâng cấp và phát triển, hiện tại MariaDB đã ra mắt phiên bản mới nhất là MariaDB 10.1.

## Ưu điểm MariaDB
Những ưu điểm lớn nhất của hệ quản trị này phải kể đến bao gồm:
* Hoàn toàn miễn phí
* Khắc phục những hạn chế của MySQL
* Bổ sung thêm nhiều Engine hơn
* Kết hợp cả SQL và NoSQL
* Hỗ trợ tiếng Việt