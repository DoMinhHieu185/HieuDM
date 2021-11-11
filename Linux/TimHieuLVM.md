# Tìm hiểu về LVM
## I, Tổng quan
### 1, Khái niệm
Logical Volume Manager (LVM) : LVM là kỹ thuật quản lý việc thay đổi kích thước lưu trữ của ổ cứng. Là một phương pháp ấn định không gian ổ đĩa thành những logicalvolume khiến cho việc thay đổi kích thước của một phân vùng trở nên dễ dàng. Điều này thật dễ dàng khi bạn muốn quản lý công việc của mình tại riêng một phân vùng mà muốn mở rộng nó ra lớn hơn.

### 2, Bố cục
![](/Linux/image/lvm1.jpg)

Một bố cục LVM bao gồm : Hard drives, partitions, physical volume, volume group, logical volume, file systems.

* Physical Volumes: Một ổ đĩa vật lý có thể phân chia thành nhiều phân vùng vật lý gọi là Physical Volumes
* Volume Group: là 1 nhóm bao gồm nhiều Physical Volume trên 1 hoặc nhiều ổ đĩa khác nhau được liên kết lại thành 1 Volume group
* Logical volume: Một volume group được chia nhỏ ra thành nhiều logical volume, được format với các chuẩn định dạng Ext3, Ext4
* File Systems: Hệ thống tập tin quản lý các file và thư mục trên ổ đĩa, được mount tới các logical volumes

### 3, Chức năng
Quản lý các logical volume được mount với các file 1 cách dễ dàng hơn, dễ dàng tăng giảm kích thức sử dụng của logical mà không làm mất, thất thoát dữ liệu. Các tập có thể được thay đổi kích thước một cách linh hoạt khi có các yêu cầu thay đổi không gian và di chuyển giữa các thiết bị vật lý trong nhóm trên một hệ thống đang chạy hoặc xuất ra dễ dàng

## II, Ưu và Nhược điểm
**Ưu điểm**
* LV và PV thể được tạo, xóa và thay đổi kích thước trực tuyến mà không cần khởi động lại hệ thống
* LV cũng có thể được thay đổi kích thước động, vì vậy bạn có thể bắt đầu ví dụ như với một phân vùng nhỏ và định cấu hình nó để mở rộng khi dữ liệu được ghi trên đó.
* Bất kỳ số lượng đĩa và phân vùng nào cũng có thể được hợp nhất thành một đĩa lớn, hoặc một đĩa vật lý duy nhất có thể nhanh chóng được chia thành nhiều phân vùng với kích thước bất kỳ.
*  LVM cho phép tạo ảnh chụp nhanh LV tức thì trong khi hệ điều hành đang chạy và hỗ trợ các tính năng mã hóa nâng cao
* Không làm hỏng dịch vụ

**Nhược điểm**
* Các bước thiết lập phức tạp và khó khăn hơn
* Càng gắn nhiều đĩa cứng và thiết lập càng nhiều LVM thì hệ thống khởi động càng lâu.
* Khả năng mất dữ liệu cao khi một trong số các đĩa cứng bị hỏng.
* Windows không thể nhận ra vùng dữ liệu của LVM. Nếu Dual-boot ,Windows sẽ không thể truy cập dữ liệu trong LVM

## III, Cách hoạt động của LVM
Các khối xây dựng cơ bản của hệ thống là PV. Đây có thể là bất kỳ loại thiết bị lưu trữ có sẵn nào như đĩa thực (ổ cứng, SSD, v.v.), mảng RAID, phân vùng MBR và GPT hoặc nhiều nút thiết bị khối khác.

Các PV được kết hợp thành VG, Chúng tạo ra một không gian lưu trữ thống nhất, kết hợp sức chứa của tất cả các thiết bị bên dưới. VG có thể nhanh chóng được thay đổi kích thước bằng cách thêm hoặc bớt các PV

Từ 1 VG, các LV được tạo. Đây là những phân vùng thực tế có thể được định dạng với nhiều hệ thống tệp khác nhau và được sử dụng bởi hệ điều hành.

Không giống như các phân vùng đĩa truyền thống, các ổ đĩa logic rất linh hoạt vì chúng được trừu tượng hóa trong VG của chúng. Một LV không nhất thiết phải liền kề, nó có thể trải dài trên nhiều đĩa, có thể dễ dàng di chuyển và bạn có thể gán cho nó một cái tên thay vì một số để dễ nhận dạng hơn.

LVM chia các PV thành các khối nhỏ với tên gọi Physical extents (PE). Chúng có kích thước mặc định là 4 MB, phải liền kề và là đơn vị nhỏ nhất có thể được cấp phát. PE có thể được thêm và xóa khỏi các tập một cách nhanh chóng và là khái niệm cốt lõi cung cấp năng lượng cho LVM.

## IV, Các kiểu lưu trữ LVM
Mô hình hai kiểu lưu trữ

