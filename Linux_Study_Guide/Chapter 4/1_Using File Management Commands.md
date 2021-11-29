# Using File Management Commands(Sử dụng lệnh quản lý tệp)
### Naming and Listing Files
#### Displaying Filenames with the ls Command(Hiển thị tên tệp bằng lệnh ls)
Lệnh cơ bản nhất để xem tên tệp và các siêu dữ liệu khác nhau của tệp là lệnh danh sách. Siêu dữ liệu là thông tin mô tả và cung cấp chi tiết bổ sung về dữ liệu.

Để đưa ra lệnh danh sách, bạn sử dụng ls và bất kỳ tùy chọn hoặc đối số cần thiết nào. Cấu trúc cú pháp cơ bản cho lệnh danh sách như sau:
```
ls [OPTIONS]… [FILE]…
```
Các tuỳ chọn:
`-a, --all` : liệt kê tất cả các file và thư mục
```
[root@localhost ~]# ls -a
.                .bash_history  .bashrc   dohieuab    emacs.cpio  grep.txt                              number.txt  splitaa     usr
..               .bash_logout   .cshrc    dohieuac    err.txt     hieu.txt                              num.txt     stdout.txt  var
anaconda-ks.cfg  .bash_profile  dohieuaa  dohieu.txt  etc         httpd-2.4.6-97.el7.centos.x86_64.rpm  run         .tcshrc
[root@localhost ~]# ls --all
.                .bash_history  .bashrc   dohieuab    emacs.cpio  grep.txt                              number.txt  splitaa     usr
..               .bash_logout   .cshrc    dohieuac    err.txt     hieu.txt                              num.txt     stdout.txt  var
anaconda-ks.cfg  .bash_profile  dohieuaa  dohieu.txt  etc         httpd-2.4.6-97.el7.centos.x86_64.rpm  run         .tcshrc
```
`ls -x `: sắp xếp đầu ra tệp theo thứ tự bảng chữ cái
```
[root@localhost ~]# ls -x
anaconda-ks.cfg                       dohieuaa    dohieuab  dohieuac  dohieu.txt  emacs.cpio  err.txt  etc  grep.txt  hieu.txt
httpd-2.4.6-97.el7.centos.x86_64.rpm  number.txt  num.txt   run       splitaa     stdout.txt  usr      var
```
`ls -t` : sắp xếp tệp mới sửa đổi theo thời gian
```
[root@localhost ~]# ls -t
var  run  emacs.cpio  num.txt  stdout.txt  hieu.txt  dohieuab  splitaa     anaconda-ks.cfg
usr  etc  dohieu.txt  err.txt  grep.txt    dohieuaa  dohieuac  number.txt  httpd-2.4.6-97.el7.centos.x86_64.rpm
```
`ls -l` : hiển thị các file và thư mục, các phân quyền, kich thước( file/forder), ngày sửa đổi, chủ sở hữu, tên file hoặc thư mục
```
[root@localhost ~]# ls -l
total 12500
-rw-------. 1 root root    1221 Sep 25 15:20 anaconda-ks.cfg
-rw-r--r--. 1 root root      13 Oct  3 14:07 dohieuaa
-rw-r--r--. 1 root root       6 Oct  3 14:07 dohieuab
-rw-r--r--. 1 root root       8 Oct  3 14:07 dohieuac
-rw-r--r--. 1 root root      63 Oct  6 16:48 dohieu.txt
-rw-r--r--. 1 root root 9897228 Oct 14 22:32 emacs.cpio
-rw-r--r--. 1 root root      47 Oct  6 11:18 err.txt
drwxr-xr-x. 5 root root      55 Oct 14 22:33 etc
-rw-r--r--. 1 root root      15 Oct  6 09:32 grep.txt
-rw-r--r--. 1 root root      40 Oct  3 14:25 hieu.txt
```
`ls -F` : chỉ ra loại tệp:

  * @ : là 1 symbol link
  * (*) : là 1 thực thi
  * | : chỉ ra 1 đường ống được đặt tên
  * / : là 1 thư mục
