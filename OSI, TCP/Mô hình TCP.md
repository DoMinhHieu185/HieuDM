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


