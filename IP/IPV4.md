# Địa chỉ IP là gì?
Địa chỉ IP (IP là viết tắt của từ tiếng Anh: Internet Protocol - giao thức Internet) Địa chỉ IP cung cấp danh tính riêng biệt cho các thiết bị trên mạng dữ liệu IP để chúng có thể tìm thấy nhau trong vô vàn thiết bị trong mạng Mỗi gói tin đi qua mạng TCP/IP đều có một địa chỉ IP xác định thiết bị đã gửi gói tin đó và cũng chứa thông tin đích đến để gói tin có thể được định tuyến thành công đến nơi cần đến.
## Các loại đại chỉ IP
Tùy vào mục đích sử dụng mà địa chỉ IP được phân làm: Địa chỉ IP công cộng – IP Public, IP Private – địa chỉ IP riêng, địa chỉ IP tĩnh – Static IP và Dynamic IP – địa chỉ IP động. Chúng có thể được phân là IPv4 hoặc IPv6, cả IP Public và IP Private đều tồn tại dưới dạng IP động hay IP tĩnh.
1. IP Public là gì?
IP public là địa chỉ IP công cộng được nhà cung cấp dịch vụ internet chỉ định. Đây là địa chỉ mà mạng gia đình hay doanh nghiệp sử dụng để liên lạc với các thiết bị kết nối internet khác, cho phép các thiết bị trong mạng truy cập web hay liên lạc trực tiếp với máy tính của người dùng khác
2. IP Private là gì?
IP Private hay còn gọi là IP riêng sử dụng trong nội bộ mạng LAN, giống như mạng gia đình hay mạng quán nét. Khác với IP công cộng, IP Private không thể kết nối với mạng internet, chỉ các thiết bị trong mạng mới có thể giao tiếp với nhau thông qua bộ định tuyến còn gọi là router. Địa chỉ IP riêng được bộ định tuyến gán tự động hoặc bạn có thể thiết lập theo cách thủ công.
3. IP Static là gì?
IP Static hay còn gọi là IP tĩnh, đây là cách đặt IP cho từng thiết bị hoàn toàn thủ công và không bị thay đổi theo thời gian.
4. IP Dynamic là gì?
IP Dynamic là IP động, có nghĩa rằng địa chỉ IP của máy tính có thể thay đổi, hôm nay là A thì ngày mai lại là B. Điều này xảy ra hoàn toàn tự động và được quản lý bởi máy chủ được gọi là DHCP Server.
# IPv4
## IPv4 là gì?
Ipv4 là phiên bản thứ tư trong quá trình phát triển của các giao thức Internet (IP). Đây là phiên bản đầu tiên của IP được sử dụng rộng rãi. 
IPv4 là giao thức hướng dữ liệu, được sử dụng cho hệ thống chuyển mạch gói. Đây là giao thức truyền dữ liêu hoạt động dựa trên nguyên tắc tốt nhất có thể, trong đó, nó không quan tâm đến thứ tự truyền gói tin cũng như không đảm bảo gói tin sẽ đến đích hay việc gây ra tình trạng lặp gói tin ở đích đến. Việc xử lý vấn đề này dành cho lớp trên của chồng giao thức TCP/IP. Tuy nhiên, IPv4 có cơ chế đảm bảo tính toàn vẹn dữ liệu thông qua sử dụng những gói kiểm tra (checksum)..
## Cấu trúc đại chỉ IPv4
Địa chỉ IP được chia thành 2 phần là network (phần mạng) và phần Host
Địa chỉ IP có 32 bit nhị phân và được chia thành các octet (4 cụm, 8 bit)
Các quy tắc được áp dụng khi đặt địa chỉ IP:
- Các bit phần mạng không được phép đặt đồng thời bằng 0 ( Ví dụ: Không hợp lệ nếu đặt địa chỉ 0.0.0.1 với phần mạng 0.0.0 và phần Host là 1).
- Sẽ có một địa chỉ mạng nếu các bit phần Host đồng thời có giá trị bằng 0 (Ví dụ : Địa chỉ 192.168.1.1 có thể gán cho Host nhưng thay giá trị 0 vào 192.168.1.0 sẽ thành địa chỉ mạng và không thể gán cho Host).
- Sẽ có địa chỉ Broadcast cho mạng nếu các bit phần Host đồng thời bằng 1 ( Ví dụ: Mạng 192.168.1.0 có địa chỉ 192.168.1.255 là địa chỉ Broadcast).
![](https://image.prntscr.com/image/fVxsmG0ARJCJsyV9uAI_uw.png "Cấu trúc IP")