```
[root@localhost ~]# ls -F
anaconda-ks.cfg  dohieuab  dohieu.txt  err.txt  grep.txt  httpd-2.4.6-97.el7.centos.x86_64.rpm  num.txt  splitaa     usr/
dohieuaa         dohieuac  emacs.cpio  etc/     hieu.txt  number.txt                            run/     stdout.txt  var/
```
`ls --hide=*.rpm` : ẩn 1 loại tệp cụ thể ở đầu ra
```
[root@localhost ~]# ls --hide=*.rpm
anaconda-ks.cfg  dohieuab  dohieu.txt  err.txt  grep.txt  number.txt  run      stdout.txt  var
dohieuaa         dohieuac  emacs.cpio  etc      hieu.txt  num.txt     splitaa  usr
```
`ls -l -author `: hiển thị tên tác giả mỗi tập tin
```

[root@localhost ~]# ls -l -author
total 13M
-rw-r--r--.  1 root  129 Dec 29  2013 .tcshrc
-rw-r--r--.  1 root  100 Dec 29  2013 .cshrc
-rw-------.  1 root 1.2K Sep 25 15:20 anaconda-ks.cfg
-rw-r--r--.  1 root   21 Oct  3 13:37 number.txt
-rw-r--r--.  1 root   27 Oct  3 14:06 splitaa
-rw-r--r--.  1 root    8 Oct  3 14:07 dohieuac
-rw-r--r--.  1 root    6 Oct  3 14:07 dohieuab
-rw-r--r--.  1 root   13 Oct  3 14:07 dohieuaa
-rw-r--r--.  1 root   40 Oct  3 14:25 hieu.txt
-rw-r--r--.  1 root   15 Oct  6 09:32 grep.txt
```
`ls -lt` : hiển thị các file và thư mục, các phân quyền, chủ sở hữu, kích thước(file/forder), sắp xếp theo thứ tự ngày giờ sửa đổi
```
[root@localhost ~]# ls -lt
total 12500
drwxr-xr-x. 6 root root      52 Oct 14 22:33 var
drwxr-xr-x. 7 root root      70 Oct 14 22:33 usr
drwxr-xr-x. 3 root root      19 Oct 14 22:33 run
drwxr-xr-x. 5 root root      55 Oct 14 22:33 etc
-rw-r--r--. 1 root root 9897228 Oct 14 22:32 emacs.cpio
-rw-r--r--. 1 root root      63 Oct  6 16:48 dohieu.txt
-rw-r--r--. 1 root root      14 Oct  6 11:45 num.txt
-rw-r--r--. 1 root root      47 Oct  6 11:18 err.txt
-rw-r--r--. 1 root root      55 Oct  6 10:43 stdout.txt
-rw-r--r--. 1 root root      15 Oct  6 09:32 grep.txt
-rw-r--r--. 1 root root      40 Oct  3 14:25 hieu.txt
-rw-r--r--. 1 root root      13 Oct  3 14:07 dohieuaa
-rw-r--r--. 1 root root       6 Oct  3 14:07 dohieuab
```

#### Creating and Naming Files(Tạo và đặt tên tệp)
Lệnh `touch` sẽ cho phép bạn tạo các tệp trống một cách nhanh chóng
```
[root@localhost ~]# touch file1
[root@localhost ~]# ls
anaconda-ks.cfg  file1
```
Để tạo cùng lúc nhiều file trống:
```
[root@localhost ~]#  touch file2 file3 doc1 doc2
[root@localhost ~]# ls
anaconda-ks.cfg  doc1  doc2  file1  file2  file3
```
Để nhanh chóng xác định loại tệp, hãy sử dụng lệnh `file`
```
[root@localhost ~]# file configwp.sh
configwp.sh: Bourne-Again shell script, ASCII text executable
[root@localhost ~]# file anaconda-ks.cfg
anaconda-ks.cfg: ASCII text
```

