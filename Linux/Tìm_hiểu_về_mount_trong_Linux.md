# Tìm hiểu về mount
Không giống như trong Windows, để có thể truy cập dữ liệu được lưu trữ trong USB, đĩa CD/DVD, file ISO, phân vùng ổ cứng, các tài nguyên được chia sẻ qua mạng (gọi chung là thiết bị)… trong Linux thì trước hết các thiết bị này các được gắn kết (mount) vào 1 thư mục trống (gọi là mount point) đã tồn tại sẵn trong cây thư mục. Và khi muốn tháo gỡ thiết bị đang hoạt động khỏi hệ thống thì bạn phải ngắt kết nối (unmount) giữa thiết bị với mount point trước. 2 công cụ: mount và umount giúp bạn thực hiện công việc gắn kết và tháo gỡ trên

### 1, Giới thiệu
Ngày nay thì bạn có thể lưu trữ dữ liệu trong nhiều thiết bị lưu trữ vật lý khác nhau như: CD/DVD, ổ cứng, USB, thẻ nhớ…. Trong đó mỗi thiết bị có các filesystem khác nhau như:

– FAT16, FAT32, NTFS:  thường gặp trong Windows.
– EXT2, EXT3, EXT4: thường gặp trong Linux.
– iso9660: định dạng của đĩa CD/DVD hoặc file ISO.

…

Hiểu đơn giản thì filesystem là các quy chuẩn về: cách thức cấp phát không gian lưu trữ cho file, quản lý thuộc tính của file; cách tổ chức, sắp xếp dữ liệu trên thiết bị sao cho việc tìm kiếm, truy cập tới dữ liệu được mau chóng và thuận tiện…

Việc truy cập tới các filesystem trong Windows rất dễ dàng, nhưng có thể bạn sẽ lúng túng khi chuyển sang sử dụng Linux khi không thể truy cập vào các thiết bị. Rất có thể đó là do bạn chưa thực hiện việc mount cho các thiết bị này. Tức là, thiết bị phải được gắn vào 1 thư mục trống bất kỳ có sẵn trên cây thư mục trước khi bạn có thể truy cập tới nó. Thư mục trống mà gắn với thiết bị kể trên được gọi là mount point.

Sau khi mount thiết bị, bạn có thể truy cập tới dữ liệu trong thiết bị bằng cách truy cập vào mount point. Bạn cần thực hiện thao thác unmount để hủy gắn kết thiết bị với hệ thống khi không còn cần truy cập tới thiết bị nữa.

### 2. Cách mount thiết bị
Linux có khả năng tự nhận biết được các filesystem đang được kết nối với hệ thống. Tuy nhiên, để có thể sử dụng được các filesystem này, bắt buộc bạn phải làm một công việc gọi là mount.

Bạn có thể sử dụng lệnh mount để mount filesystem, hoặc có thể mount tự động thông qua file cấu hình /etc/fstab

Các tham số của lệnh mount và file /etc/fstab là tương tự, 1 số điểm cần lưu ý khi mount là:

* Những thiết bị không có mặt trong file /etc/fstab thì chỉ có root mới có thể mount được.
* Người dùng bình thường chỉ có thể mount được những thiết bị có trong file /etc/fstab và thiết bị này phải có tùy chọn user được bật lên.
Khi mount, bạn cần chỉ định thiết bị cần mount và vị trí của mount point.

Ví dụ để mount ổ CD bạn sử dụng lệnh
```
$ mount /dev/cdrom /media/cdrom
```
Trong đó, /dev/cdrom là đường dẫn tới ổ CD-ROM cần mount và /media/cdrom là mount point.

Bây giờ, khi bạn truy cập tới thư mục /media/cdrom thì bạn mới thực sử truy cập được nội dung trong đĩa CD.

### 3. Về mount point
Thông thường mount point được tạo ở trong thư mục /mnt (đối với các phân vùng trên ổ cứng IDE hoặc SCSI) hoặc /media (đối với các thiết bị lưu trữ di động như ổ CD/DVD/USB).

Tên thư mục làm mount point là không quan trọng. VD: /mnt/uit-usb, /media/ my-cd,… đều được chấp nhận. Mặc dù vậy nhiều bản phân phối Linux có các thư mục làm mount point mặc định như với ổ CD-ROM là /mnt/cdrom, còn ổ đĩa mềm là /mnt/floppy…

Trong trường hợp có sẵn các mount point mặc định này thì trong lệnh mount bạn chỉ cần cung cấp 1 trong 2 thông tin: đường dẫn tới thiết bị cần mount hoặc mount point mặc định của thiết bị đó.

Ví dụ, 2 lệnh sau tương đương với lệnh $ mount /dev/cdrom mnt/cdrom
```
$ mount /mnt/cdrom

$ mount /dev/cdrom
```
Các mount point mặc định cho các thiết bị được cấu hình trong file /etc/fstab.

### 4. Cách unmount thiết bị
Bạn sử dụng lệnh umount (chú ý: không phải unmount) để ngắt kết nối thiết bị khỏi hệ thống. Ví dụ để gỡ bỏ ổ CD-ROM bạn gõ lệnh:
```
$ umount /mnt/cdrom
```
hoặc
```
$ umount /dev/cdrom
```
Nếu bạn rút trực tiếp thiết bị khỏi máy tính mà không unmount trước thì có thể dữ liệu trên thiết bị sẽ bị lỗi hoặc tệ hơn làm hỏng luôn thiết bị!