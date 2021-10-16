# Quản lý các thư viện được chia sẻ
### Library Principles(Nguyên tắc Thư viện)
Thư viện hệ thống là một tập hợp các mục, chẳng hạn như các hàm chương trình. Chức năng là các mô-đun mã tự điều khiển thực hiện một tác vụ cụ thể trong ứng dụng, chẳng hạn như mở và đọc tệp dữ liệu.

Lợi ích của việc tách các chức năng thành các tệp thư viện riêng biệt là nhiều ứng dụng sử dụng các chức năng giống nhau có thể chia sẻ các tệp thư viện giống nhau. Các tệp có đầy đủ các chức năng này giúp phân phối ứng dụng dễ dàng hơn, nhưng cũng làm cho việc theo dõi các tệp thư viện được cài đặt với ứng dụng nào trở nên phức tạp hơn.

Linux hỗ trợ hai loại thư viện khác nhau. Một là thư viện tĩnh (còn được gọi là thư viện liên kết cố định) được sao chép vào một ứng dụng khi nó được biên dịch. Mặt khác là các thư viện được chia sẻ (còn gọi là thư viện động), nơi các chức năng của thư viện được sao chép vào bộ nhớ và liên kết với ứng dụng khi chương trình được khởi chạy. Đây được gọi là tải thư viện.

Trên Linux, giống như các gói ứng dụng, các tệp thư viện có các quy ước đặt tên. Tệp thư viện được chia sẻ sử dụng định dạng tên tệp sau:
```
libLIBRARYNAME.so.VERSION
```

### Locating Library Files(Định vị tệp thư viện)
Khi một chương trình đang sử dụng một chức năng được chia sẻ, hệ thống sẽ tìm kiếm tệp thư viện của chức năng đó theo một thứ tự cụ thể; tìm kiếm trong các thư mục được lưu trữ trong
* 1. Biến môi trường LD_LIBRARY_PATH
* 2. Biến môi trường PATH của chương trình
* 3. Thư mục /etc/ld.so.conf.d/
* 4. Tệp /etc/ld.so.conf
* 5. Thư mục /lib*/ và /usr/lib*/ 

Lưu ý rằng thứ tự # 3 và # 4 có thể bị lật ngược trên hệ thống của bạn. Điều này là do tệp /etc/ld.so.conf tải các tệp cấu hình từ thư mục /etc/ld.so.conf.d/.

* Ví dụ: Hiển thị nội dung tệp /etc/ld.so.conf trên CentOS
```
[root@localhost ~]# cat /etc/ld.so.conf
include ld.so.conf.d/*.conf
```

### Loading Dynamically(trình tải động)
Khi một chương trình được khởi động, trình liên kết động (còn được gọi là trình liên kết động / trình tải) chịu trách nhiệm tìm kiếm các chức năng thư viện cần thiết của chương trình. Sau khi chúng được định vị, trình liên kết động sẽ sao chép chúng vào bộ nhớ và liên kết chúng với chương trình.

### Library Management Commands(Lệnh quản lý thư viện)
#### Managing the Library Cache(Quản lý bộ đệm thư viện)
Bộ đệm thư viện là một danh mục các thư mục thư viện và tất cả các thư viện khác nhau có trong chúng. Hệ thống đọc tệp bộ đệm này để nhanh chóng tìm thấy các thư viện cần thiết khi nó đang tải các chương trình. Điều này làm cho việc tải thư viện nhanh hơn nhiều so với việc tìm kiếm qua tất cả các vị trí thư mục có thể có cho một tệp thư viện bắt buộc cụ thể.

Khi các thư viện hoặc thư mục thư viện mới được thêm vào hệ thống, tệp bộ đệm thư viện này phải được cập nhật. Tuy nhiên, nó không phải là một tệp văn bản đơn giản mà bạn có thể chỉnh sửa. Thay vào đó, bạn phải sử dụng lệnh `ldconfig`.

#### Troubleshooting Shared Library Dependencies(Khắc phục sự cố phụ thuộc vào Thư viện được chia sẻ)
Tiện ích `ldd` có thể hữu ích nếu bạn cần theo dõi các tệp thư viện bị thiếu cho một ứng dụng. Nó hiển thị danh sách các tệp thư viện cần thiết cho ứng dụng được chỉ định.

* Ví dụ: Sử dụng lệnh ldd để xem các thư viện của ứng dụng
```
[root@localhost ~]# ldd /usr/bin/echo
        linux-vdso.so.1 =>  (0x00007ffe2f960000)
        libc.so.6 => /lib64/libc.so.6 (0x00007fb31dbd6000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fb31dfa4000)
```
Đầu ra của tiện ích ldd cho thấy chương trình echo yêu cầu hai tệp thư viện bên ngoài: tệp `linux-vdso.so.1` và `libc.so.6` tiêu chuẩn. Tiện ích ldd cũng cho biết vị trí các tệp đó được tìm thấy trên hệ thống Linux, có thể hữu ích khi khắc phục sự cố với các ứng dụng liên quan đến tệp thư viện của chúng