### Exploring Wildcard Expansion Rules(Khám phá các quy tắc mở rộng ký tự đại diện)
Có thể sử dụng ls kèm với các ký tự mở rộng như sau:
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  doc1  doc2  file1  file2  file3
[root@localhost ~]# ls file[1234]
file1  file2  file3
[root@localhost ~]# ls *1
doc1  file1
[root@localhost ~]# ls doc?
doc1  doc2
```

### Understanding the File Commands(Hiểu các lệnh tệp)
#### Creating Directories
Bạn có thể nhanh chóng tạo thư mục thông qua lệnh `mkdir`.
```
[root@localhost ~]# mkdir hieu
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  doc1  doc2  file1  file2  file3  hieu
```

#### Copying Files and Directories
`cp` command dùng để sao chép tệp tin và thư mục, khi sao chép cp đồng thời cũng có thể tạo tệp mới.

Để sao chép 1 thư mục đồng thời tạo thư mục cần sao chép :
```
[root@localhost ~]# cat hieu1
Do Minh Hieus
18/05/1999
Yen Bai
[root@localhost ~]# cp hieu1 hieu2
[root@localhost ~]# cat hieu2
Do Minh Hieus
18/05/1999
Yen Bai
```
Nếu copy vào 1 file đã có dữ liệu, hệ thống sẽ đưa ra câu hỏi có muốn ghi đè dữ liệu hay không.
```
[root@localhost ~]# cp hieu1 hieu2
cp: overwrite ‘hieu2’?
```
Để sao chép 1 thư mục, ta sử dụng tùy chọn -R.
```
[root@localhost ~]# cp -R /root/do /root/do1
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  do  do1  doc1  doc2  file1  file3  hieu  hieu1  hieu2
```

#### Moving/Renaming Files and Directories(Di chuyển / đổi tên tệp và thư mục)
Để di chuyển hoặc đổi tên một tệp hoặc thư mục cục bộ, bạn sử dụng một lệnh duy nhất: lệnh `mv`. Cú pháp cơ bản của lệnh gần giống với lệnh cp:
```
mv [OPTION]… SOURCE DEST
```
* Sử dụng mv để đổi tên
```
[root@localhost ~]# mv hieu1 dohieu1
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  do  do1  doc1  doc2  dohieu1  file1  file3  hieu  hieu2
```
* Sử dụng để di chuyển file hoặc thư mục đến 1 vị trí khác:
```
[root@localhost ~]# mv dohieu1 /root/hieu
[root@localhost ~]# cd hieu
[root@localhost hieu]# ls
dohieu1
```

#### Deleting Files and Directories(Xóa tệp và thư mục)
Để xóa 1 file hoặc thư mục ta sử dụng lệnh rm.

Sử dụng tùy chọn -f để xóa không cần hỏi lại.
```
[root@localhost ~]# rm -f hieu2
```
Xóa file hoặc thư mục bất kể lý do
```
[root@localhost ~]# rm -rf hieu
```
Xóa cùng lúc nhiều file hoặc thư mục
```
[root@localhost ~]# rm -rf doc1 doc2 do
```

### Compressing File Commands(Lệnh nén các tệp)
Một số tiện ích phổ biến để nén các tệp là:
* gzip
* bzip2
* xz
* zip
Ưu điểm và nhược điểm của từng phương pháp nén dữ liệu này là
* gzip Tiện ích gzip được phát triển vào năm 1992 để thay thế cho chương trình nén cũ. Sử dụng thuật toán Lempel-Ziv (LZ77) để đạt được tỷ lệ nén tệp dựa trên văn bản là 60-70 phần trăm, gzip từ lâu đã trở thành một tiện ích nén dữ liệu phổ biến. Để nén một tệp, hãy nhập gzip theo sau là tên của tệp. Tệp gốc được thay thế bằng một phiên bản nén có phần mở rộng là .gz. Để đảo ngược thao tác, hãy nhập gunzip, sau đó là tên tệp nén.
* bzip2 Được phát triển vào năm 1996, tiện ích bzip2 cung cấp tốc độ nén cao hơn gzip nhưng mất nhiều thời gian hơn một chút để thực hiện nén dữ liệu. Tiện ích bzip2 sử dụng nhiều lớp kỹ thuật và thuật toán nén. Cho đến năm 2013, tiện ích nén dữ liệu này đã được sử dụng để nén nhân Linux để phân phối. Để nén tệp, hãy nhập bzip2 theo sau là tên tệp. Tệp gốc được thay thế bằng một phiên bản nén có phần mở rộng là .bz2. Để đảo ngược thao tác, hãy nhập bunzip2, theo sau là tên tệp nén, tên này sẽ giải nén (làm xẹp) dữ liệu.
* xz Được phát triển vào năm 2009, tiện ích nén dữ liệu xz nhanh chóng trở nên rất phổ biến trong giới quản trị viên Linux. Nó tự hào có tốc độ nén mặc định cao hơn bzip2 và gzip thông qua thuật toán nén LZMA2 — mặc dù bằng cách sử dụng các tùy chọn lệnh xz nhất định, bạn có thể sử dụng thuật toán nén LZMA kế thừa, nếu cần hoặc muốn. Tiện ích nén xz vào năm 2013 đã thay thế bzip2 để nén nhân Linux để phân phối. Để nén tệp, hãy nhập xz, sau đó là tên tệp. Tệp gốc được thay thế bằng một phiên bản nén có phần mở rộng là .xz. Để đảo ngược thao tác, hãy nhập unxz, theo sau là tên tệp nén.
* zip Tiện ích zip khác với các tiện ích nén dữ liệu khác ở chỗ nó hoạt động trên nhiều tệp. Nếu bạn đã từng tạo tệp zip trên hệ điều hành Windows, thì bạn đã sử dụng định dạng tệp này. Nhiều tệp được đóng gói cùng nhau trong một tệp, thường được gọi là thư mục hoặc tệp lưu trữ, sau đó được nén. Một điểm khác biệt so với các tiện ích nén Linux khác là zip không thay thế (các) tệp gốc. Thay vào đó, nó đặt một bản sao của (các) tệp vào một tệp lưu trữ. Để lưu trữ và nén tệp bằng zip, hãy nhập zip theo sau là tên của tệp lưu trữ cuối cùng, theo truyền thống thường kết thúc bằng đuôi .zip. Để đảo ngược thao tác, hãy nhập unzip, sau đó nhập tên tệp lưu trữ đã nén.

### Archiving File Commands(Lệnh lưu trữ tệp)
#### Copying with cpio
Tên của tiện ích cpio là viết tắt của “copy in and out.”. Nó tập hợp các bản sao tệp lại với nhau và lưu trữ chúng trong một tệp lưu trữ.
```
[root@localhost ~]# ls file?
file1  file2  file3  file4
[root@localhost ~]# ls fie? | cpio -ov > filex.cpio
[root@localhost ~]# ls file? | cpio -ov > filex.cpio
file1
file2
file3
file4
1 block
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  do1  file1  file2  file3  file4  filex.cpio  hieu.txt
```
Các tùy chọn được sử dụng với lệnh cpio là -ov, tạo một kho lưu trữ chứa các bản sao của các tệp được liệt kê và hiển thị tên của tệp khi chúng được sao chép. Kho lưu trữ tệp được sử dụng có tên là filex.cpio. Mặc dù không cần thiết nhưng việc sử dụng phần mở rộng .cpio trên các tệp lưu trữ cpio được coi là hình thức tốt.

Tuy nhiên, vì cpio duy trì đường dẫn tuyệt đối của tệp, điều này có thể khó khăn nếu bạn cần khôi phục tệp vào vị trí thư mục khác. Để thực hiện việc này, bạn cần sử dụng tùy chọn --no-absolute-filenames 

#### Duplicating with dd
Sử dụng `dd` command để sao lưu gần như toàn bộ đĩa cứng với đĩa cứng khác.

để sao lưu toàn bộ đĩa cứng:
```
dd if = /dev/sda of = /dev/sdb
```
hoặc có thể sử dụng lệnh dd để tạo file iso:
```
dd if = /dev/cdrom of = tgsservice.iso bs = 2048
```

### Managing Links
Để tạo các liên kết trong linux ta sử dụng lệnh `ln`:
#### Establishing a Hard Link(Thiết lập một liên kết cứng)
Liên kết tắt cứng sẽ tạo ra 1 file vật lí cùng trỏ đến mục nhập inode của file vật lí gốc. 2 fle này hoàn toàn đồng đẳng với nhau. Nếu xóa file gốc thì dữ liệu hoàn toàn không bị mất, nó chỉ mất khi ko còn liên kết nào đến inode nữa.
```
ln file_test1 file_test2
```
#### Constructing a Soft Link(Xây dựng một liên kết mềm)
Bạn có thể tạo liên kết đến tệp và thư mục và bạn có thể tạo liên kết (phím tắt) trên phân vùng khác nhau và với số inode khác với bản gốc.

Nếu thư mục gốc bị xóa, liên kết sẽ mất. nếu thư mục liên kết bị xóa, thư mục gốc vẫn tồn tại.
```
ln -s test test-file
```