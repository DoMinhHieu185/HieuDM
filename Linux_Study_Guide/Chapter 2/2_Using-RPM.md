# Using RPM
Được phát triển tại Red Hat, tiện ích Trình quản lý gói RPM (RPM) cho phép bạn cài đặt, sửa đổi và xóa các gói phần mềm. Nó cũng giúp giảm bớt quá trình cập nhật phần mềm.
### RPM Distributions and Conventions(Phân phối và quy ước RPM)
Bản phân phối Red Hat Linux, cùng với các bản phân phối dựa trên Red Hat khác như Fedora và CentOS, sử dụng RPM. Ngoài ra, có những bản phân phối khác không dựa trên Red Hat, chẳng hạn như openSUSE và OpenMandriva Lx, cũng sử dụng RPM.

Các tệp gói RPM có phần mở rộng tệp .rpm và tuân theo định dạng đặt tên sau:
```
PACKAGE-NAME-VERSION-RELEASE.ARCHITECTURE.rpm
```
![](/Linux Study Guide/img/rpm1.jpg)

* PACKAGE-NAME: là tên của gói phần mềm. Ví dụ: nếu bạn muốn cài đặt trình soạn thảo văn bản emacs, rất có thể tệp RPM của nó sẽ có tên gói phần mềm là emacs. Tuy nhiên, hãy lưu ý rằng các bản phân phối khác nhau có thể có PACKAGE-NAME khác nhau cho cùng một chương trình và tên gói phần mềm có thể khác với tên chương trình.
* VERSION: là số phiên bản của chương trình và đại diện cho các sửa đổi phần mềm mới hơn số phiên bản cũ hơn. Theo truyền thống, số phiên bản của gói được định dạng là hai đến ba số và / hoặc các chữ cái được phân tách bằng dấu chấm (.). Ví dụ bao gồm 1.13.1 và 7.4p1.
* RELEASE: còn được gọi là số bản dựng. Nó đại diện cho một sửa đổi chương trình nhỏ hơn so với số phiên bản.
* ARCHITECTURE: Đây là chỉ định của kiến trúc CPU mà gói phần mềm đã được tối ưu hóa. Thông thường, bạn sẽ thấy x86_64 được liệt kê cho bộ xử lý 64 bit. Đôi khi noarch được sử dụng, điều này cho biết gói là trung lập về mặt kiến trúc. Các chỉ định cấu trúc CPU cũ hơn bao gồm i386 (x86), ppc (PowerPC), i586 và i686 (Pentium).

  > Lưu ý các biến thể đặt tên định dạng giữa Version và Release. Mặc dù có thể khó xác định vị trí Version kết thúc và Release bắt đầu, mẹo là tìm dấu gạch ngang thứ hai (-) trong tên tệp, phân tách chúng.

### The rpm Command Set(Bộ lệnh rpm)
Công cụ chính để làm việc với các tệp RPM là chương trình rpm. Tiện ích rpm là một chương trình dòng lệnh cài đặt, sửa đổi và gỡ bỏ các gói phần mềm RPM. Định dạng cơ bản của nó như sau:
```
rpm ACTION [OPTION] PACKAGE-FILE
```
BẢNG 2 .1 Các hành động của lệnh rpm
|Short|Long|Mô tả|
|-|-|-|
|-e|--erase|Loại bỏ gói được chỉ định|
|-F|--freshen|Chỉ nâng cấp gói nếu phiên bản cũ hơn đã tồn tại|
|-i|--install|Cài đặt gói được chỉ định|
|-q|--query|Truy vấn xem gói được chỉ định có được cài đặt hay không|
|-U|--upgrade|Cài đặt hoặc nâng cấp gói được chỉ định|
|-V|--verify|Xác minh xem các tệp gói có hiện diện hay không và tính toàn vẹn của gói|

#### Installing and Updating RPM Packages(Cài đặt và cập nhật các gói RPM)
Để sử dụng lệnh rpm, bạn phải tải tệp gói .rpm xuống hệ thống của mình. Mặc dù bạn có thể sử dụng hành động -i để cài đặt các gói, nhưng hành động -U sẽ phổ biến hơn để cài đặt gói mới hoặc nâng cấp gói nếu nó đã được cài đặt

Thêm tùy chọn -vh là một kết hợp phổ biến cho biết tiến trình của một bản cập nhật và những gì nó đang làm.