![](/Linux/image/lvm2.png)

Khi ta lưu trữ ổ dữ liệu vào ổ đĩa thì ta sẽ có hai kiểu lưu trữ như trên đó là linear và striped. Giả sử ta có các phân vùng từ b tới i như trên thì các kiểu lưu trữ sẽ được lưu trữ như sau

* Linear : Dữ liệu sẽ được lưu hết phân vùng này rồi bắt đầu chuyển sang phân vùng khác để lưu trữ
* Striped: sẽ chia đều các dữ liệu ra và ghi vào các phân vùng đã có. Và cách chia dữ liệu ra bao nhiêu thì được định sẵn bởi người cài đặt nó

#### Ưu điểm và nhược điểm của hai kiểu lưu trữ
**Linear**
* Ưu điểm : Các dữ liệu tập trung vào một phân vùng sẽ dễ dàng quản lý
* Nhược điểm : Khi bị mất dữ liệu sẽ mất hết dữ liệu của một phần đó. Làm việc chậm hơn bởi vì chỉ có một phân vùng mà trong khi các khu vừng khác không hoạt động

**Striped**
* Ưu điểm: Tốc độ sẽ nhanh hơn vì tất cả các phân vùng sẽ cùng làm việc. Tốc độ đọc và ghi cũng nhannh hơn phương pháp Linear
* Nhược điểm: Khi mất dữ liệu ở một phân vùng thì sẽ bị mất và ảnh hưởng rất nhiều dữ liệu bởi vì mỗi dữ liệu đều được lưu ở nhiều phân vùng khi sử dụng phương pháp striped

## V .Hướng dẫn sử dụng LVM
### 1. Thao tác tạo
  > Lưu ý : Nếu phân vùng được mount vào thư mục root rồi thì không thể tạo physical volume
**Tạo physical volume**

Ta sử dụng lệnh `pvcreate` theo cú pháp
```
pvcreate /dev/(tên phân vùng)
```
![](/Linux/image/lvm3.png)

Ta kiểm tra lại bằng lệnh `pvs` xem ta tạo được thành công physical volume hay chưa

![](/Linux/image/lvm4.png)

**Tạo một Group volume**

* Ta sử dụng lệnh `vgcreate` theo cú pháp
```
vgcreate (ten_group) /dev/(tên phân vùng 1) /dev/(tên phân vùng 2
```

Ta sử dụng lệnh vgs để kiểm tra xem group volume.

![](/Linux/image/lvm5.png)

**Tạo một Logical volume**
* Ta sử dụng lệnh `lvcreate` theo cú pháp
```
lvcreate -L size_volume -n (ten logical) (tên group volume)
```

Để kiểm tra logical volume thì ta sử dụng lệnh `lvs`

![](/Linux/image/lvm6.png)

**Định dạng logical volume**
```
 mkfs -t (loại filesystem) /dev/(tên volume group)/(tên logical-volume)
```
![](/Linux/image/lvm7.png)

**Mount logical volume vào thư mục và sử dụng:**

Tạo thư mục hieu và mount logical volume vào.
```
[root@localhost ~]# mkdir hieu
[root@localhost ~]# mount /dev/nhom1/hieu hieu/
```
kiểm tra lv đã được mount bằng lệnh `df -h`

![](/Linux/image/lvm8.png)

### 2. Thay đổi dung lượng
**Thay đổi dung lượng logical volume** ta sử dụng lệnh theo cú pháp
```
lvextend -L (n) /dev/(tên group)/(tên logical)
```
Trong đó
  * lvextend : là lệnh tăng dung lượng
  * lvreduce : là lệnh dùng để giảm dung lượng
  * -L : là option của lệnh
  * (n) : là số dùng để tăng giảm dung lượng theo ý muốn của ta

![](/Linux/image/lvm9.png)

Muốn tăng dung lượng thì ta làm giống như với giảm dung lượng chỉ cần thay đổi lệnh `lvreduce` thành lệnh `lvextend`

**Thay đổi dung lượng của một group volume**
* Tăng dụng lượng ta dùng lệnh `vgextend`
* Giảm dung lượng ta dùng lệnh `vgreduce`

Khi thay đổi dung lượng của một group volume thì ta sẽ thêm hoặc xóa phân vùng thuộc group để có thể thay đổi dung lượng của nó.

```
vgextend /dev/(tên vg) /dev/(tên pv)
```
```
vgreduce /dev/(ten vg) /dev/(tên pv)
```

### 3.Thao tác xóa
* Xoá 1 Physical volume bằng lệnh `pvremove`
```
pvremove /dev/(tên physical)
```
* Xoá volume group bằng lệnh `vgremove`
```
vgremove /dev/(tên group)
```
* xoá logical volume bằng lệnh `lvremove`
```
lvremove /dev/(ten group)/(ten logical)
```
