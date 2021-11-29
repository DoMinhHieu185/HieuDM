# Cấu hình phần cứng và phần cứng cốt lõi
### Understanding the Role of Firmware(Hiểu vai trò của chương trình cơ sở)
Tất cả các máy trạm và máy chủ tương thích với IBM đều sử dụng một số loại firmware cài sẵn để kiểm soát cách khởi động hệ điều hành đã cài đặt. Trên các máy trạm và máy chủ cũ hơn, firmware này được gọi là Hệ thống Đầu vào / Đầu ra Cơ bản (BIOS-Basic Input/Output System). Trên các máy trạm và máy chủ mới hơn, một phương pháp mới, được gọi là Giao diện chương trình cơ sở mở rộng hợp nhất (UEFI-Unified Extensible Firmware Interface), có khả năng duy trì trạng thái phần cứng hệ thống và khởi chạy hệ điều hành đã cài đặt.
Cả hai phương pháp cuối cùng đều khởi chạy chương trình hệ điều hành chính, nhưng mỗi phương pháp sử dụng các cách khác nhau để thực hiện điều đó. Phần này sẽ giới thiệu cơ bản về cả phương pháp BIOS và UEFI, cho thấy cách chúng tham gia vào quá trình khởi động Linux.

#### The BIOS Startup(Khởi động BIOS)
#### The UEFI Startup(Khởi động UEFI)
### Device Interfaces(Giao diện thiết bị)
Mỗi thiết bị bạn kết nối với hệ thống Linux của mình sử dụng một số loại giao thức tiêu chuẩn để giao tiếp với phần cứng hệ thống. Phần mềm nhân Linux phải biết cách gửi dữ liệu đến và nhận dữ liệu từ thiết bị phần cứng bằng các giao thức đó. Hiện có ba tiêu chuẩn phổ biến được sử dụng để kết nối các thiết bị.

#### PCI Boards(Bảng PCI)
Tiêu chuẩn kết nối thành phần ngoại vi (PCI) được phát triển vào năm 1993 như một phương pháp để kết nối bo mạch phần cứng với bo mạch chủ PC.

#### The USB Interface(Giao diện USB)
Giao diện Universal Serial Bus (USB) ngày càng trở nên phổ biến do tính dễ sử dụng và khả năng hỗ trợ truyền dữ liệu tốc độ cao ngày càng tăng.

Tiêu chuẩn USB đã phát triển qua nhiều năm. Phiên bản gốc 1.0, chỉ hỗ trợ tốc độ truyền dữ liệu lên đến 12 Mbps. Chuẩn 2.0 tăng tốc độ truyền dữ liệu lên 480 Mbps. Chuẩn USB hiện tại, 3.2, cho phép tốc độ truyền dữ liệu lên đến 20 Gbps, rất hữu ích cho các kết nối tốc độ cao với các thiết bị lưu trữ bên ngoài.

Có nhiều thiết bị khác nhau có thể kết nối với hệ thống bằng giao diện USB. Bạn có thể tìm thấy ổ cứng, máy in, máy ảnh kỹ thuật số và máy quay phim, bàn phím, chuột và card mạng có các phiên bản kết nối bằng giao diện USB.

#### The GPIO Interface(Giao diện GPIO)
### The /dev Directory (Thư mục /dev)
Sau khi Linux kernel giao tiếp với một thiết bị trên một giao diện, nó phải có khả năng truyền dữ liệu đến và đi từ thiết bị đó. Điều này được thực hiện bằng cách sử dụng các tệp thiết bị. Tệp thiết bị là tệp mà nhân Linux tạo trong thư mục đặc biệt / dev để giao tiếp với các thiết bị phần cứng.

Khi bạn thêm các thiết bị phần cứng như ổ USB, thẻ mạng hoặc ổ cứng vào hệ thống của mình, Linux sẽ tạo một tệp trong thư mục / dev đại diện cho thiết bị phần cứng đó.

