# Looking at Package Concepts(Khái niệm gói)
Hầu hết người dùng Linux muốn tải xuống một ứng dụng và sử dụng nó. Do đó, các bản phân phối Linux đã tạo ra một hệ thống để đóng gói các ứng dụng đã được biên dịch để phân phối. Gói này được gọi là một gói và nó bao gồm hầu hết các tệp cần thiết để chạy một ứng dụng. Sau đó, bạn có thể cài đặt, gỡ bỏ và quản lý toàn bộ ứng dụng dưới dạng một gói duy nhất chứ không phải là một nhóm các tệp rời rạc.

Linux thực hiện quản lý gói bằng cách sử dụng cơ sở dữ liệu để theo dõi các gói đã cài đặt trên hệ thống. Cơ sở dữ liệu quản lý gói không chỉ theo dõi những gói nào được cài đặt mà còn theo dõi chính xác các tệp và vị trí tệp cần thiết cho mỗi ứng dụng.

Hệ thông quản lý gói phổ biến:
* Red Hat package management (RPM)
* Debian package management (Apt)

Mỗi hệ thống quản lý gói sử dụng một phương pháp khác nhau để theo dõi các gói và tệp ứng dụng, nhưng cả hai đều theo dõi thông tin tương tự:
* Tệp ứng dụng: Cơ sở dữ liệu gói theo dõi từng tệp riêng lẻ cũng như thư mục chứa tệp đó.
* Phụ thuộc thư viện: Cơ sở dữ liệu gói theo dõi những tệp thư viện nào được yêu cầu cho mỗi ứng dụng và có thể cảnh báo bạn nếu tệp thư viện phụ thuộc không xuất hiện khi bạn cài đặt một gói.
* Phiên bản ứng dụng: Cơ sở dữ liệu gói theo dõi số phiên bản của ứng dụng để bạn biết khi nào có phiên bản cập nhật của ứng dụng.

Các phần tiếp theo thảo luận về các công cụ để sử dụng từng hệ thống quản lý gói này.