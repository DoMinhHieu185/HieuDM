# Khái niệm cơ bản về lưu trữ
### Types of Drives(Các loại ổ đĩa)
Có ba loại kết nối ổ đĩa chính mà bạn sẽ gặp phải với hệ thống Linux:
* Parallel Advanced Technology Attachment (PATA) kết nối các ổ đĩa bằng giao diện song song, yêu cầu cáp rộng. PATA hỗ trợ hai thiết bị trên mỗi bộ adapter.
* Serial Advanced Technology Attachment (SATA) kết nối các ổ đĩa bằng giao diện nối tiếp, nhưng với tốc độ nhanh hơn nhiều so với PATA. SATA hỗ trợ tối đa bốn thiết bị trên mỗi bộ điều hợp(adapter)
* Small Computer System Interface (SCSI) kết nối các ổ đĩa bằng giao diện song song, nhưng với tốc độ của SATA. SCSI hỗ trợ tối đa tám thiết bị trên mỗi bộ điều hợp(adapter).

### Drive Partitions(Phân vùng Drive)
Hầu hết các hệ điều hành, bao gồm cả Linux, cho phép bạn phân vùng ổ đĩa thành nhiều phần. Phân vùng là một phần độc lập trong ổ đĩa mà hệ điều hành coi như một không gian lưu trữ riêng biệt.

Việc phân vùng ổ đĩa có thể giúp bạn tổ chức dữ liệu của mình tốt hơn, chẳng hạn như phân đoạn dữ liệu hệ điều hành khỏi dữ liệu người dùng. Nếu người dùng giả mạo lấp đầy dung lượng đĩa bằng dữ liệu, hệ điều hành sẽ vẫn có chỗ để hoạt động trên phân vùng riêng biệt.

Linux tạo tệp /dev cho từng phân vùng đĩa riêng biệt. Nó gắn số phân vùng vào cuối tên thiết bị và đánh số phân vùng chính bắt đầu từ 1, vì vậy phân vùng chính đầu tiên trên ổ SATA đầu tiên sẽ là /dev/sda1. Phân vùng mở rộng MBR được đánh số bắt đầu từ 5, vì vậy phân vùng mở rộng đầu tiên được gán tệp /dev/sda5.

### Automatic Drive Detection(Phát hiện ổ đĩa tự động)
Hệ thống Linux phát hiện các ổ đĩa và phân vùng tại thời điểm khởi động và gán cho mỗi ổ đĩa một tên tệp thiết bị duy nhất.

Hầu hết các hệ thống Linux hiện nay đều sử dụng ứng dụng udev. Chương trình udev luôn chạy ở chế độ nền và tự động phát hiện phần cứng mới được kết nối với hệ thống Linux đang chạy.