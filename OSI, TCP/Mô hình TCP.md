# Mô hình TCP/IP
 TCP/IP là bộ giao thức cho phép kết nối các hệ thống mạng không đồng nhất với nhau. Ngày nay TCP/IP được sử dụng rộng rãi trong mạng cục bộ cũng như mạng toàn cầu. TCP/IP được xem như giản lược của mô hình tham chiếu OSI với 4 tầng như sau: 
 * Tầng Liên Kết (Datalink Layer) 
 * Tầng Mạng (Internet Layer) 
 * Tầng Giao Vận (Transport Layer) 
 * Tầng Ứng Dụng (Application Layer) ![TCP](https://image.prntscr.com/image/UPWuI8t8RM2_HfO7mTtedA.png)

 # Mô tả chức năng từng tầng
 ## Tầng ứng dụng(Application Layer)
 * Cung cấp ứng dụng cho phép người dùng trao đổi dữ liệu ứng dụng thông qua các dịch vụ mạng khác nhau
 * Do không có tầng phiên, tầng trình diễn như mô hình OSI, nên tầng ứng dụng trong bộ TCP/IP phải bao gồm các giao thức tại tầng trình diễn và tầng phiên.
 ## Tầng vận chuyển(Transport Layer)
 *Đảm nhiệm việc phân nhỏ các gói tin có kích thước lớn ghi gửi và tập hợp lại khi nhận, tính toàn vẹn cho dữ liệu (không lỗi, không mất, đúng thứ tự) là yếu tố được đảm bảo.
 * giao thức chủ yếu: TCP UDP
## Tầng mạng(Internet Layer)
* Xử lí quá trình truyền gói tin trên mạng(định tuyến, định địa chỉ, đóng gói dữ liệu)
* giao thức của tầng này bao gồm : IP ( Internet Protocol) , ICMP ( Internet Control Message Protocol) , IGMP ( Internet Group Message Protocol )
## Tầng truy cập(Network Access Layer)
Chịu trách nhiệm truyền dữ liệu giữa các thiết bị trong cùng một mạng. Tại đây các gói dữ liệu được đóng gói khung(frames) và được định tuyến đến đích được chỉ định ban đầu.
# Phương thức hoạt động của bộ giao thức TCP/IP
![](https://image.prntscr.com/image/NY33dHu-Rx2qRFJjijGLzg.png)
* Cũng tương tự như trong mô hình OSI, khi truyền dữ liệu , quá trình tiến hành từ tầng trên xuống tầng dưới, qua mỗi tầng dữ liệu được them vào thông tin điều khiển gọi là Header. Khi nhận dữ liệu thì quá trình xảy ra ngược lại. dữ liệu được truyền từ tấng dưới lên và qua mỗi tầng thì phần header tương ứng sẽ được lấy đi và khi đến tầng trên cùng thì dữ liệu không còn phần header nữa.
![](https://image.prntscr.com/image/5-VSttOyQru2vZUfm8rgGQ.png)
Hình trên cho ta thấy lược đồ dữ liệu qua các tầng.. Trong hình ta thấy tại các tầng khác nhau dữ liệu được mang những thuật ngữ khác nhau 
* Trong tầng ứng dụng: dữ liệu là các luồng được gọi là stream. 
* Trong tầng giao vận: đơn vị dữ liệu mà TCP gửi xuống gọi là TCP segment. 
* Trong tầng mạng, dữ liệu mà IP gửi xuống tầng dưới gọi là IP Datagram 
* Trong tầng liên kết, dữ liệu được truyền đi gọi là frame.

