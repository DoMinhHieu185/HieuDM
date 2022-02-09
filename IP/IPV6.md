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

Một địa chỉ IPv6 được chia thành 3 phần: site prefix, subnet ID, interface ID.

– Site prefix: là số được gán đến website bằng một ISP. Tại một vị trí, tất cả máy tính sẽ được chia sẻ cùng một site prefix.

– Subnet ID: là thành phần ở bên trong trang web, có chức năng miêu tả cấu trúc trang của mạng. Một IPv6 subnet có cấu trúc tương đương với một nhánh mạng đơn như subnet của IPv4.

– Interface ID: có cấu trúc tương tự ID trong IPv4. Có chức năng nhận dạng host riêng trong mạng. Interface ID được cấu hình tự động điển hình dựa vào địa chỉ MAC của giao diện mạng.

![](/Linux/image/ipv6.jpg)

Không gian IPv6 được quy hoạch theo khối ngày từ đầu. Các khối IP lớn sẽ được cấp cho các cơ quan quản lý IP cấp vùng (Registry), các cơ quan này lại chia thành các khối nhỏ hơn và cấp xuống cho các ISP, các ISP lại tiếp tục thực hiện chia nhỏ và cấp xuống cho các doanh nghiệp, cuối cùng, doanh nghiệp sẽ chia nhỏ khối IP được cấp thành các subnet.

Các địa chỉ IPv6 không sử dụng subnet mask trong khai báo địa chỉ mà chỉ sử dụng định dạng prefix-length. Ví dụ 2001:1111:2222:3333:4444:5555:6666:7777/64.

### V, Phân loại IPv6
#### 5.1, Unicast Address:
Địa chỉ unicast xác định một giao diện duy nhất. Trong mô hình định tuyến, các gói tin có địa chỉ đích là địa chỉ unicast chỉ được gửi tới một giao diện duy nhất. Địa chỉ unicast được sử dụng trong giao tiếp một – một

- Global Unicast Address: Là địa chỉ IPv6 toàn cầu (tương tự như địa chỉ public của IPv4). Phạm vi định vị của GUA là toàn hệ thống IPv6 trên thế giới.
  * 3 bit đầu luôn có giá trị là 001 (Prefix=2000::/3)
  * Global Routing Prefix: gồm 45 bit. Là địa chỉ được cung cấp cho công ty, cơ quan, tập đoàn hay một tổ chức nào đó khi đăng ký địa chỉ IPv6 public.
  * Subnet ID: Gồm 16 bit, là địa chỉ do các tổ chức tự cấp.
  * Interface ID: Gồm 64 bit, là địa chỉ của các interface trong subnet.

![](/Linux/image/sn1.png)

- Link-local Address: Là địa chỉ được sử dụng cho những node trên 1 link duy nhất. Tự động cấu hình, tìm kiếm neighbor. Router không được chuyển tiếp gói tín có địa chỉ nguồn hoặc đích là link-local ra khỏi phạm vi liên kết. Bao gồm các địa chỉ dùng cho các host trong cùng 1 link và quy trình xác định các node (Neighbor Discovery Process), qua đó các node trong cùng link cũng có thể liên lạc với nhau. Phạm vi sử dụng của LLA là trong cùng 1 link (do đó có thể trùng nhau ở link khác). Khi dùng HĐH Windows, LLA được cấp tự động như sau:
  * 64 bit đầu có giá trị FE80 là giá trị cố định (Prefix=FE80::/64)
  * Interface ID: gồm 64 bit kết hợp cùng địa chỉ MAC. Ví dụ: FE80::1CEF:01BC:FE01:1101

![](/Linux/image/sn2.png)

- Site Local Address: Được sử dụng trong hệ thống nội bộ (Intranet) tương tự các địa chỉ Private IPv4 (10.X.X.X, 172.16.X.X, 192.168.X.X). Phạm vi sử dụng Site-Local Addresses là trong cùng Site.
  * 1111 1110 11: 10 bit đầu là giá trị cố định (Prefix=FEC0/10)
  * Subnet ID: gồm 54 bit dùng để xác định các subnet trong cùng site.
  * Interface ID: Gồm 64 bit là địa chỉ của các interface trong subnet. Lưu ý: Hai dạng địa chỉ Unicast (LLA và SLA) vừa trình bày trên được gọi chung là các địa chỉ unicast nội bộ (Local Use Unicast Address). Với cấu trúc như thế thì các Local Use Unicast Address có thể bị trùng lặp (trong các Link khác hoặc Site khác). Do vậy khi sử dụng các Local Use Unicast Address có 1 thông số định vị được thêm vào là Additional Identifier gọi là Zone ID.