#### Querying RPM Packages(Truy vấn các gói RPM)
Sử dụng tùy chọn `-q` để tìm hoặc kiểm tra các gói có được cài đặt trên máy hay chưa.
```
[root@localhost ~]# rpm -q httpd
httpd-2.4.6-97.el7.centos.x86_64
```
```
[root@localhost ~]#  rpm -q docker
package docker is not installed
```
* Bảng 2: Các tùy chọn hành động truy vấn lệnh rpm
|Short option|Long option|Mô tả|
|-|-|-|
|-c|--configfiles|Liệt kê tên và tham chiếu thư mục tuyệt đối của các tệp cấu hình gói|
|-i|--info|Cung cấp thông tin chi tiết, bao gồm phiên bản, ngày cài đặt và chữ ký|
|N/A|--provides|Cho biết gói cung cấp những tiện ích nào|
|-R|--requires|Hiển thị các yêu cầu gói khác nhau (phụ thuộc)|
|-s|--state|Cung cấp trạng thái của các tệp khác nhau trong một gói, chẳng hạn như bình thường (đã cài đặt), chưa được cài đặt hoặc đã thay thế|
|N/A|--what-provides|Hiển thị cho gói nào một tệp thuộc về|

thêm tùy chọn -i để xem chi tiết các gói,
```
[root@localhost ~]# rpm -qi httpd
Name        : httpd
Version     : 2.4.6
Release     : 97.el7.centos
Architecture: x86_64
Install Date: Thu 14 Oct 2021 04:51:07 PM +07
Group       : System Environment/Daemons
Size        : 9821064
License     : ASL 2.0
Signature   : RSA/SHA256, Wed 18 Nov 2020 09:17:43 PM +07, Key ID 24c6a8a7f4a80eb5
Source RPM  : httpd-2.4.6-97.el7.centos.src.rpm
Build Date  : Mon 16 Nov 2020 11:21:17 PM +07
Build Host  : x86-02.bsys.centos.org
Relocations : (not relocatable)
Packager    : CentOS BuildSystem <http://bugs.centos.org>
Vendor      : CentOS
URL         : http://httpd.apache.org/
Summary     : Apache HTTP Server
Description :
The Apache HTTP Server is a powerful, efficient, and extensible
web server.
```
Xác định các tệp cấu hình của các gói đã cài đặt.
```
[root@localhost ~]# rpm -qc httpd
/etc/httpd/conf.d/autoindex.conf
/etc/httpd/conf.d/userdir.conf
/etc/httpd/conf.d/welcome.conf
/etc/httpd/conf.modules.d/00-base.conf
/etc/httpd/conf.modules.d/00-dav.conf
/etc/httpd/conf.modules.d/00-lua.conf
/etc/httpd/conf.modules.d/00-mpm.conf
/etc/httpd/conf.modules.d/00-proxy.conf
/etc/httpd/conf.modules.d/00-systemd.conf
/etc/httpd/conf.modules.d/01-cgi.conf
/etc/httpd/conf/httpd.conf
/etc/httpd/conf/magic
/etc/logrotate.d/httpd
/etc/sysconfig/htcacheclean
/etc/sysconfig/httpd
```

#### Verifying RPM Packages(Xác minh các gói RPM)
#### Removing RPM Packages(Xóa các gói RPM)
Để xóa gói đã cài đặt, chỉ cần sử dụng hành động -e cho lệnh rpm.
```
[root@localhost ~]# rpm -e httpd
[root@localhost ~]# rpm -q httpd
package httpd is not installed
```
Hành động -e không hiển thị nếu nó thành công, nhưng nó sẽ hiển thị thông báo lỗi nếu có vấn đề gì xảy ra với việc xóa

### Extracting Data from RPMs(Trích xuất dữ liệu từ RPM)
Đôi khi, bạn có thể cần giải nén tệp từ tệp gói RPM mà không cần cài đặt nó. Tiện ích `rpm2cpio` rất hữu ích trong những trường hợp này. Nó cho phép bạn tạo một kho lưu trữ `cpio` từ một tệp RPM
  > Lưu ý rằng bạn cần sử dụng biểu tượng> chuyển hướng (chuyển hướng STDOUT) để tạo tệp lưu trữ