Có hai loại tệp thiết bị trong Linux, dựa trên cách Linux truyền dữ liệu đến thiết bị:
* Tệp thiết bị ký tự(Character device files): Truyền dữ liệu từng ký tự một. Phương pháp này thường được sử dụng cho các thiết bị nối tiếp như thiết bị đầu cuối và thiết bị USB.
* Chặn tệp thiết bị(Block device files): Truyền dữ liệu trong các khối dữ liệu lớn. Phương pháp này thường được sử dụng cho các thiết bị truyền dữ liệu tốc độ cao như ổ cứng và card mạng.

Loại tệp thiết bị được biểu thị bằng chữ cái đầu tiên trong danh sách quyền, như được hiển thị dưới đây
```
[root@localhost dev]# ls -al sd* tty*
brw-rw----. 1 root disk    8,  0 Nov  2 14:08 sda
brw-rw----. 1 root disk    8,  1 Nov  2 14:08 sda1
brw-rw----. 1 root disk    8,  2 Nov  2 14:08 sda2
crw-rw-rw-. 1 root tty     5,  0 Nov  2 14:08 tty
crw--w----. 1 root tty     4,  0 Nov  2 14:08 tty0
crw--w----. 1 root tty     4,  1 Nov  2 14:13 tty1
crw--w----. 1 root tty     4, 10 Nov  2 14:08 tty10
```
Các thiết bị ổ cứng, sda và sda1, hiển thị chữ b, cho biết rằng chúng là các tệp thiết bị chặn. Các tệp đầu cuối tty hiển thị chữ c, cho biết rằng chúng là các tệp thiết bị ký tự.

### The /proc Directory
Thư mục / proc là một trong những công cụ quan trọng nhất mà bạn có thể sử dụng khi khắc phục sự cố phần cứng trên hệ thống Linux. Nó không phải là một thư mục vật lý trên hệ thống tệp, mà thay vào đó là một thư mục ảo mà kernel tự động điền vào để cung cấp quyền truy cập vào thông tin về cài đặt và trạng thái phần cứng hệ thống.

#### Interrupt Requests(Yêu cầu gián đoạn)
Interrupt requests (IRQs) cho phép các thiết bị phần cứng chỉ ra khi nào chúng có dữ liệu để gửi đến CPU.

Hệ thống PnP phải gán cho mỗi thiết bị phần cứng được cài đặt trên hệ thống một địa chỉ IRQ duy nhất. Bạn có thể xem các IRQ hiện tại đang được sử dụng trên hệ thống Linux của mình bằng cách xem tệp / proc / interrupts bằng lệnh Linux `cat`
```
[root@localhost dev]# cat /proc/interrupts
            CPU0
   0:         83   IO-APIC-edge      timer
   1:        202   IO-APIC-edge      i8042
   8:          1   IO-APIC-edge      rtc0
   9:          0   IO-APIC-fasteoi   acpi
  12:       1600   IO-APIC-edge      i8042
  14:          0   IO-APIC-edge      ata_piix
  15:       4165   IO-APIC-edge      ata_piix
  16:       4122   IO-APIC-fasteoi   vmwgfx, snd_ens1371
  17:       6915   IO-APIC-fasteoi   ehci_hcd:usb1, ioc0
  18:         73   IO-APIC-fasteoi   uhci_hcd:usb2
  19:       6585   IO-APIC-fasteoi   ens33
  24:          0   PCI-MSI-edge      PCIe PME, pciehp
  25:          0   PCI-MSI-edge      PCIe PME, pciehp
```

#### I/O Ports
Các cổng I / O của hệ thống là các vị trí trong bộ nhớ nơi CPU có thể gửi dữ liệu đến và nhận dữ liệu từ thiết bị phần cứng. Như với IRQ, hệ thống phải gán cho mỗi thiết bị một cổng I / O duy nhất.