![](/Linux/image/sn3.png)

- Unique-Local Addresses: Đối với các tổ chức có nhiều Site, Prefix của SLA có thể bị trùng lặp. Có thể thay thế SLA bằng ULA (RFC 4193), ULA là địa chỉ duy nhất của một Host trong hệ thống có nhiều Site với cấu trúc:
  * 1111 110: 7 bit đầu là giá trị cố định FC00/7. L=0: Local. → Prefix = FC00/8.
  * Global ID: Địa chỉ site. Có thể gán thêm tuỳ ý.
  * Subnet ID: Địa chỉ subnet trong site.

![](/Linux/image/sn4.png)

#### 5.2, Multicast Address:
Địa chỉ multicast định danh một nhóm nhiều giao diện. Gói tin có địa chỉ đích là địa chỉ multicast sẽ được gửi tới tất cả các giao diện trong nhóm được gắn địa chỉ đó. Địa chỉ multicast được sử dụng trong giao tiếp một – nhiều.

Trong địa chỉ IPv6 không còn tồn tại khái niệm địa chỉ Broadcast. Mọi chức năng của địa chỉ Broadcast trong IPv4 được đảm nhiệm thay thế bởi địa chỉ IPv6 Multicas

Địa chỉ Multicast giống địa chỉ Broadcast ở chỗ điểm đích của gói tin là một nhóm các máy trong một mạng, song không phải tất cả các máy. Trong khi Broadcast gửi trực tiếp tới mọi host trong một subnet thì Multicast chỉ gửi trực tiếp cho một nhóm xác định các host, các host này lại có thể thuộc các subnet khác nhau.

Host có thể lựa chọn có tham gia vào một nhóm Multicast cụ thể nào đó hay không (thường được thực hiện với thủ tục quản lý nhóm internet - Internet Group Management Protocol), trong khi đó với Broadcast, mọi host là thành viên của nhóm Broadcast bất kể nó có muốn hay không

![](/Linux/image/sn5.png)

  * Multicast Address được định nghĩa với prefix là FF::/8.
  * Từ FF00:: đến FF0F:: là địa chỉ dành riêng được quy định bởi IANA để sử dụng cho mục đích Multicast.
  * Octet thứ hai chỉ ra flag và scope của địa chỉ multicast

#### 5.3, Anycast Address:
Anycast là khái niệm mới của địa chỉ IPv6. Địa chỉ anycast cũng xác định tập hợp nhiều giao diện. Tuy nhiên, trong mô hình định tuyến, gói tin có địa chỉ đích anycast chỉ được gửi tới một giao diện duy nhất trong tập hợp. Giao diện đó là giao diện “gần nhất” theo khái niệm của thủ tục định tuyến. Thay vì gửi 1 gói tin đến 1 server nào đó, nó gửi gói tin đến địa chỉ chung mà sẽ được nhận ra bởi tất cả các loại server trong loại nào đó, và nó tin vào hệ thống định tuyến để đưa gói tin đến các server gần nhất này.

Trong giao thức IPv6, địa chỉ anycast không có cấu trúc đặc biệt. Các địa chỉ Anycast nằm trong một phần không gian của địa chỉ unicast. Do đó, về mặt cấu trúc địa chỉ Anycast không thể phân biệt với địa chỉ Unicast. Khi những địa chỉ Unicast được gán nhiều hơn cho một giao diện nó trở thành địa chỉ Anycast. Đối với những node được gán địa chỉ này phải được cấu hình với ý nghĩa của địa chỉ anycast.

#### 5.4, Địa chỉ IPv6 đặc biệt:
0:0:0:0:0:0:0:0: Được gọi là địa chỉ không xác định. Địa chỉ này không thật sự được gán cho một giao diện nào. Một host khi khởi tạo có thể sử dụng địa chỉ này như là địa chỉ nguồn của nó trước khi nó biết được địa chỉ thật của nó. Một địa chỉ không xác định không bao giờ có thể đóng vai trò là địa chỉ đích trong ghi tin IPv6 hay trong phần header của quá trình định tuyến.

0:0:0:0:0:0:0:1: Được gọi là địa chỉ loopback. Một nodes có thể sử dùng địa chỉ này để gửi một gói tin IPv6 cho chính nó. Địa chỉ loopback không bao giờ được sử dụng như địa chỉ nguồn của bất kỳ ghi tin IPv6 nào để gửi ra ngoài nodes. Một gói tin với địa chỉ loopback là địa chỉ đích sẽ không bao giờ có thể ra khỏi node đó.

