# Các giải pháp thay thế lưu trữ
### Multipath
Hạt nhân Linux hiện hỗ trợ đa phương pháp Device Mapper (DM), cho phép bạn định cấu hình nhiều đường dẫn giữa hệ thống Linux và các thiết bị lưu trữ mạng.

Các công cụ đa phân vùng DM của Linux bao gồm:
* dm-multiath: Mô-đun hạt nhân cung cấp hỗ trợ đa đường
* multipath: Một lệnh dòng lệnh để xem các thiết bị đa đường
* multipathd: Một quy trình nền để giám sát các đường dẫn và kích hoạt / hủy kích hoạt các đường dẫn
* kpartx: Một công cụ dòng lệnh để tạo các mục nhập thiết bị cho các thiết bị lưu trữ đa đường


### Logical Volume Manager

LVM là công nghệ giúp quản lý các thiết bị lưu trữ dữ liệu trên các hệ điều hành linux. Nó cho phép người dùng gom các ổ cứng vật lý lại và tách chúng thành những phân vùng nhỏ hơn, dễ dàng mở rộng khi cần thiết. 

Một bố cục LVM bao gồm : Hard drives, partitions, physical volume, volume group, logical volume, file systems.

- Physical Volumes: Một ổ đĩa vật lý có thể phân chia thành nhiều phân vùng vật lý gọi là Physical Volumes
- Volume Group: là 1 nhóm bao gồm nhiều Physical Volume trên 1 hoặc nhiều ổ đĩa khác nhau được liên kết lại thành 1 Volume group
- Logical volume: Một volume group được chia nhỏ ra thành nhiều logical volume, được format với các chuẩn định dạng Ext3, Ext4
- File Systems: Hệ thống tập tin quản lý các file và thư mục trên ổ đĩa, được mount tới các logical volumes

###  Using RAID Technology

- RAID chỉ nên làm việc với các loại ổ cứng dung lượng bằng nhau.
- Sử dụng RAID sẽ tốn số lượng ổ nhiều hơn bình thường, nhưng đổi lại là dữ liệu sẽ an toàn hơn.

Một số phiên bản RAID thường được sử dụng: 

- RAID 0 bằng tổng dung lượng các ổ cộng lại.
- RAID 1 chỉ duy trì dung lượng 1 ổ.
- RAID 5 sẽ có dung lượng ít hơn 1 ổ (5 ổ dùng raid 5 sẽ có dung lượng 4 ổ).
- RAID 6 sẽ có dung lượng ít hơn 2 ổ (5 ổ dùng raid 6 sẽ có dung lượng 3 ổ).
- RAID 10 sẽ chỉ tạo được khi số ổ là chẵn, phải có tối thiểu từ 2 ổ trở lên. Dung lượng bằng tổng số ổ chia đôi (10 ổ thì dung lượng sử dụng là 5 ổ).