Bạn có thể giám sát các cổng I / O được gán cho các thiết bị phần cứng trên hệ thống của mình bằng cách xem tệp `/proc/ioports`
```
[root@localhost dev]# cat /proc/ioports
0000-0cf7 : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : PNP0001:00
    0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0061-0061 : PNP0800:00
  0064-0064 : keyboard
  0070-0071 : rtc0
  0080-008f : dma page reg
  00a0-00a1 : PNP0001:00
    00a0-00a1 : pic2
  00c0-00df : dma2
```

#### Direct Memory Access(Truy cập bộ nhớ trực tiếp)
Việc sử dụng các cổng I/O để gửi dữ liệu đến CPU có thể hơi chậm, để tăng tốc độ, nhiều thiết bị sử dụng kênh truy cập bộ nhớ trực tiếp DMA. DMA gửi dữ liệu từ thiết bị phần cứng đến bộ nhớ hệ thống mà không cần chờ CPU, sau đó CPU có thể đọc các vị trí bộ nhớ đó để truy cập dữ liệu khi sẵn sàng
```
[root@localhost dev]# cat /proc/dma
 4: cascade
```

### The /sys Directory
Một công cụ khác có sẵn để làm việc với các thiết bị là thư mục /sys. Thư mục /sys là 1 thư mục ảo tương tự /proc. Nó được tạo bởi kernel và nó cung cấp thông tin bổ sung về các thiết bị phần cứng mà người dùng nào trên hệ thống cũng có thể truy cập.

### Working with Devices(Làm việc với thiết bị)
#### Finding Devices(Tìm thiết bị)
Lệnh dòng lệnh lsdev hiển thị thông tin về các thiết bị phần cứng được cài đặt trên hệ thống Linux. Nó truy xuất thông tin từ các tệp ảo /proc/interrupts, /proc/ioports và /proc/dma và kết hợp chúng với nhau trong một đầu ra
```
hieu@hieukma:~$ lsdev
Device            DMA   IRQ  I/O Ports
------------------------------------------------
0000:00:07.1                   0000-0000   0000-0000   0000-0000   0000-0000   0000-0000
0000:00:07.3                   0000-0000   0000-0000
0000:00:07.7                   0000-0000
0000:00:0f.0                   0000-0000
0000:00:10.0                   0000-0000
0000:02:00.0                     0000-0000
0000:02:01.0                     0000-0000
0000:02:02.0                     0000-0000
acpi                      9
ACPI                               0000-0000       0000-0000       0000-0000       0000-0000       0000-0000
ahci[0000:02:05.0]         56
ata_piix              14 15      0000-0000     0000-0000     0000-0000     0000-0000     0000-0000
cascade             4
dma                            0000-0000
dma1                           0000-0000
dma2                           0000-0000
e1000                              0000-0000
ens33                    19
Ensoniq                            0000-0000
floppy              2     6    0000-0000   0000-0000   0000-0000
fpu                            0000-0000
i8042                  1 12
```
Sử dụng lệnh `lsblk` để liệt kê các thiết bị đang chạy trên hệ thống. Nó cũng chỉ ra sự liên kết giữa các khối như với các ổ LVM được ánh xạ thiết bị và ổ cứng vật lý được liên kết
```
hieu@hieukma:~$ lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
fd0                         2:0    1  1.4M  0 disk
sda                         8:0    0   20G  0 disk
├─sda1                      8:1    0    1M  0 part
├─sda2                      8:2    0    1G  0 part /boot
└─sda3                      8:3    0   19G  0 part
  └─ubuntu--vg-ubuntu--lv 253:0    0   19G  0 lvm  /
sr0                        11:0    1 65.7M  0 rom
sr1                        11:1    1  945M  0 rom
```

Tùy chọn -S chỉ hiển thị thông tin về các thiết bị khối SCSI trên hệ thống:
```
hieu@hieukma:~$ lsblk -S
NAME HCTL       TYPE VENDOR   MODEL             REV TRAN
sda  32:0:0:0   disk VMware,  VMware Virtual S 1.0  spi
sr0  2:0:0:0    rom  NECVMWar VMware SATA CD00 1.00 sata
sr1  3:0:0:0    rom  NECVMWar VMware SATA CD01 1.00 sata
```

