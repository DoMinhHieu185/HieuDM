# IP
# Địa chỉ IP là gì?
Địa chỉ IP (IP là viết tắt của từ tiếng Anh: Internet Protocol - giao thức Internet) Địa chỉ IP cung cấp danh tính riêng biệt cho các thiết bị trên mạng dữ liệu IP để chúng có thể tìm thấy nhau trong vô vàn thiết bị trong mạng Mỗi gói tin đi qua mạng TCP/IP đều có một địa chỉ IP xác định thiết bị đã gửi gói tin đó và cũng chứa thông tin đích đến để gói tin có thể được định tuyến thành công đến nơi cần đến.
## Các loại địa chỉ IP
Tùy vào mục đích sử dụng mà địa chỉ IP được phân làm: Địa chỉ IP công cộng – IP Public, IP Private – địa chỉ IP riêng, địa chỉ IP tĩnh – Static IP và Dynamic IP – địa chỉ IP động. Chúng có thể được phân là IPv4 hoặc IPv6, cả IP Public và IP Private đều tồn tại dưới dạng IP động hay IP tĩnh.
1. IP Public là gì?
* IP public là địa chỉ IP công cộng được nhà cung cấp dịch vụ internet chỉ định. Đây là địa chỉ mà mạng gia đình hay doanh nghiệp sử dụng để liên lạc với các thiết bị kết nối internet khác, cho phép các thiết bị trong mạng truy cập web hay liên lạc trực tiếp với máy tính của người dùng khác
2. IP Private là gì?
* IP Private hay còn gọi là IP riêng sử dụng trong nội bộ mạng LAN, giống như mạng gia đình hay mạng quán nét. Khác với IP công cộng, IP Private không thể kết nối với mạng internet, chỉ các thiết bị trong mạng mới có thể giao tiếp với nhau thông qua bộ định tuyến còn gọi là router. Địa chỉ IP riêng được bộ định tuyến gán tự động hoặc bạn có thể thiết lập theo cách thủ công.
3. IP Static là gì?
* IP Static hay còn gọi là IP tĩnh, đây là cách đặt IP cho từng thiết bị hoàn toàn thủ công và không bị thay đổi theo thời gian.
4. IP Dynamic là gì?
* IP Dynamic là IP động, có nghĩa rằng địa chỉ IP của máy tính có thể thay đổi, hôm nay là A thì ngày mai lại là B. Điều này xảy ra hoàn toàn tự động và được quản lý bởi máy chủ được gọi là DHCP Server.
# IPv4
## IPv4 là gì?
Ipv4 là phiên bản thứ tư trong quá trình phát triển của các giao thức Internet (IP). Đây là phiên bản đầu tiên của IP được sử dụng rộng rãi. 
IPv4 là giao thức hướng dữ liệu, được sử dụng cho hệ thống chuyển mạch gói. Đây là giao thức truyền dữ liêu hoạt động dựa trên nguyên tắc tốt nhất có thể, trong đó, nó không quan tâm đến thứ tự truyền gói tin cũng như không đảm bảo gói tin sẽ đến đích hay việc gây ra tình trạng lặp gói tin ở đích đến. Việc xử lý vấn đề này dành cho lớp trên của chồng giao thức TCP/IP. Tuy nhiên, IPv4 có cơ chế đảm bảo tính toàn vẹn dữ liệu thông qua sử dụng những gói kiểm tra (checksum)..
## Cấu trúc địa chỉ IPv4
Địa chỉ IPv4 gồm 32 bit nhị phân với mỗi bit được gắn giá trị 1 hoặc 0. Do địa chỉ IPv4 chia làm 4 phần bằng nhau và được phân cách bởi dấu chấm "." với mỗi phần là là 8 bit (1 byte) với giá trị thập phân tuơng ứng từ 0 đến 255, ta gọi mỗi phần này là một octet.
Như vậy, với 32 bit, giới hạn của địa chỉ IPv4 là từ 0.0.0.0 đến 255.255.255.255.
Địa chỉ IP được chia thành 2 phần là network (phần mạng) và phần Host.
* Network ID là địa chỉ mạng, địa chỉ mạng là địa chỉ được cấp cho từng mạng riêng.
* Host ID (hay Host Address) là địa chỉ của máy trong mạng.
Địa chỉ IP có 32 bit nhị phân và được chia thành các octet (4 cụm, 8 bit)
## Các quy tắc được áp dụng khi đặt địa chỉ IP:
- Các bit phần mạng không được phép đặt đồng thời bằng 0 ( Ví dụ: Không hợp lệ nếu đặt địa chỉ 0.0.0.1 với phần mạng 0.0.0 và phần Host là 1).
- Sẽ có một địa chỉ mạng nếu các bit phần Host đồng thời có giá trị bằng 0 (Ví dụ : Địa chỉ 192.168.1.1 có thể gán cho Host nhưng thay giá trị 0 vào 192.168.1.0 sẽ thành địa chỉ mạng và không thể gán cho Host).
- Sẽ có địa chỉ Broadcast cho mạng nếu các bit phần Host đồng thời bằng 1 ( Ví dụ: Mạng 192.168.1.0 có địa chỉ 192.168.1.255 là địa chỉ Broadcast).
- ID mạng không được là số thập phân 127
- Không thể gán ID mạng từ 224 trở lên trong octet đầu tiên cho máy chủ