Đây là bước đầu tiên để giải nén các tập tin.
```
[root@localhost ~]# rpm2cpio httpd-2.4.6-97.el7.centos.x86_64.rpm >emacs.cpio
```
Bước tiếp theo là di chuyển các tệp từ kho lưu trữ cpio vào các thư mục. Điều này được thực hiện thông qua lệnh cpio bằng cách sử dụng các tùy chọn -id. `-i` sử dụng chế độ sao chép vào, cho phép sao chép tệp từ tệp lưu trữ. `-d` tạo các thư mục con trong thư mục đang làm việc hiện tại có tên khớp với tên thư mục trong kho lưu trữ, ngoại trừ việc thêm dấu chấm (.) Trước mỗi tên.
```
[root@localhost ~]# cpio -idv < emacs.cpio
./etc/httpd
./etc/httpd/conf
./etc/httpd/conf.d
./etc/httpd/conf.d/README
./etc/httpd/conf.d/autoindex.conf
./etc/httpd/conf.d/userdir.conf
./etc/httpd/conf.d/welcome.conf
./etc/httpd/conf.modules.d
./etc/httpd/conf.modules.d/00-base.conf
./etc/httpd/conf.modules.d/00-dav.conf
...
...
```

### Using YUM
YUM (viết tắt của YellowDog Update Manager, ban đầu được phát triển cho bản phân phối YellowDog Linux). Lệnh yum cho phép bạn truy vấn, cài đặt và gỡ bỏ các gói phần mềm trên hệ thống của bạn trực tiếp từ kho lưu trữ Red Hat chính thức.

Mỗi tệp trong thư mục yum.repos.d chứa thông tin về kho lưu trữ, chẳng hạn như địa chỉ URL của nó và vị trí của các tệp gói bổ sung trong kho lưu trữ. Chương trình yum kiểm tra từng kho lưu trữ đã xác định này cho gói được yêu cầu trên dòng lệnh.

Cú pháp lệnh yum cơ bản là
```
yum [tùy chọn] [lệnh] [tên gói]
```
###### 1.Kiểm tra các cập nhật

Kiểm tra các gói nào đã cài đặt đang có sẵn phiên bản cập nhật

``` 
[root@host ~]# yum check-update
```

Cập nhật tất cả các gói đã cài đặt

```
[root@host ~]# yum update
```
Cập nhật 1 gói cụ thể hoặc 1 phiên bản cụ thể của gói

``` 
[root@host ~]# yum update [tên gói]
```
###### 2.Cài đặt gói

Cài đặt 1 gói hoặc phiên bản cụ thể của gói

```
[root@host ~]# yum install [gói]
```

Cài đặt gói mà không cần xác nhận

```
[root@host ~]# yum -y install [gói]
```
###### 3. Liệt kê gói

Để tìm kiếm 1 gói cụ thể ta dùng `list`

```
[root@host ~]# yum list [gói]
```
###### 4. Xem thông tin gói

Để biết thông tin 1 gói trước khi ta cài đặt nó, ta sử dụng `info`

```
[root@host ~]# yum info [gói]
```
###### 5. Xóa gói bằng yum

Lệnh này sẽ xóa gói được chỉ định cùng với tất cả các phụ thuộc của nó

```
[root@host ~]# yum remove [tên gói]
```
###### 6. Tải 1 gói mà không cài đặt

Trước tiên ta phải cài đặt gói  `plugin"downloadonly"`

```
[root@host ~]# yum install yum-plugin-dowloadonly
```

sau đó ta chạy lệnh yum với tùy chọn `--downloadonly`

```
[root@host ~]# yum install --downloadonly --downloaddir=<tên ổ đĩa lưu> <gói cài đặt>
```

sau khi tải, ta vào lại ổ đĩa lưu và kiểm tra xác nhận gói đã tồn tại.

### Using ZYpp
Bản phân phối openSUSE Linux sử dụng hệ thống quản lý gói RPM và phân phối phần mềm dưới dạng tệp .rpm nhưng không sử dụng công cụ yum hoặc dnf. Thay vào đó, openSUSE đã tạo ra công cụ quản lý gói của riêng mình được gọi là ZYpp (còn được gọi là libzypp). Lệnh zypper của nó cho phép bạn truy vấn, cài đặt và gỡ bỏ các gói phần mềm trên hệ thống của mình trực tiếp từ kho lưu trữ openSUSE.