#### Working with PCI Cards(Làm việc với PCI Cards)
Lệnh lspci cho phép bạn xem các thẻ PCI và PCIe hiện đã được cài đặt và công nhận trên hệ thống Linux.
```
hieu@hieukma:~$ lspci
00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host bridge (rev 01)
00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP bridge (rev 01)
00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 08)
00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
00:07.7 System peripheral: VMware Virtual Machine Communication Interface (rev 10)
00:0f.0 VGA compatible controller: VMware SVGA II Adapter
00:10.0 SCSI storage controller: LSI Logic / Symbios Logic 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 01)
00:11.0 PCI bridge: VMware PCI bridge (rev 02)
00:15.0 PCI bridge: VMware PCI Express Root Port (rev 01)
```

#### Working with USB Devices(Làm việc với thiết bị USB)
Bạn có thể xem thông tin cơ bản về các thiết bị USB được kết nối với hệ thống Linux của mình bằng cách sử dụng lệnh `lsusb`
```
hieu@hieukma:~$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 003: ID 0e0f:0002 VMware, Inc. Virtual USB Hub
Bus 002 Device 002: ID 0e0f:0003 VMware, Inc. Virtual Mouse
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
```

### Hardware Modules(Mô-đun phần cứng)
#### Listing Installed Modules(Danh sách các mô-đun đã cài đặt)
`lsmod` là 1 tiện ích dòng lệnh hiển thị thông tin về các module kernel đã được tải. 

```
root@ubuntu18:~# lsmod
Module                  Size  Used by
kvm_intel             212992  0
kvm                   598016  1 kvm_intel
irqbypass              16384  1 kvm
crct10dif_pclmul       16384  0
crc32_pclmul           16384  0
ghash_clmulni_intel    16384  0
pcbc                   16384  0
aesni_intel           188416  0
aes_x86_64             20480  1 aesni_intel
crypto_simd            16384  1 aesni_intel
glue_helper            16384  1 aesni_intel
cryptd                 24576  3 crypto_simd,ghash_clmulni_intel,aesni_intel
joydev                 24576  0
input_leds             16384  0
serio_raw              16384  0
mac_hid                16384  0
qemu_fw_cfg            16384  0
sch_fq_codel           20480  2
ip_tables              28672  0
x_tables               40960  1 ip_tables
autofs4                40960  2
hid_generic            16384  0
usbhid                 49152  0
psmouse               147456  0
hid                   118784  2 usbhid,hid_generic
virtio_blk             20480  2
virtio_net             45056  0
floppy                 77824  0
i2c_piix4              24576  0
pata_acpi              16384  0
```

#### Getting Module Information

Xem thêm thông tin về module sử dụng `modinfo`: 

```
root@ubuntu18:~# modinfo kvm
filename:       /lib/modules/4.15.0-45-generic/kernel/arch/x86/kvm/kvm.ko
license:        GPL
author:         Qumranet
srcversion:     8EBD075A1652D2BABA0BBEC
depends:        irqbypass
retpoline:      Y
intree:         Y
name:           kvm
vermagic:       4.15.0-45-generic SMP mod_unload
signat:         PKCS#7
signer:
sig_key:
sig_hashalgo:   md4
parm:           ignore_msrs:bool
parm:           report_ignored_msrs:bool
parm:           min_timer_period_us:uint
parm:           kvmclock_periodic_sync:bool
parm:           tsc_tolerance_ppm:uint
parm:           lapic_timer_advance_ns:uint
parm:           vector_hashing:bool
parm:           halt_poll_ns:uint
parm:           halt_poll_ns_grow:uint
parm:           halt_poll_ns_shrink:uint
```

#### Installing New Modules

Để cài đặt 1 module mới, bạn có thể sử dụng 2 lệnh là: `insmod` và `modprobe`. 

#### Removing Modules

Để xóa 1 module, ta có thể sử dụng lệnh `modprobe` với tùy chọn `-r`. 
