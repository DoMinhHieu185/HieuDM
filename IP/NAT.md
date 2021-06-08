# NAT
## Khái niệm
NAT (Network Address Translation) là một kỹ thuật cho phép chuyển đổi từ một địa chỉ IP này thành một địa chỉ IP khác. Thông thường, NAT được dùng phổ biến trong mạng sử dụng địa chỉ cục bộ, cần truy cập đến mạng công cộng (Internet). Vị trí thực hiện NAT là router biên kết nối giữa hai mạng.

## Lợi ích của việc sử dụng NAT
* Những lợi ích chính của NAT là việc thoải mái sử dụng số lượng địa chỉ ip private rộng lớn.
- Giảm thiếu hụt địa chỉ của IPv4
- NAT che giấu IP bên trong LAN.
- Khi bạn sử dụng địa chỉ Ip private dù cho bạn có đổi nhà cung cấp dịch vụ, bạn sẽ không cần phải đánh lại địa chỉ cho các thiết bị trong mạng cục bộ mà bạn chỉ phải thay đổi cấu hình NAT trên firewall để trùng với địa chỉ IP public mới.
- Theo nguyên tắc hoạt động của NAT thì với 1 IP public nó có thể cho phép hơn 65000 thiết bị bên trong truy cập ra ngoài mạng internet thông qua 1 IP public duy nhất.

## Các thuật ngữ liên quan đến NAT
- Địa chỉ inside local: Đây là địa chỉ IP được đặt cho 1 thiết bị ở mạng nội bộ bên trong. Nó không được cung cấp bởi NIC (Network Information Center).
- Địa chỉ inside global: Đây là địa chỉ IP đã được đăng ký tại NIC. Địa chỉ inside global thường được dùng để thay thế cho địa chỉ IP inside local.
- Địa chỉ outside local: Đây là địa chỉ IP của một thiết bị nằm ở mạng bên ngoài. Các thiết bị thuộc mạng bên trong sẽ tìm thấy thiết bị thuộc mạng bên ngoài thông qua địa chỉ IP này. Địa chỉ outside local không nhất thiết phải được đăng ký với NIC. Nó hoàn toàn có thể là một địa chỉ Private.
- Địa chỉ outside global: Đây là địa chỉ IP được đặt cho một thiết bị nằm ở mạng bên ngoài. Địa chỉ này là một IP hợp lệ trên mạng internet.

## Static NAT (NAT tĩnh)
- Static NAT là kỹ thuật dùng để thay đổi, biến một IP này thành một IP khác. Bằng cách sử dụng phương pháp cố định cụ thể từ địa chỉ IP cục bộ sang Public. Toàn bộ quá trình này được thực hiện và cài đặt thủ công.
- Phương pháp Static NAT sẽ đặc biệt phát huy hiệu quả nếu các thiết bị có địa chỉ cố định để truy cập internet từ bên ngoài.

![](https://image.prntscr.com/image/vHCqyeHPQPCRck11-mCDSw.png)

## Dynamic NAT (NAT động)
- Một địa chỉ IP Private sẽ được map với một địa chỉ IP Public trong nhóm địa chỉ IP Public.

![](https://image.prntscr.com/image/eIZNemMZRQCvsRN4LKcC-g.png)

- Trong Dynamic NAT (NAT động), máy tính có địa chỉ IP 192.168.32.10 luôn được Router biên dịch đến địa chỉ đầu tiên 213.18.123.100 trong dãy địa chỉ IP từ 213.18.123.100 đến 213.18.123.150.
## Overloading NAT
- NAT Overload còn có tên gọi khác là PAT (Port Address Translation). Đây là một dạng biến thể khác của Dynamic NAT. Nó cũng thực hiện chuyển đổi địa chỉ IP một cách tự động. Tuy nhiên, kiểu chuyển dịch địa chỉ của NAT Overload là dạng many – to – one (ánh xạ nhiều địa chỉ IP thành 1 địa chỉ IP) và dùng các chỉ số cổng (port) khác nhau để phân biệt cho từng chuyển đổi.

![](https://image.prntscr.com/image/8KFM9kxZSseDFjMLfYCUYg.png)

- Trong Overloading NAT, mỗi máy tính trong mạng nội bộ (Private Network) được Router biên dịch đến cùng một địa chỉ IP 213.18.123.100 nhưng trên các cổng giao tiếp khác nhau.
## Overlapping NAT
![](https://image.prntscr.com/image/Fbu2m6kSRPWN5y5LZCWmEA.png)

- Khi địa chỉ IP trong hệ thống mạng nội bộ là IP Public đang sử dụng trên một hệ thống mạng khác, Router phải duy trì một bảng tìm kiếm các địa chỉ này để ngăn và thay thế bằng một IP Public duy nhất.
- Điều quan trọng cần lưu ý rằng NAT router phải biên dịch địa chỉ "nội bộ" thành một địa chỉ IP Public duy nhất cũng như biên dịch địa chỉ "ngoài" thành một địa chỉ IP Private duy nhất. Bạn có thể sử dụng NAT tĩnh hoặc sử dụng kết hợp DNS và NAT động.
- Hệ thống mạng nội bộ thông thường là LAN, hay còn gọi là Stub Domain. Một Stub Domain là một LAN sử dụng địa chỉ IP nội bộ.
- Hầu hết các Network Traffic (là lưu lượng mạng ổn định, không bị gián đoạn trong quá trình truyền) trong Stub Domain mang tính chất cục bộ, do đó hệ thống mạng nội bộ không bao giờ bị lộ ra bên ngoài. 
- Một Stub Domain có thể bao gồm cả địa chỉ IP Public và IP Private. Bất kỳ máy tính nào sử dụng địa chỉ IP Private đều phải dùng NAT để trao đổi thông tin với các máy tính khác.

.
