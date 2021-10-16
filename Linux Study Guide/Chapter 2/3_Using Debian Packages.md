# Sử dụng Gói Debian
### Debian Package File Conventions(Quy ước về tệp gói Debian)
Debian gói các tệp ứng dụng thành một tệp gói .deb để phân phối sử dụng định dạng tên tệp sau:
```
PACKAGE-NAME-VERSION-RELEASE_ARCHITECTURE.deb
```

### The dpkg Command Set(Bộ lệnh dpkg)
Công cụ cốt lõi được sử dụng để xử lý các tệp .deb là chương trình dpkg, là một tiện ích dòng lệnh có các tùy chọn để cài đặt, cập nhật và xóa các tệp gói .deb trên hệ thống Linux của bạn. Định dạng cơ bản cho lệnh dpkg như sau:
```
dpkg [OPTIONS] ACTION PACKAGE-FILE
```
Cài 1 gói deb:
```
root@hieukma:~# dpkg -i teamviewer_amd64.deb
Selecting previously unselected package teamviewer.
(Reading database ... 67139 files and directories currently installed.)
Preparing to unpack teamviewer_amd64.deb ...
Unpacking teamviewer (15.22.3) ...
...
```
Hiển thị trạng thái các gói đã cài đặt
```
root@hieukma:~# dpkg -s teamviewer
Package: teamviewer
Status: install ok unpacked
Priority: optional
Section: non-free/net
Installed-Size: 244024
Maintainer: TeamViewer Germany GmbH <service@teamviewer.com>
Architecture: amd64
Version: 15.22.3
```
Hiển thị các gói đã cài đặt sử dụng `-l`

```
root@hieukma:~# dpkg -l
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                                     Version                   Architecture              Description
+++-========================================-=========================-=========================-======================================================================================
ii  accountsservice                          0.6.45-1ubuntu1           amd64                     query and manipulate user account information
ii  adduser                                  3.116ubuntu1              all                       add and remove users and groups
ii  amd64-microcode                          3.20180524.1~ubuntu0.18.0 amd64                     Processor microcode firmware for AMD CPUs
ii  apparmor                                 2.12-4ubuntu5.1           amd64                     user-space parser utility for AppArmor
ii  apt                                      1.6.8                     amd64                     commandline package manager
ii  apt-utils                                1.6.8                     amd64                     package management related utility programs
ii  base-files                               10.1ubuntu2.4             amd64                     Debian base system miscellaneous files
ii  base-passwd                              3.5.44                    amd64                     Debian base system master password and group files
ii  bash                                     4.4.18-2ubuntu1           amd64                     GNU Bourne Again SHell

...
```

Xóa các gói đã cài đặt sử dụng `-P`

```
root@hieukma:~# dpkg -P teamviewer
(Reading database ... 59695 files and directories currently installed.)
Removing teamviewer (15.15.5) ...
Purging configuration files for teamviewer (15.15.5) ...
Processing triggers for dbus (1.12.2-1ubuntu1.1) ...
Processing triggers for mime-support (3.60ubuntu1) ...
```

### Looking at the APT Suite
Bộ Công cụ Gói Nâng cao (APT- Advanced Package Tool) được sử dụng để làm việc với các kho Debian. Điều này bao gồm chương trình apt-cache cung cấp thông tin về cơ sở dữ liệu gói và chương trình apt-get thực hiện công việc cài đặt, cập nhật và gỡ bỏ gói.

Bộ công cụ APT dựa vào tệp /etc/apt/sources.list để xác định các vị trí cần tìm kho lưu trữ. Theo mặc định, mỗi bản phân phối Linux nhập vị trí kho lưu trữ của chính nó trong tệp đó. Tuy nhiên, bạn có thể bao gồm các vị trí kho lưu trữ bổ sung nếu bạn cài đặt các ứng dụng của bên thứ ba không được bản phân phối hỗ trợ.

### Using apt-cache
Dưới đây là một số tùy chọn lệnh hữu ích trong chương trình apt-cache để hiển thị thông tin về các gói:
* depends: Hiển thị các phụ thuộc cần thiết cho gói
* pkgnames: Hiển thị tất cả các gói được cài đặt trên hệ thống
* search: Hiển thị tên của các gói phù hợp với ứng dụng được chỉ định
* showpkg: Liệt kê thông tin về gói được chỉ định
* stats: Hiển thị thống kê gói cho hệ thống
* unmet: Hiển thị bất kỳ phụ thuộc nào chưa được đáp ứng cho tất cả các gói đã cài đặt hoặc gói đã cài đặt cụ thể

Ví dụ: Hiển thị tất cả các gói đã cài đặt bằng lệnh apt-cache pkgnames bắt đầu bằng "nano"
```
root@hieukma:~# apt-cache pkgnames | grep ^nano
nano
nanoblogger
nano-tiny
nanoblogger-extra
nanomsg-utils
nanoc
nanook
nanopolish
nanoc-doc
```

Ví dụ 2: Tìm kiếm gói bằng lệnh tìm kiếm apt-cache
```
root@hieukma:~# apt-cache search openssh-client
openssh-client - secure shell (SSH) client, for secure access to remote machines
openssh-client-ssh1 - secure shell (SSH) client for legacy SSH1 protocol
ssh-askpass-gnome - interactive X program to prompt users for a passphrase for ssh-add
```

### Using apt-get(Sử dụng apt-get)
apt-get sử dụng để cài đăt, cập nhật và xóa các gói khỏi kho lưu trữ debian.

* Ví dụ: Cài đặt một gói bằng lệnh apt-get install
```
root@hieukma:~# apt-get install apache2
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap liblua5.2-0 ssl-cert
Suggested packages:
  www-browser apache2-doc apache2-suexec-pristine | apache2-suexec-custom openssl-blacklist
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap liblua5.2-0 ssl-cert
0 upgraded, 10 newly installed, 0 to remove and 145 not upgraded.
```

### Reconfiguring Packages(Định cấu hình lại các gói)
Để hiển thị cấu hình của các gói đã cài đặt:
```
root@hieukma:~# debconf-show openssh-server
  openssh-server/password-authentication: true
  openssh-server/permit-root-login: true
```