# Các giao thức định tuyến (Routing protocol)
là các giao thức xác định tuyến đường đi từ nguồn tới đích
## Định tuyến nội miền
- Sử dụng để cấu hình và duy trì bảng định tuyến trong tất cả các router thuộc cùng một miền.
- Có 3 giao thức định tuyến nội tuyến được sử dụng rộng rãi: RIP(Routing Information Protocol), OSPF(Open Shortest Path First), EIGRP(Enhance Interio Gateway Routing Protocol)
### 1. RIP(Routing Information Protocol)
- Giao thức định tuyến RIP ( Routing Information protocol ) Cho phép router trong 1 miền giao tiếp với nhau. Giá đường đi giữa hai thiết bị đầu cuối được xác định bằng số lượng các router trung gian trên đường đi đó. Độ dài tối đa của 1 tuyến đường là 15
- Truyền thông không tin cậy: Rip sử dụng giao thức udp để chuyển thông điệp Gửi quảng bá broadcast và multicast
- Thuật toán distance vector : rip sử dung thuật toán distance vector. Các router hàng xóm trao đổi bảng định tuyến cho nhau 30s 1 lần trong các thông điệp rip, mỗi thông điệp chứa tối đa 25 địa chỉ đích tới.
### 2. OSPF (Open Shortest Path First)
- Định tuyến nội miền: Cho phép trao đổi thông tin giữa các router trong 1 miền
 - Trao đổi các thông tin đã được kiểm chứng: Hai router trao đổi thông điệp OSPF với nhau có thể tiến hành thủ tục kiểm tra để xác định mình nhận được thông điệp đúng từ phía bên kia. Điều này ngăn ngừa được tin tặc tiến hành các cuộc tấn công bằng phương pháp gả mạo.
- Hỗ trợ phân mạng và CIDR. Bên cạnh đại chỉ 32 bit là mặt nạ 32 bit. Do đó OSPF hỗ trợ việc phân mạng, chia mạng to ra thành các mạng con.
**Hoạt động OSPF**
- Chọn Router – id: Khi router chạy OSPF  thì phải chọn một giá trị duy nhất  dùng để định danh cho router trong công đồng các router chạy OSPF. Giá trị này được gọi là Router-id. Mặc định, tiến trình OSPF trên mỗi router sẽ tự động bầu chọn giá trị router-id là đại chỉ ip cao nhất trong các interface  đang active, ưu tiên cổng loopback. Để đổi lại router – id của tiến trình, phải thực hiện khởi động lại router hoặc gỡ bỏ tiến trình OSPF rồi cấu hình lại, khi đó tiến trình bầu chọn router – id sẽ được thực hiện lại với các interface đang hiện hữu trên router.
- Thiết lập quan hệ láng giềng: Router chạy OSPF sẽ gửi gói tin  hello ra tất cả các cổng chạy OSPF, mặc định 10s/lần. Gói tin này được gửi đến địa chỉ multicast dành riêng cho OSPF là 224.0.0.5, đến tất cả các router chạy OSPF khác trên cùng phân đoạn mạng. Mục đích của gói tin hello là giúp cho router tìm kiếm láng giềng, thiết lập và duy trì mối quan hệ này
- Trao đổi LSDB: LSDB là một tấm bản đồ mạng và router sẽ căn cứ vào đó để tính toán định tuyến. LSDB phải hoàn toàn giống nhau giữa các router cùng vùng. Các router sẽ không trao đổi với nhau cả một bảng LSDB mà sẽ trao đổi với nhau từng đơn vị thông tin gọi là LSA – Link State Advertisement. Các đơn vị thông tin này lại được chứa trong các gói tin cụ thể gọi là LSU – Link State Update mà các router thực sự trao đổi với nhau.
- Tính toán xây dựng bảng định tuyến
###  3. EIGRP(Enhance Interio Gateway Routing Protocol)
**Ưu điểm**
- Bảo tồn băng thông và sử dụng băng thông một cách hiệu quả
- Khả năng hội tụ nhanh
- Hỗ trợ VLSM (Veriable Length Subnet Mask) và CIDA (Classles Inter Domain Routing)
- Chạy trực tiếp trên IP và protocol number là 88
- Load balancing trên tất cả các cost không bằng nhau
- Hỗ trợ tất cả các giao thức và cấu trúc dữ liệu ở layer 2
- Không dùng broadcast và dùng Multicast hoặc Unicast trong từng trường hợp cụ thể
- Hỗ trợ việc chứng thực
- Manual Summary trên bất kỳ interface nào

**Nhược điểm**
- EIGRP là một giao thức với rất nhiều ưu điểm và có thể được sử dụng trong những mô hình mạng vừa và lớn tuy nhiên vì đây là giao thức độc quyền của Cisco nên nó chỉ chạy trên thiết bị của cisco, trong khi đó không phải một tổ chức nào cũng có thể dùng toàn đồ Cisco mà còn các dòng sản phẩm khác nữa. Chính vì vậy, đây là một bất lợi của giao thức định tuyến EIGRP.

**Nguyên lí hoạt động**
- EIGRP Router lưu giữ các thông tin về đường đi và cấu trúc mạng trên RAM, nhờ đó chúng đáp ứng nhanh chóng theo sự thay đổi. Giống như OSPF, EIGRP cũng lưu những thông tin này thành từng bảng và từng cơ sở dữ liệu khác nhau. EIGRP lưu các con đường mà nó học được theo một cách đặc biệt. Mỗi con đường có trạng thái riêng và có đánh dấu để cung cấp thêm nhiều thông tin hữu dụng khác.
- Topology exchange: Những Router neighbor sẽ trao đổi thông tin lẫn nhau, cập nhật đầy đủ cấu trúc liên kết, topology mạng. Khi topoly mạng thay đổi nó sẽ cập nhật phần thay đổi.
- Choosing routes: Mỗi Router sẽ tiến hành phân tích bảng EIGRP topology table, chọn ra con đường định tuyến có metric tốt để đến các subnet. Sau khi thực hiện 3 bước ở trên, hệ điều hành IOS sẽ lưu 3 bảng EIGRP Tables quan trọng
  - Bảng láng giềng (Neighbor table): Bảng láng giềng là bảng quan trọng nhất của EIGRP, trong đó có danh sách các router thân mật với nó. Đối với mỗi giao thức mà EIGRP hỗ trợ thì nó sẽ có 1 bảng láng giềng tương ứng. Khi phát hiện một láng giềng mới, router sẽ ghi lại thông tin về địa chỉ, cổng kết nối.