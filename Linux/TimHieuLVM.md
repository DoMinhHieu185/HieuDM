# Tìm hiểu về LVM
- [I, Tổng quan](#I-Tổng-quan)
  - [1, Khái niệm](#1-Khai-niệm)
  - [2, Bố cục](#2-Bố-cục)
  - [3, Chức năng](#3-Chức-năng)
- [II, Ưu và Nhược điểm](#II-Ưu-và-Nhược-điểm)
- [III, Cách hoạt động của LVM](#III-Cách-hoạt-động-của-LVM)
- [IV, Các kiểu lưu trữ LVM](#IV-Các-kiểu-lưu-trữ-LVM)
- [V, Hướng dẫn sử dụng LVM](#V-Hướng-dẫn-sử-dụng-LVM)
  - [1. Thao tác tạo](#1-Thao-tác-tạo)
  - [2. Thay đổi dung lượng](#2-Thay-đổi-dung-lượng)
  - [3.Thao tác xóa](#3-Thao-tác-xóa)
  - [4.Snapshot và restore của Logical Volume](#4-Snapshot-và-restore-của-Logical-Volume)
  - [5, Tính năng Thin Provisioning Volumes](#5-Tính-năng-Thin-Provisioning-Volumes)
  - [6,Tính năng Manage Multiple Logical Volume Management Disk sử dụng Striping I/O](#6-Tính-năng-Manage-Multiple-Logical-Volume-Management-Disk-sử-dụng-Striping-I/O)
  - [7, Tính năng LVM Migration](#7-Tính-năng-LVM-Migration)

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

## V, Hướng dẫn sử dụng LVM
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

### 4, Snapshot và restore của Logical Volume
#### 4.1, Snapshot Logical Volume
##### Tạo snapshot LVM
```
lvcreate -L <số dung lượng snapshot> -s -n <tên snapshot> /dev/<tên vg>/<tên lv>
```
Trong đó ý nghĩa các tuỳ chọn là:
  * -s: Tạo snapshot
  * -n: Tên cho snapshot

![](/Linux/image/lvm10.png)

Kiểm tra lại snapshot đã được tạo

![](/Linux/image/lvm11.png)

Để biết thêm thông tin chi tiết về snapshot dùng lệnh
```
[root@localhost hieu]# lvdisplay /dev/nhom1/hieu_snapshot
  --- Logical volume ---
  LV Path                /dev/nhom1/hieu_snapshot
  LV Name                hieu_snapshot
  VG Name                nhom1
  LV UUID                bUOx8A-cEb0-68MW-rPRZ-Y2et-c6dn-pJNlZp
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2021-11-14 15:07:33 +0700
  LV snapshot status     active destination for hieu
  LV Status              available
  # open                 0
  LV Size                10.00 GiB
  Current LE             2560
  COW-table size         5.00 GiB
  COW-table LE           1280
  Allocated to snapshot  0.01%
  Snapshot chunk size    4.00 KiB
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:5
```
Trong đó ý nghĩa các trường của lệnh `lvdisplay` như sau:

* LV Name: Tên của Snapshot Logical Volume.
* VG Name.: Tên Volume group đang được sử dụng.
* LV Write Access: Snapshot volume ở chế độ đọc và ghi.
* LV Creation host, time: Thời gian khi snapshot được tạo. Nó rất quan trọng vì snapshot sẽ tìm mọi thay đổi sau thời gian này.
* LV snapshot status: Snapshot này thuộc vào logical volume `hieu`.
* LV Size: Kích thước của Source volume mà bạn đã snapshot.
* COW-table size: Kích thước bảng Cow.
* Snapshot chunk size: Cung cấp kích thước của chunk cho snapshot.

  > Nếu chúng ta có Source volume có kích thước là 10GB thì chúng ta cũng nên tạo snapshot có dung lượng 10GB để đủ không gian chứa các thay đổi của Source volume.
  > Chú ý: Dung lượng Snapshot tăng lên đúng bằng dung lượng tạo mới trên LV. Không thể tạo Snapshot mới ghi đè lên Snapshot cũ. Trường hợp bạn có 2 Snapshot cho cùng 1 ổ LV thì dữ liệu mới cũng được ghi cả vào 2 ổ Snapshot

##### Tăng dung lượng snapshot trong lvm
Chúng ta cần mở rộng kích thước của snapshot, chúng ta có thể thực hiện bằng cách sử dụng:
```
[root@localhost hieu]# lvextend -L +5GB /dev/nhom1/hieu_snapshot
  Size of logical volume nhom1/hieu_snapshot changed from 5.00 GiB (1280 extents) to 10.00 GiB (2560 extents).
  Logical volume nhom1/hieu_snapshot successfully resized.
```
kiểm tra kích thước mới
```
[root@localhost hieu]# lvdisplay /dev/nhom1/hieu_snapshot
  --- Logical volume ---
  LV Path                /dev/nhom1/hieu_snapshot
  LV Name                hieu_snapshot
  VG Name                nhom1
  LV UUID                bUOx8A-cEb0-68MW-rPRZ-Y2et-c6dn-pJNlZp
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2021-11-14 15:07:33 +0700
  LV snapshot status     active destination for hieu
  LV Status              available
  # open                 0
  LV Size                10.00 GiB
  Current LE             2560
  COW-table size         10.00 GiB
  COW-table LE           2560
  Allocated to snapshot  9.69%
  Snapshot chunk size    4.00 KiB
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     8192
  Block device           253:5
```
* Mở rộng tự động

Vào file /etc/lvm/lvm.conf và chỉnh sửa

![](/Linux/image/lvm12.png)

Dòng 1: Khi dung lượng đạt tới 100% Dòng 2: Kích thước volume sẽ tăng 20%
#### 4.2, Restore Logical Volume
Để restore snapshot, chúng ta cần hủy gắn kết hệ thống tệp bằng lệnh `umount`
```
[root@localhost ~]# umount /dev/nhom1/hieu /mnt/hieu
[root@localhost ~]# df -h
Filesystem               Size  Used Avail Use% Mounted on
devtmpfs                 475M     0  475M   0% /dev
tmpfs                    487M     0  487M   0% /dev/shm
tmpfs                    487M  7.7M  479M   2% /run
tmpfs                    487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos-root   18G  1.4G   17G   8% /
/dev/sda1                509M  131M  379M  26% /boot
tmpfs                     98M     0   98M   0% /run/user/0
```
Điểm gắn kết của chúng ta đã được huỷ, vì vậy chúng ta có thể tiếp tục restore snapshot. Để restore snapshot bằng lệnh `lvconvert`.
```
[root@localhost ~]# lvs
  LV            VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root          centos -wi-ao---- <17.50g
  swap          centos -wi-ao----   2.00g
  hieu          nhom1  owi-a-s---  10.00g
  hieu_snapshot nhom1  swi-a-s---  10.00g      hieu   9.70
[root@localhost ~]# lvconvert --merge /dev/nhom1/hieu_snapshot
  Merging of volume nhom1/hieu_snapshot started.
  nhom1/hieu: Merged: 90.39%
  nhom1/hieu: Merged: 100.00%
[root@localhost ~]# lvs
  LV   VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root centos -wi-ao---- <17.50g
  swap centos -wi-ao----   2.00g
  hieu nhom1  -wi-a-----  10.00g
[root@localhost ~]# mount /dev/nhom1/hieu /mnt/hieu
[root@localhost ~]# df -h
Filesystem               Size  Used Avail Use% Mounted on
devtmpfs                 475M     0  475M   0% /dev
tmpfs                    487M     0  487M   0% /dev/shm
tmpfs                    487M  7.7M  479M   2% /run
tmpfs                    487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos-root   18G  1.4G   17G   8% /
/dev/sda1                509M  131M  379M  26% /boot
tmpfs                     98M     0   98M   0% /run/user/0
/dev/mapper/nhom1-hieu   8.8G   58M  8.3G   1% /mnt/hieu
```
Sau khi merge hoàn thành, snapshot volume sẽ tự động bị xóa.

Chúng ta kiểm tra lại `/dev/vg0/projects` để xem kết quả:
```
[root@localhost ~]# cd /mnt/hieu
[root@localhost hieu]# ls -l
total 22436
-rw-r--r--. 1 root root       39 Nov 14 14:25 hieu.txt
-rw-r--r--. 1 root root  7171689 Nov 14 14:38 latest-vi.tar.gz
-rw-r--r--. 1 root root 15779454 Nov 11 02:14 latest-vi.tar.gz.1
drwx------. 2 root root    16384 Nov 11 15:29 lost+found
[root@localhost hieu]# cat hieu.txt
Day la Do Minh Hieu
18/05/1999
Yen Bai
```
Qua kiểm tra trên thì kết quả restore cho chúng ta thấy kết quả trả về ban đầu trước khi chúng ta thực hiện snapshot, dù cho chúng ta có điều chỉnh gì sau khi tạo snapshot thì khi restore vẫn trở về lúc chúng ta tạo snapshot.

### 5, Tính năng Thin Provisioning Volumes
Tính năng này cho phép chúng ta tạo ra số Volume có tổng dung lượng lớn hơn dung lượng cho phép.
#### 5.1, Setup Thin Pool và Volume
Chúng ta tạo 1 Physical Volume /dev/sde và sau đó dùng lệnh sau để tạo ra 1 Volume group cho Thin-Pool:
```
[root@localhost ~]# pvcreate /dev/sde
  Physical volume "/dev/sde" successfully created.
[root@localhost ~]# vgcreate vg-thin /dev/sde
  Volume group "vg-thin" successfully created
```
Tiếp theo, kiểm tra kích thước Logical volume, trước khi tạo thin pool và volume. Thực hiện như bên dưới:
```
[root@localhost ~]# vgs
  VG      #PV #LV #SN Attr   VSize   VFree
  centos    1   2   0 wz--n- <19.50g      0
  nhom1     2   1   0 wz--n-  39.99g  29.99g
  vg-thin   1   0   0 wz--n- <10.00g <10.00g
[root@localhost ~]# lvs
  LV   VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root centos -wi-ao---- <17.50g
  swap centos -wi-ao----   2.00g
  hieu nhom1  -wi-ao----  10.00g
```
##### Tạo một Thin Pool
Chúng ta thực hiện tạo một Thin Pool với kích thước 8GB trong volume group(vg-thin) sử dụng lệnh sau:
```
[root@localhost ~]# lvcreate -L 8GB --thinpool demo vg-thin
  Thin pool volume with chunk size 64.00 KiB can address at most 15.81 TiB of data.
  Logical volume "demo" created.
```
Trong đó ý nghĩa các tùy chọn như sau:

  * -L: Kích thước của volume group
  * --thinpool: Tạo mới một thinpool
  * demo: Tên của thinpool
  * vg-thin: Tên của volume group mà chúng ta muốn tạo thinpool

##### Tạo Thin Volume
Chúng ta có thể xác định thin volume bên trong thin pool bằng cách sử dụng lệnh `lvcreate` cùng với tùy chọn `-V`. Thực hiện như bên dưới:
```
[root@localhost ~]# lvcreate -V 5G --thin -n thin-client1 vg-thin/demo
  Logical volume "thin-client1" created.
```
##### Tạo file system
Bây giờ, chúng ta sẽ tạo các điểm gắn kết và gắn 3 thin volume này và cho chúng chứa một số tệp bên trong chúng ta thực hiện như sau:

* Chạy các lệnh sau để tạo điểm gắn kết:
```
[root@localhost ~]# mkdir -p /mnt/client1 /mnt/client2 /mnt/client3
```
Định dạng filesystem
```
mkfs.ext4 /dev/vg-thin/thin-client1
mkfs.ext4 /dev/vg-thin/thin-client2
mkfs.ext4 /dev/vg-thin/thin-client3
```
* Gắn kết cả ba client volume vào điểm gắn kết đã tạo bằng lệnh mount.
```
[root@localhost mnt]#  mount /dev/vg-thin/thin-client1 /mnt/client1/
[root@localhost mnt]#  mount /dev/vg-thin/thin-client2 /mnt/client2/
[root@localhost mnt]#  mount /dev/vg-thin/thin-client3 /mnt/client3/
```
* Copy file vào các thư mục client để dung lượng ổ tăng lên
```
[root@localhost client3]# df -h
Filesystem                          Size  Used Avail Use% Mounted on
devtmpfs                            475M     0  475M   0% /dev
tmpfs                               487M     0  487M   0% /dev/shm
tmpfs                               487M  7.7M  479M   2% /run
tmpfs                               487M     0  487M   0% /sys/fs/cgroup
/dev/mapper/centos-root              18G  1.4G   17G   8% /
/dev/sda1                           509M  131M  379M  26% /boot
tmpfs                                98M     0   98M   0% /run/user/0
/dev/mapper/nhom1-hieu              8.8G   58M  8.3G   1% /mnt/hieu
/dev/mapper/vg--thin-thin--client1  4.8G  993M  3.6G  22% /mnt/client1
/dev/mapper/vg--thin-thin--client2  2.0G  980M  855M  54% /mnt/client2
/dev/mapper/vg--thin-thin--client3  976M  960M     0 100% /mnt/client3
[root@localhost client3]# lvs
  LV           VG      Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root         centos  -wi-ao---- <17.50g
  swap         centos  -wi-ao----   2.00g
  hieu         nhom1   -wi-ao----  10.00g
  demo         vg-thin twi-aotz--   8.00g             39.81  30.86
  thin-client1 vg-thin Vwi-aotz--   5.00g demo        23.13
  thin-client2 vg-thin Vwi-aotz--   2.00g demo        52.28
  thin-client3 vg-thin Vwi-aotz--   1.00g demo        98.29
```
Tổng kết lại thì với 1 Thin-Pool 8GB, ta có thể chia ra số Thin Volume Client có tổng dung lượng lớn hơn 8GB nhưng tổng mức dùng của các Thin Volume Client ko lớn hơn 8GB.

#### 5.2,Over Provisioning
Bây giờ chúng ta tạo thin-client4 với kích thước 2GB nhưng Thin Pool chỉ có kích thước 8GB chúng ta đạ dùng cho 3 thin-client trước. Vậy là trên lý thuyết ta ko thể cho client 2GB nữa. Cách giải quyết là dùng chức năng Over Provisioning.

Tạo thin-client4 với kích thước 5GB. Tạo thư mục /client4. Tạo File System và mount thin-client4.
```
[root@localhost client4]# lvs
  LV           VG      Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root         centos  -wi-ao---- <17.50g
  swap         centos  -wi-ao----   2.00g
  hieu         nhom1   -wi-ao----  10.00g
  demo         vg-thin twi-aotz--   8.00g             52.88  37.50
  thin-client1 vg-thin Vwi-aotz--   5.00g demo        23.13
  thin-client2 vg-thin Vwi-aotz--   2.00g demo        52.28
  thin-client3 vg-thin Vwi-aotz--   1.00g demo        98.29
  thin-client4 vg-thin Vwi-aotz--   2.00g demo        52.28
```
Chúng ta có thể thấy, tổng kích thước được sử dụng của thin-client 4 lên tới 52.25% và kích thước của thin-pool là 52.88% được sử dụng. Nếu tất cả những người dùng sử dụng toàn bộ dung lượng họ có thì dẫn đến nó sẽ không bị tràn. Để tránh trình trạng tràn, chúng ta cần mở rộng kích thước thin-pool.
  > Chú ý: Thin-pools là một logical volume, vì vậy nếu chúng ta cần mở rộng kích thước của thin-pool, chúng ta có thể sử dụng lệnh `lvextend`

Chúng ta có thể mở rộng logical thin-pool như sau:
```
[root@localhost ~]#  lvextend -L +5G /dev/vg-thin/demo
  Extending logical volume vg-thin/demo_tdata changed from 15.00 GiB (3840 extents) to 20.00 GiB (5169 extents).
  Logical volume vg-thin/demo_tdata successfully resized.
```

### 6,Tính năng Manage Multiple Logical Volume Management Disk sử dụng Striping I/O
LVM Striping là tính năng cho phép ghi dữ liệu lên nhiều ổ thay vì chỉ một ổ Physical volume.
```
[root@localhost ~]# lsblk
NAME            MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sda               8:0    0  20G  0 disk
├─sda1            8:1    0   1G  0 part /boot
└─sda2            8:2    0  19G  0 part
  ├─centos-root 253:0    0  17G  0 lvm  /
  └─centos-swap 253:1    0   2G  0 lvm  [SWAP]
sdb               8:16   0  10G  0 disk
└─sdb1            8:17   0   1G  0 part
sdc               8:32   0  10G  0 disk
└─sdc1            8:33   0   1G  0 part
sdd               8:48   0  10G  0 disk
└─sdd1            8:49   0   1G  0 part
sr0              11:0    1   1G  0 rom
```
Sau khi tạo 3 phân vùng thành công, bây giờ chúng ta tạo Physical volume bằng cách sử dụng tất cả 3 phân vùng này. Chạy lệnh như bên dưới:
```
[root@localhost ~]# pvcreate /dev/sdb1 /dev/sdc1 /dev/sdd1
  Physical volume "/dev/sdb1" successfully created.
  Physical volume "/dev/sdc1" successfully created.
  Physical volume "/dev/sdd1" successfully created.
[root@localhost ~]# pvs
  PV         VG     Fmt  Attr PSize   PFree
  /dev/sda2  centos lvm2 a--  <19.00g    0
  /dev/sdb1         lvm2 ---    1.00g 1.00g
  /dev/sdc1         lvm2 ---    1.00g 1.00g
  /dev/sdd1         lvm2 ---    1.00g 1.00g
```
Tiếp theo chúng ta tạo volume group với tên vg1 sử dụng 3 physical volume đã uược tạo bên trên:
```
[root@localhost ~]# vgcreate vg1 /dev/sdb1 /dev/sdc1 /dev/sdd1
  Volume group "vg1" successfully created
```
Chúng ta tạo ra một logical volume có tên strp1 với kích thước 900MB, và được tạo trong volume group vg1, xác định sử dụng 3 stripe,có nghĩa là dữ liệu ghi vào logical volume của chúng ta, cần phải được logical volume trên 3PV.
```
[root@localhost ~]# lvcreate -L 900M -n strp1 -i3 vg1
  Using default stripesize 64.00 KiB.
  Logical volume "strp1" created.
```
Trong đó:

  * -L: Kích thước logical volume
  * -n: Tên logical volume
  * -i: stripes

Sau khi tạo logical volume chúng ta kiểm tra xem nó có được strips ghi vào 3PV không. Chúng ta có thể sử dụng lệnh lvdisplay cùng với tuỳ chọn -m:
```
[root@localhost ~]# lvdisplay vg1/strp1 -m
  --- Logical volume ---
  LV Path                /dev/vg1/strp1
  LV Name                strp1
  VG Name                vg1
  LV UUID                bcTECU-rE8a-PeXh-gjoD-YMUl-KkpA-guz0jD
  LV Write Access        read/write
  LV Creation host, time localhost.localdomain, 2021-11-14 17:07:47 +0700
  LV Status              available
  # open                 0
  LV Size                900.00 MiB
  Current LE             225
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     768
  Block device           253:2

  --- Segments ---
  Logical extents 0 to 224:
    Type                striped
    Stripes             3
    Stripe size         64.00 KiB
    Stripe 0:
      Physical volume   /dev/sdb1
      Physical extents  0 to 74
    Stripe 1:
      Physical volume   /dev/sdc1
      Physical extents  0 to 74
    Stripe 2:
      Physical volume   /dev/sdd1
      Physical extents  0 to 74
```

### 7, Tính năng LVM Migration
Tính năng này cho phép di chuyển dữ liệu từ logical volume sang một ổ mới mà không làm mất dữ liệu hoặc downtime. Có thể áp dụng với disk SATA,SSD,SAN storage iSCSI or FC
Bước 1: Kiểm tra ổ đĩa hiện tại

Chúng ta đã có một ổ đĩa ảo có tên là /dev/sdb đã được ánh xạ tới logical volume project. Bây giờ chúng ta muốn di chuyển dung lượng của /dev/sdb này sang một số bộ lưu trữ mới khác.

Sử dụng các lệnh fdisk và lvs để hiển thị ổ đĩa hiện tại.
```
[root@localhost ~]# fdisk -l | grep sd
Disk /dev/sda: 21.5 GB, 21474836480 bytes, 41943040 sectors
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200    41943039    19921920   8e  Linux LVM
Disk /dev/sdb: 10.7 GB, 10737418240 bytes, 20971520 sectors
[root@localhost ~]# lvs
  LV       VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root     cl  -wi-ao---- 17.00g
  swap     cl  -wi-ao----  2.00g
  projects vg0 -wi-ao----  9.90g
```
Bước 2: Kiểm tra ổ đĩa mới được thêm vào

Chúng ta chạy lệnh fdisk -l để kiểm tra xem ổ mới đã được thêm vào hay chưa:
```
[root@localhost ~]# fdisk -l | grep sd
Disk /dev/sda: 21.5 GB, 21474836480 bytes, 41943040 sectors
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200    41943039    19921920   8e  Linux LVM
Disk /dev/sdb: 10.7 GB, 10737418240 bytes, 20971520 sectors
Disk /dev/sdc: 10.7 GB, 10737418240 bytes, 20971520 sectors
Disk /dev/sdd: 21.5 GB, 21474836480 bytes, 41943040 sectors
```
Ổ đĩa mới đã được thêm vào với tên /dev/sdc và /dev/sdd

Bước 3: Kiểm tra Logical và Physical Volume hiện tại

Sử dụng các lệnh sau để liệt kê các mount và kiểm tra dữ liệu:
```
[root@localhost ~]# df -h
Filesystem                Size  Used Avail Use% Mounted on
/dev/mapper/cl-root        17G  2.5G   15G  15% /
devtmpfs                  478M     0  478M   0% /dev
tmpfs                     489M     0  489M   0% /dev/shm
tmpfs                     489M  6.8M  482M   2% /run
tmpfs                     489M     0  489M   0% /sys/fs/cgroup
/dev/sda1                1014M  139M  876M  14% /boot
tmpfs                      98M     0   98M   0% /run/user/0
/dev/mapper/vg0-projects  9.7G  250M  8.9G   3% /projects
[root@localhost ~]# cd /projects/
[root@localhost projects]# ls -lh
total 214M
drwx------. 2 root root  16K Apr 22 05:00 lost+found
-rw-r--r--. 1 root root   25 Apr 22 05:01 test.txt
-rwxr-xr-x. 1 root root 213M Apr 22 05:01 vyatta-livecd_VC6.5R1_i386.iso
[root@localhost projects]# cat test.txt
Hello
```
  > Lưu ý: Chúng ta đã có ba tệp trong điểm gắn kết /projects và chúng ta di chuyển các dữ liệu này sang ổ đĩa mới không làm mất dữ liệu hoặc downtime.

Trước khi di chuyển, chúng ta chạy lệnh sau để kiểm tra tên của logical volume và volume group:
```
[root@localhost ~]# lvs
  LV       VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root     cl  -wi-ao---- 17.00g
  swap     cl  -wi-ao----  2.00g
  projects vg0 -wi-ao----  9.90g
[root@localhost ~]# vgs -o+devices | grep  vg0
  vg0   1   1   0 wz--n- 10.00g 96.00m /dev/sdb(0)
```
Qua lệnh kêểm tra trên chúng ta thấy /dev/sdb đang giữ volume group vg0.

Bước 4: Tạo Physical Volume mới

Để tạo Physical Volume mới cuúng ta thực hiện như sau:
```
[root@localhost ~]# pvcreate /dev/sdc -v
    Wiping internal VG cache
    Wiping cache of LVM-capable devices
    Wiping signatures on new PV /dev/sdc.
    Set up physical volume for "/dev/sdc" with 20971520 available sectors.
    Zeroing start of device /dev/sdc.
    Writing physical volume data to disk "/dev/sdc".
  Physical volume "/dev/sdc" successfully created.
[root@localhost ~]# pvs
  PV         VG  Fmt  Attr PSize  PFree
  /dev/sda2  cl  lvm2 a--  19.00g     0
  /dev/sdb   vg0 lvm2 a--  10.00g 96.00m
  /dev/sdc       lvm2 ---  10.00g 10.00g
```
Sử dụng lệnh sau để thêm /dev/sdc vào volume group vg0:
```
[root@localhost ~]# vgextend vg0 /dev/sdc
  Volume group "vg0" successfully extended
[root@localhost ~]# vgs
  VG  #PV #LV #SN Attr   VSize  VFree
  cl    1   2   0 wz--n- 19.00g     0
  vg0   2   1   0 wz--n- 19.99g 10.09g
```
Để biết thêm thông tin về thiết bị nào được ánh xạ, sử dụng lệnh dmsetup.
```
[root@localhost ~]# lvs -o+devices
  LV       VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Devices
  root     cl  -wi-ao---- 17.00g                                                     /dev/sda2(512)
  swap     cl  -wi-ao----  2.00g                                                     /dev/sda2(0)
  projects vg0 -wi-ao----  9.90g                                                     /dev/sdb(0)
[root@localhost ~]# dmsetup deps /dev/vg0/projects
1 dependencies	: (8, 16)
[root@localhost ~]# ls -l /dev | grep sd
brw-rw----. 1 root disk      8,   0 Apr 22 04:58 sda
brw-rw----. 1 root disk      8,   1 Apr 22 04:58 sda1
brw-rw----. 1 root disk      8,   2 Apr 22 04:58 sda2
brw-rw----. 1 root disk      8,  16 Apr 22 05:04 sdb
brw-rw----. 1 root disk      8,  32 Apr 22 05:04 sdc
brw-rw----. 1 root disk      8,  48 Apr 22 04:58 sdd
```
Bước 5: LVM Mirroring Method

Chúng ta dùng lệnh lvconvert để migration dữ liệu sang ổ mới. Khi quá trình migration hoàn tất. Dùng lvs -o+devices để kiểm tra thông tin.
```
[root@localhost ~]# lvconvert -m 1 /dev/vg0/projects /dev/sdc
  Logical volume vg0/projects successfully converted.
[root@localhost ~]# lvs -o+devices
  LV       VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Devices
  root     cl  -wi-ao---- 17.00g                                                     /dev/sda2(512)
  swap     cl  -wi-ao----  2.00g                                                     /dev/sda2(0)
  projects vg0 rwi-aor---  9.90g                                    53.93            projects_rimage_0(0),projects_rimage_1(0)
```
Trong đó tùy chọn có ý nghĩa sau:

  * -m: mirror (Tạo ổ migration) 1: 1 mirror

Khi đã tạo 1 mirror mới thì bạn có thể bỏ /dev/sdb và kiểm tra lại với lvs -o+devices chúng ta sẽ thấy vg0 chỉ còn nối với /dev/sdc. Thực hiện như bên dưới:
```
[root@localhost ~]# lvconvert -m 0 /dev/vg0/projects /dev/sdb
  Logical volume vg0/projects successfully converted.
[root@localhost ~]# lvs -o+devices
  LV       VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Devices
  root     cl  -wi-ao---- 17.00g                                                     /dev/sda2(512)
  swap     cl  -wi-ao----  2.00g                                                     /dev/sda2(0)
  projects vg0 -wi-a-----  9.90g                                                     /dev/sdc(1)
[root@localhost ~]# dmsetup deps /dev/vg0/projects
1 dependencies	: (8, 32)
[root@localhost ~]# ls -l /dev | grep sd
brw-rw----. 1 root disk      8,   0 Apr 22 04:58 sda
brw-rw----. 1 root disk      8,   1 Apr 22 04:58 sda1
brw-rw----. 1 root disk      8,   2 Apr 22 04:58 sda2
brw-rw----. 1 root disk      8,  16 Apr 22 05:11 sdb
brw-rw----. 1 root disk      8,  32 Apr 22 05:11 sdc
brw-rw----. 1 root disk      8,  48 Apr 22 05:07 sdd
```
Check lại nội dung đã tạo bên trong /projects để đảm bảo dữ liệu không bị mất.
```
[root@localhost ~]# cd /projects/
[root@localhost projects]# ls -lh
total 214M
drwx------. 2 root root  16K Apr 22 05:00 lost+found
-rw-r--r--. 1 root root   25 Apr 22 05:01 test.txt
-rwxr-xr-x. 1 root root 213M Apr 22 05:01 vyatta-livecd_VC6.5R1_i386.iso
[root@localhost projects]# cat test.txt
Hello
```
Sau khi mọi thứ được tạo hoàn toàn chính sác bây giờ chúng ta xóa dev/sdb khỏi volume group và kiểm tra thiết bị nào phụ thuộc vào volume group của chúng ta.
```
[root@localhost ~]# vgreduce /dev/vg0/ /dev/sdb
[root@localhost ~]# vgs -o+devices
  VG  #PV #LV #SN Attr   VSize  VFree  Devices
  cl    1   2   0 wz--n- 19.00g     0  /dev/sda2(0)
  cl    1   2   0 wz--n- 19.00g     0  /dev/sda2(512)
  vg0   2   1   0 wz--n- 19.99g 10.09g /dev/sdc(1)
[root@localhost ~]# lvs
  LV       VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  root     cl  -wi-ao---- 17.00g
  swap     cl  -wi-ao----  2.00g
  projects vg0 -wi-ao----  9.90g
```