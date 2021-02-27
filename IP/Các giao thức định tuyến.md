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
 


