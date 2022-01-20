# Tìm hiểu về Mariadb Replication
- [I, Khái niệm Replication](#I-Khái-niệm-Replication)
- [II, Ưu điểm của việc sử dụng Replication](#II-Ưu-điểm-của-việc-sử-dụng-Replication)
- [III, Hoạt động của Master – Slave](#III-Hoạt-động-của-Master–Slave)
- [IV, Cấu hình Mariadb Replication](#IV-Cấu-hình-Mariadb-Replication)
### I, Khái niệm Replication
MySQL Replication là một quá trình cho phép bạn dễ dàng duy trì nhiều bản sao của dữ liệu MySQL bằng cách cho họ sao chép tự động từ một master tạo ra một cơ sở dữ liệu slave. Điều này rất hữu ích vì nhiều lý do bao gồm việc tạo điều kiện cho sao lưu cho dữ liệu, một cách để phân tích nó mà không sử dụng các cơ sở dữ liệu chính, hoặc chỉ đơn giản là một phương tiện để mở rộng ra.

Replication mặc định là không đồng bộ, slave không cần phải kết nối vĩnh viễn để nhận được cập nhật từ master. Tùy thuộc vào cấu hình, bạn có thể sao chép tất cả các cơ sở dữ liệu, cơ sở dữ liệu đã chọn, hoặc thậm chí bảng được lựa chọn trong một cơ sở dữ liệu. Thật vậy, Replication có ý nghĩa là “nhân bản”, là có một phiên bản giống hệt phiên bản đang tồn tại, đang sử dụng. Với một cơ sở dữ liệu có nhu cầu lưu trữ lớn, thì đòi hỏi cơ sở dữ liệu phải toàn vẹn, không bị mất mát trước những sự cố ngoài dự đoán là rất cao. Vì vậy, người ta nghĩ ra khái niệm (slave) “nhân bản”, tạo một phiên bản cơ sở dữ liệu giống hệt cơ sở dữ liệu đang tồn tại, và lưu trữ ở một nơi khác, đề phòng có sự cố.

Server master lưu trữ phiên bản cơ sở dữ liệu phục vụ ứng dụng. Server slave lưu trữ phiên bản cơ sở dữ liệu “nhân bản”. Quá trình nhân bản từ master sang slave gọi là replication.

Tất cả các thay đổi trên cơ sở dữ liệu master sẽ được ghi lại dưới dạng file log binary, slave đọc file log đó, thực hiện những thao tác trong file log, việc ghi, đọc và thực thi trong file log này dưới dạng binary được thực hiện rất nhanh.

### II, Ưu điểm của việc sử dụng Replication
* Khả năng mở rộng – Scalability: Bằng cách có một hoặc nhiều server slave, việc đọc có thể được trải rộng trên nhiều server, giảm tải cho master. Kịch bản phổ biến nhất cho môi trường đọc cao, viết thấp là có một master, trong đó tất cả các ghi xảy ra, sao chép thành nhiều slave, xử lý hầu hết các lần đọc.
* Phân tích dữ liệu – Data analysis: phân tích dữ liệu có thể ảnh hưởng nhiều đến master server do đó ta có thể sử dụng slave server để phân tích dữ liệu mà vẫn đảm bảo master server hoạt động bình thường.
* Hỗ trợ sao lưu – Backup assistance:
* Phân phối dữ liệu – Distribution of data: Thay vì được kết nối với một master server từ xa, ta ó thể sao chép dữ liệu cục bộ và làm việc từ dữ liệu này.

### III, Hoạt động của Master – Slave
Cơ chế chính được sử dụng trong replication là binary log – nhật ký nhị phân . Nếu ghi nhật ký nhị phân được bật, tất cả các cập nhật cho cơ sở dữ liệu (thao tác dữ liệu và định nghĩa dữ liệu) được ghi vào nhật ký nhị phân dưới dạng các sự kiện binlog. Các slave đọc nhật ký nhị phân trên master để truy cập dữ liệu để sao chép. Một relay log – bản ghi tiếp được tạo ra trên slave server, sử dụng định dạng giống như các bản ghi nhị phân, và điều này được sử dụng để thực hiện sao chép.  Khi không còn cần thiết, các relay log file cũ sẽ được gỡ bỏ.

Một slave server sẽ theo dõi vị trí của sự kiện binlog cuối được ghi trong file nhật ký nhị phân của master dựa trên tham số “position”. Điều này cho phép slave server kết nối lại và tiếp tục lại từ nơi nó đã dừng lại ban đầu. Nó cũng cho phép một slave ngắt kết nối, tạo nhân bản và sau đó slave mới tiếp tục replication từ cùng một master.

Master và Slave không cần kết nối liên tục với nhau. Bạn có thể để server offline hoặc ngắt kết nối khỏi mạng và khi chúng quay lại hoạt động thì quá trình replication sẽ bắt đầu từ nơi nó dừng lại.

![](/Linux/image/replicate.png)
##### Trên Master
Đầu tiên master phải ghi các sự kiện nhân bản vào một tập tin log đặc biệt gọi là binary log. Sau đó các slave sẽ đọc dữ liệu nhân bản từ tập tin này.

Bất cứ khi nào slave kết nối với master, master sẽ tạo một luồng kết nối mới( Binary Log Dump Thread) và thực hiện các hành động mà slave yêu cầu. hread này có thể được nhận ra bằng cách sử dụng câu lệnh SHOW PROCESSLIST và tìm thấy nó ở nơi có thread command là "Binlog Dump". Bạn có thể biết được slave nào đang được kết nối đến master bằng cách sử dụng câu lệnh SHOW SLAVE HOSTS .

Các slave bị chậm trễ có thể đọc các sự kiện được lưu trong bộ nhớ cache của hệ điều hành trên master chứ không đọc trên bộ nhớ vật lý của master. Tuy nhiên, khi một slave được kết nối sau đó vài giờ, thậm chí là vài ngày, nó sẽ bắt đầu đọc các sự kiện được ghi trên tập tin binary log – khi đó việc đọc được thực hiện trên bộ nhớ vật lý vì bộ nhớ cache không còn lưu trữ dữ liệu cần thiết.

##### Trên Slave
Khi quá trình nhân bản được khởi động, có 2 luồng chạy trên slave:

* Luồng nhập xuất(I/O thread): Kết nối với master, đọc các sự kiện trong binary log và sao chép vào tập tin relay log.

Mặc dù chỉ có một luồng đọc binary log từ master và một luồng ghi vào relay log trên slave, rất hiếm khi sự kiện sao chép làm cho quá trình nhân bản chậm đi. Quá trình này chỉ kéo dài khoảng vài trăm mili giây. Sử dụng lệnh show master status\G để kiểm tra luồng nhập xuất hiện hành:
  * Master_Log_File: tập tin cuối cùng được sao chép từ master (hầu như là giống với binary log cuối cùng được tạo ra bởi master)
  * Read_Master_Log_Pos : binary log của master được sao chép vào relay log trên slave đến vị trị hiện tại
So sánh với cùng lệnh này ở máy master.
* Luồng SQL(SQL Thread): đọc các sự kiện từ relay log được lưu trữ cục bộ trên slave (tập tin được ghi bởi luồng IO) và thực thi các sự kiện đó nhanh nhất có thể.

Để xem trạng thái của luồng SQL, thực thi lệnh `show slave status\G`:
  * Relay_Master_Log_File : tập tin binary log trên master mà luồng SQL đang đọc (thực ra là đọc trên relay log)
  *  Exec_Master_Log_Pos: vị trí trên file binary log nơi được thực thi bởi luồng SQL.

  > Nhật ký nhị phân chứa bản ghi tất cả các thay đổi đối với cơ sở dữ liệu, cả dữ liệu và cấu trúc, cũng như thời gian thực thi mỗi câu lệnh. Nó bao gồm một tập hợp các tệp nhật ký nhị phân và một chỉ mục. Điều này có nghĩa là các câu lệnh như CREATE , ALTER , INSERT , UPDATE và DELETE sẽ được ghi lại, nhưng các câu lệnh không ảnh hưởng đến dữ liệu, chẳng hạn như SELECT và SHOW, sẽ không được ghi lại.
  > Mục đích của nhật ký nhị phân là cho phép sao chép , trong đó dữ liệu được gửi từ một hoặc nhiều máy chủ đến một hoặc nhiều máy chủ phụ dựa trên nội dung của nhật ký nhị phân, cũng như hỗ trợ các hoạt động sao lưu.
  > Nhật ký nhị phân được lưu trữ ở định dạng nhị phân, không phải văn bản thuần túy, và do đó không thể xem được bằng trình chỉnh sửa thông thường

### IV, Cấu hình Mariadb Replication
