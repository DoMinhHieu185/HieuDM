# Tìm hiểu về IPv6
### I, IPv6 là gì?
IPv6 (Internet Protocol version 6) là phiên bản mới nhất của Giao thức Internet (IP), giao thức truyền thông cung cấp một hệ thống định vị vị trí cho các máy tính trên mạng và định tuyến lưu lượng trên Internet. IPv6 đã được IETF phát triển để giải quyết vấn đề cạn kiệt địa chỉ IPv4. IPv6 được tạo ra để thay thế IPv4.

### II, Lịch sử ra đời của IPv6
* Vào những năm 1980, khi IPv4 đang được phát triển, thì Internet mới đang được xây dựng dưới sự hợp tác của một số tổ chức. Đến khi IPv4 hoàn tất, cũng là lúc Internet bắt đầu bùng nổ, các mối đe dọa trên Internet trở nên phổ biến.
* Đầu những năm 1990, IETF đã thừa nhận rằng cần phải có một phiên bản IP mới và họ bắt đầu bằng việc soạn thảo các yêu cầu mà bản IP này cần phải có. IP Next Generation (IPng) đã được tạo ra, sau đó trở thành IPv6 (RFC 1883) như ngày nay.
* Những cải tiến này bao gồm việc tăng không gian địa chỉ, định dạng header được sắp xếp hợp lý, header có thể mở rộng và khả năng duy trì tính riêng tư, toàn vẹn của thông tin được truyền trong mạng
* IPv6 sau đó được chuẩn hóa hoàn chỉnh vào cuối năm 1998 trong RFC 2460. IPv6 đã hoàn thiện những thiếu sót mà IPv4 để lại và tạo ra những cách mới để truyền thông mà IPv4 không thể hỗ trợ.

### III, Kiến trúc header của IPv6
* IPv6 sử dụng 128 bit địa chỉ trong khi IPv4 chỉ sử dụng 32 bit; nghĩa là IPv6 có tới 2^128 địa chỉ khác nhau. Đây là một con số rất lớn. Các nhà nghiên cứu chỉ ra rằng chúng ta sẽ không bao giờ sử dụng hết địa chỉ IPv6.

![](/Linux/image/ipv6.png)

* so sánh về header của IPv4 và IPv6:

![](/Linux/image/ipv6st1.png)

Cấu trúc header của IPv6 đã được rút gọn hơn so với IPv4. Cụ thể:
* Version: Chiều dài 4bit định nghĩa số phiên bản của IP. Với IPv6 giá trị là 6.
* Traffic Class: Gồm 8bit thực hiện chức năng tương tự trường Type of Service của IPv4. Trường này được sử dụng để biểu diễn mức độ ưu tiên của gói tin, mỗi điểm kết nối IPv6 có thể đánh dấu gói tin với từng loại dữ liệu, ví dụ gói tin nên được truyền với tốc độ nhanh hay thông thường.
* Flow Label: Đây là trường mới trên IPv6 với chiều dài 20bit. Trường này được sử dụng để chỉ định gói tin thuộc một dòng (Flow) nhất định giữa nguồn và đích, yêu cầu bộ định tuyến IPv6 phải có cách xử lý đặc biệt. Bằng cách sử dụng trường này, nơi gửi gói tin có thể xác định một chuỗi các gói tin, ví dụ gói tin của dịch vụ thoại VoIP thành một dòng và yêu cầu chất lượng cụ thể cho dòng đó. Khi một router xác định dòng lưu lượng lần đầu, nó sẽ nhớ dòng lưu lượng đó, cũng như các xử lý đặc biệt ứng với lưu lượng này, và khi các lưu lượng khác thuộc dòng này đến, nó sẽ xử lý nhanh hơn là xử lý từng packet.
* Payload Length: Chiều dài 16bit, tương tự như trường Total Length của IPv4, xác định tổng kích thước của gói tin IPv6 bao gồm cả phần mào đầu mở rộng (không chứa header).
* Next Header: Gồm 8 bít, thay thế trường Protocol. Trường này chỉ định đến mào đầu mở rộng đầu tiên của gói tin IPv6, đặt sau mào đầu cơ bản hoặc chỉ định tới thủ tục lớp trên như TCP, UDP, ICMPv6 khi trong gói tin IPv6 không có mào đầu mở rộng.
* Hop Limit: Gồm 8 bít, được sử dụng để giới hạn số hop mà packet đi qua, được sử dụng để tránh cho packet được định tuyến vòng vòng trong mạng. Trường này giống như trường TTL (Time-To-Live) của IPv4.
* Source Address: Gồm 128 bít, xác định địa chỉ nguồn của gói tin.
* Destination Address: Gồm 128 bít, xác định địa chỉ đích của gói tin.

### IV, Cấu trúc IPv6
IPv6 dài 128 bit, được viết dưới dạng hexa. Cứ 4 bit nhị phân đổi thành một số hexa nên một địa chỉ IPv6 sẽ gồm 32 số hexa. 32 số này được viết thành 8 cụm, mỗi cụm 4 số hexa, gọi là các trường (field).

Ví dụ: 2031:0000:130F:0000:0000:09C0:876A:130B là một địa chỉ IPv6.

Luật rút gọn IPv6:

  * Các số 0 dẫn đầu trong một trường được quyền lược bỏ.
  * Các trường 0 liên tiếp của một địa chỉ IPv6 được phép thay thế bằng một cụm hai dấu hai chấm “::”, và chỉ được thay thế một lần duy nhất cho một địa chỉ.

Ví dụ: địa chỉ “2031:0000:130F:0000:0000:09C0:876A:130B” có thể được rút gọn như sau: 2031:0:130F:0:0:09C0:876A:130B hoặc là 2031:0:130F::9C0:876A:130B.

Địa chỉ IPv6 cũng được chia thành hai phần “network” và “host” giống như IPv4, nhưng sử dụng tên gọi khác là phần “prefix”và “interface – id”.

![](/Linux/image/cautruc.png)

Phần Prefix và phần Interface ID.

Không gian IPv6 được quy hoạch theo khối ngày từ đầu. Các khối IP lớn sẽ được cấp cho các cơ quan quản lý IP cấp vùng (Registry), các cơ quan này lại chia thành các khối nhỏ hơn và cấp xuống cho các ISP, các ISP lại tiếp tục thực hiện chia nhỏ và cấp xuống cho các doanh nghiệp, cuối cùng, doanh nghiệp sẽ chia nhỏ khối IP được cấp thành các subnet.

Các địa chỉ IPv6 không sử dụng subnet mask trong khai báo địa chỉ mà chỉ sử dụng định dạng prefix-length. Ví dụ 2001:1111:2222:3333:4444:5555:6666:7777/64.

