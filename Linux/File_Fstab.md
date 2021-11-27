# CẤU HÌNH FILE /ETC/FSTAB ĐỂ QUẢN LÝ VIỆC MOUNT THIẾT BỊ TRONG LINUX
### 1. Giới thiệu
File cấu hình /etc/fstab chứa thông tin về các thiết bị (phân vùng ổ cứng, CD/DVD, USB, ISO image…) trên máy tính bao gồm:
+ Đường dẫn tới file đại diện cho thiết bị.
+ Mount point: cho biết thiết bị được mount vào thư mục nào.
+ Các tùy chọn (option): chỉ ra thiết bị được mount như thế nào?
v.v..

Nếu bạn không thể truy cập các phân vùng dành cho Windows (NTFS, FAT), hoặc không thể mount ổ DVD, ghi dữ liệu vào USB, đọc file từ ổ mềm… thì có thể chip nhớ trên thiết bị bị lỗi hoặc cũng có thể bạn đã cấu hình file fstab không đúng cách!

fstab là file dạng văn bản (plain text), vì thế bạn có thể mở và chỉnh sửa nó sử dụng bất kỳ công cụ Text Editor nào với điều kiện bạn phải có đặc quyền root để lưu lại những thay đổi. Nếu bạn đang đăng nhập với tài khoản người dùng thông thường thì có thể sử dụng 2 lệnh su hoặc sudo để tạm thời chuyển sang đặc quyền root.

### 2. Cấu trúc của file /etc/fstab
Vì mỗi hệ thống có các thiết bị khác nhau nên thông tin trong file fstab ở mỗi máy cũng khác nhau. Nhưng về cơ bản, khi bạn nắm được định dạng chung của fstab thì không có gì khó khăn khi xem thông tin trong file này trên các hệ thống khác. Khi lệnh mount được thực thi, hệ thống sẽ đọc thông tin trong file fstab để đưa ra cách xử lý tương ứng. 

Các cột ở mỗi hàng được phân cách bởi khoảng trắng. Thứ tự các dòng là không quan trọng. Sau đây phần giải thích kỹ hơn ý nghĩa của từng cột:
+ Cột 1: cho biết loại thiết bị (phân vùng, CD/DVD, USB, ISO image…). Đồng thời cũng cho biết đường dẫn tới file đại diện cho thiết bị (device file) . Trong Linux, mọi tài nguyên phần cứng lẫn phần mềm đều được xem là file, các device file thường nằm ở thư mục /dev

+ Cột 2: đường dẫn của mount point, là một thư mục trống được tạo sẵn trong cây thư mục. Khi gõ lệnh mount, nếu bạn không chỉ định rõ mount point thì đây là mount point mặc định cho thiết bị ở cột 1. Thư mục chứa mount point thường là /mnt hay /media , mặc dù bạn có thể mount thiết bị vào bất cứ thư mục trống nào.

+ Cột 3: là kiểu filesystem của thiết bị. Linux hỗ trợ nhiều kiểu filesystem, dưới đây là 1 số filesystem phổ biến:

  * Ext2 và Ext3: điểm khác biệt lớn nhất giữa 2 loại filesystem này là ext3 hỗ trợ tính năng journaling, tức là khi bạn tắt máy không đúng cách (do cúp điện đột ngột, hệ thống bị treo nên phải nhấn nút khởi động lại…) thì khả năng mất mát dữ liệu ở mức thấp, đồng thời hệ điều hành sẽ không phải tốn thời gian để kiểm tra, tìm lỗi trên filesystem trong lần khởi động kế tiếp.
  * ReiserFS: cũng hỗ trợ tính năng journaling nhưng có thêm nhiều tính năng nổi trội hơn so với ext3. Ngày nay ext3, ReiserFS được chọn là filesystem mặc định trên nhiều bản phân phối Linux.
  * swap: phân vùng làm không gian bộ nhớ ảo, dùng để bổ sung thêm bộ nhớ cho hệ thống khi hệ điều hành phát hiện việc thiếu hụt bộ nhớ RAM.
  * Vfat (FAT16, FAT32) và NTFS: đây là các filesystem được Windows hỗ trợ.
  * nfs: dành cho các tài nguyên ở xa, được chia sẻ qua mạng sử dụng NFS
  * auto: đây không phải là 1 filesytem. Nó có nghĩa là hệ thống sẽ tự động nhận diện loại filesystem của thiết bị khi thiết bị đó được mount.

+ Cột 4: là các tùy chọn khi mount.

Nếu có nhiều tùy chọn thì chúng được phân cách bởi dấu phẩy. Dưới đây là 1 số tùy chọn đáng chú ý:
* auto: tự động mount thiết bị khi máy tính khởi động.
* noauto: không tự động mount, nếu muốn sử dụng thiết bị thì sau khi khởi động vào hệ thống bạn cần chạy lệnh mount.
* user: cho phép người dùng thông thường được quyền mount.
* nouser: chỉ có người dùng root mới có quyền mount.
* exec: cho phép chạy các file nhị phân (binary) trên thiết bị.
* noexec: không cho phép chạy các file binary trên thiết bị.
* ro (read-only): chỉ cho phép quyền đọc trên thiết bị.
* rw (read-write): cho phép quyền đọc/ghi trên thiết bị.
* sync: thao tác nhập xuất (I/O) trên filesystem được đồng bộ hóa.
* async: thao tác nhập xuất (I/O) trên filesystem diễn ra không đồng bộ.
* defaults: tương đương với tập các tùy chọn rw, suid, dev, exec, auto, nouser, async

+ Cột 5 là tùy chọn cho chương trình dump, công cụ sao lưu filesystem. Điền 0: bỏ qua việc sao lưu, 1: thực hiện sao lưu.

+ Cột 6 là tùy chọn cho chương trình fsck, công cụ dò lỗi trên filesystem. Điền 0: bỏ qua việc kiểm tra, 1: thực hiện kiểm tra

### Kết luận:
File /etc/fstab cung cấp các chỉ dẫn cho hệ điều hành trong việc nhận diện, quản lý việc mount các thiết bị. Đồng thời việc cấu hình lại file fstab cũng giúp ích cho bạn trong việc giảm bớt thời gian mount thiết bị bằng lệnh cũng như là kiểm soát việc truy cập tới thiết bị của người dùng.