![](https://image.prntscr.com/image/fVxsmG0ARJCJsyV9uAI_uw.png "Cấu trúc IP")
## Các lớp đại chỉ IPv4
1 . Lớp A
* Lớp A của địa chỉ IPv4 sử dụng octet đầu làm phần mạng và 3 octet sau làm Host
* 0 luôn được chọn là bit đầu của địa chỉ lớp A
* Các địa chỉ mạng lớp A gồm 1.0.0.0 => 126.0.0.0
* Tuy nhiên, địa chỉ 0 (Thập phân) không được sử dụng và địa chỉ 127 (thập phân) được dành cho Loopback và chuẩn đoán, kiểm tra lỗi, nên dải địa chỉ lớp A sẽ là từ 1.x.x.x đến 126.x.x.x
* Phần Host gồm 24 bit, mỗi mạng lớp A có 2^24  – 2 Host

![](https://image.prntscr.com/image/aAGgS0GjQ56f_JUR6Op3Hg.png)
2. Lớp B
* Hai octet đầu của địa chỉ lớp B được dùng làm phần mạng, 2 octet sau được dùng làm Host
* 1 và 0 luôn được giữ cho hai bit đầu của địa chỉ lớp B
* Địa chỉ mạng lớp B gồm 128.0.0.0 đến 191.255.0.0 (tổng cộng có 214 mạng trong lớp B)
* Một mạng lớp B có 2^16 – 2 Host vì phần Host của lớp này dài 16 bit

![](https://image.prntscr.com/image/g69z4CDMQ42WSB2GB_6hVg.png)
3. Lớp C
* Địa chỉ lớp C dùng 3 octet đầu làm phần mạng và octet sau làm phần Host
* 1, 1 và 0 được giữ cho ba bit đầu của địa chỉ lớp C
* Mạng lớp C bao gồm các địa chỉ 192.0.0 đến 223.255.255.0 
* Một mạng lớp C có 2^8 – 2 Host do phần Host của lớp này dài 8 bit

![](https://image.prntscr.com/image/1rUHTV-uROiGdj0BwWKA-g.png)

4. Lớp D
* Lớp D bao gồm các địa chỉ từ 224.0.0.0 đến 239.255.255
* Lớp D được dùng làm địa chỉ Multicast. VD: 224.0.0.5 dùng cho OSPF hay 224.0.0.9 dùng cho RIPv2
5. Lớp E
* Gồm các địa chỉ từ dải 240.0.0.0 trở đi
* Địa chỉ lớp E được dùng với mục đích dự phòng
## Phân biệt IP Public và IP Private
1. Ip Public là gì
* Public IP là địa chỉ được ISP (nhà cung cấp dịch vụ Internet) cấp và có thế được "nhìn thấy" và truy cập từ Internet. Giống như địa chỉ nhà dùng để nhận thư tín, bưu phẩm vậy. Mỗi public IP chỉ tồn tại độc nhất trên mạng Internet cho cả toàn cầu, vì đó không thể tồn tại hai thiết bị (server, máy tính, router,...) có cùng địa chỉ public IP.
* Đa phần người dùng phổ thông không có quyền kiểm soát địa chỉ public IP của mình, quyền đó thuộc về ISP.
* Một public IP có thể là tĩnh (static) hoặc động (dynamic) tùy theo loại dịch vụ của người dùng. Một địa chỉ public IP tĩnh không thay đổi và thường được dùng cho hosting các trang web, hoặc dịch vụ trên Internet. Mặt khác, địa chỉ động được chọn từ một "hồ chứa" các địa chỉ có sẵn và thay đổi mỗi lần người dùng kết nối đến Internet.
Đa số ISPs hiện nay cung cấp địa chỉ IP động cho người dùng!
* IP Public mới kết nối được internet 
2. IP private là gì?
* IP Private gọi là IP riêng, nhiều IP Private tao thành dải mạng Private Network. Nhiều người còn gọi lại IP LAN, IP Localhost.
* Chỉ sử dụng được trong mạng cục bộ, có thể tái sử dụng lại ở mạng cục bộ khác, nhưng trong một mạng thì vẫn phải mang giá trị duy nhất.
* Với mỗi phân lớp địa chỉ IP, thì có một dải địa chỉ dùng để làm địa chỉ private cho lớp đó:
- Lớp A: Từ 10.0.0.0 đến 10.255.255.255, subnet mask 255.0.0.0
- Lớp B: Từ 172.16.0.0 đến 172.31.255.255, subnet mask 255.240.0.0
- Lớp C: Từ 192.168.0.0 đến 192.168.255.255, subnet mask 255.255.0.0
* Khi các thiết bị sử dụng địa chỉ IP private trong mạng cục bộ muốn truy cập được Internet – môi trường không sử dụng địa chỉ private, công nghệ NAT (Network Address Translation) được cài đặt trên các thiết bị router(đã được gán 1 địa chỉ IP Public) được sử dụng để chuyển IP private thành IP public và ngược lại, giúp cho các thiết bị trong mạng cục bộ vẫn có thể truy cập được Internet.
* IP Private không kết nối được internet.
## Địa chỉ Broadcast
* Khi muốn gửi thông điệp đến tất cả các máy trong mạng nội bộ, đó là lúc ta cần sử dụng đến địa chỉ Broadcast. Địa chỉ Broadcast là địa chỉ có toàn bộ các bits phần host-id là 1. Khi gói tin được gửi đến địa chỉ Broadcast, thì nó sẽ được gửi tới tất cả các máy cùng mạng, tức là cùng phần net-id. Vì đại diện cho toàn bộ thiết bị trong mạng nên địa chỉ Broadcast không thể đặt được cho bất kỳ thiết bị nào.
- Ví dụ: 192.168.1.255/24 là địa chỉ Broadcast của mạng 192.168.1.0/24.
## Subnetmask là gì?
* Mỗi địa chỉ IP luôn đi kèm với một Subnet mask, để xác định được phần net-id của địa chỉ đó. Subnet mask cũng là một dải nhị phân dài 32 bits và chia ra 4 bộ 8 bits như địa chỉ IP.
* Subnet mask được sử dụng để xác định khối địa chỉ IP được cung cấp.
* Subnet mask bao gồm phần các bits 1 và phần còn lại là các bits 0, subnet mask có bao nhiêu bit 1 thì địa chỉ IP tương ứng sẽ có bấy nhiêu bit phần net-id.
* Ví dụ: với subnet mask như sau: 11111111 11111111 11111111 00000000 (255.255.255.0) bao gồm 24 bits 1, thì địa chỉ IP mang subnet mask này cũng sẽ có 24 bits phần net-id.
* Lưu ý, một địa chỉ IP có thể thuộc các mạng khác nhau nếu sử dụng các subnet mask khác nhau. Để xác định địa chỉ IP đó thuộc mạng nào, ta chỉ cần lấy địa chỉ IP AND (bitwise) với subnet mask tương ứng.
* Ví dụ: 192.168.1.3 AND 255.255.255.0 = 192.168.1.0 vậy địa chỉ 192.168.1.3/24 thuộc mạng 192.168.1.0/24
* ví dụ: 192.168.48.2 and 255.255.255.248 = 192.168.48.0 vậy địa chỉ 192.168.48.2/21 thuộc mạng 192.168.48.0/21





