# Directory Structure (Filesystem Hierarchy)(Cấu trúc thư mục (Cấu trúc phân cấp hệ thống tệp))

### 1. Directory Structure (Filesystem Hierarchy)
Hệ thống tệp lưu trữ thông tin theo cấu trúc phân cấp có dạng cây.

Mức root level của cây được gọi là thư mục gốc, hoặc thư mục ảo (được biểu thị bằng một dấu gạch chéo "/").

Thư mục gốc(/) chứa tất cả các tệp và thư mục từ tất cả các thiết bị (vật lý hoặc điểm gắn kết) của hệ thống.

Mỗi thư mục có thể có các tệp hoặc các thư mục con khác bên trong nó.

Tệp hoặc thư mục có tên bắt đầu bằng ký tự dấu chấm (".") Theo mặc định bị ẩn và không được hiển thị theo mặc định trong trình quản lý tệp (nó cũng sẽ bị ẩn nếu bạn sử dụng lệnh ls mà không có tùy chọn "-a ").

### 2. The Root Directory
```
[root@localhost ~]# tree -L 1 /
/
├── bin -> usr/bin
├── boot
├── dev
├── etc
├── home
├── lib -> usr/lib
├── lib64 -> usr/lib64
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin -> usr/sbin
├── srv
├── sys
├── tmp
├── usr
└── var
```
  * /bin: chứa các lệnh của người dùng (cp, rm, ...)
  * /sbin: chứa các lệnh quản trị
  * /boot: chứa kernel linux có thể khởi động và các tệp cấu hình boot loader
  * /dev: chứa các tệp đại diện cho các điểm truy cập vào thiết bị
  * /etc: chứa các tệp cấu hình quản trị
  * /home: chứa thư mục chính của người dùng
  * /lib: chứa các tệp thư viện
  * /media: điểm gắn kết(mount) cho các thiết bị
  * /mnt: điểm gắn kết cho thiết bị, phân vùng đĩa, hệ thống tệp từ xa
  * /cdrom: điểm gắn kết cho cd-roms
  * /proc: chứa các tệp đại diện cho tài nguyên hệ thống
  * /root: thư mục của người dùng root
  * /run: chứa các tệp tạm thời của ứng dụng
  * /tmp: chứa các tệp tạm thời của ứng dụng
  * /usr: chứa các tệp của người dùng (tệp nhị phân, thư viện, cài đặt, tài liệu, ...)
  * /var: chứa các tệp của ứng dụng (dữ liệu, cấu hình, nhật ký, ...)

### 3. Directories Paths
Bạn có thể xác định một thư mục hoặc một tệp bằng cách sử dụng đường dẫn tuyệt đối của nó (bắt đầu từ thư mục gốc).

Bạn cũng có thể sử dụng một đường dẫn tương đối (liên quan đến thư mục hiện tại) để xác định một thư mục hoặc một tệp.

Ngoài ra còn có một số dạng đặc biệt để xác định đường dẫn của một thư mục hoặc một tệp, bằng cách sử dụng dấu chấm hoặc dấu ngã của các ký tự

Đường dẫn cũng có thể chứa các biến mà chúng có thể được thay thế bằng giá trị của chúng khi phân giải tên đường dẫn (ví dụ: $HOME, $PWD).

### 4. Paths starting with a period (.), two periods (..), or a tilde (~)
Cấu trúc thư mục này sẽ được sử dụng trong các ví dụ dưới đây:
```
#|+ ${HOME}
#   |+ folder
#      |+ folder1
#      |+ folder2
$ mkdir ~/folder ~/folder/folder1 ~/folder/folder2
```
* Một đường dẫn bắt đầu bằng dấu chấm (.) Đại diện cho tên đường dẫn tuyệt đối của thư mục hiện tại
```
[root@localhost ~]#  cd ${HOME}/folder/
[root@localhost folder]# ls -1 ./
folder1
folder2
```
* Một đường dẫn bắt đầu bằng hai dấu chấm (..) đại diện cho tên đường dẫn tuyệt đối của thư mục mẹ của thư mục hiện tại.
```
[root@localhost folder]# cd ${HOME}/folder/folder1/
[root@localhost folder1]# ls -1 ../
folder1
folder2
```
* Một đường dẫn bắt đầu bằng dấu ngã (~) đại diện cho tên đường dẫn tuyệt đối của thư mục chính người dùng.
```
[root@localhost folder1]# ls -1 ~/folder
folder1
folder2
```
* Một chuỗi đứng trước dấu ngã (~) đại diện cho tên đường dẫn tuyệt đối của thư mục chính của người dùng được tham chiếu bởi giá trị của chuỗi.
```
[root@localhost ~]# ls -1 ~root/folder
folder1
folder2
```

### 5. Using wildcard characters to identify files and directories names (metacharacter wildcards)(Sử dụng các ký tự đại diện để xác định tên tệp và thư mục (ký tự đại diện siêu ký tự))
Bạn có thể sử dụng một số ký tự đại diện (ký tự đại diện siêu ký tự) để khớp với một phần của tệp hoặc tên thư mục.
* *: khớp với bất kỳ số ký tự nào.
```
[root@localhost ~]# cd ${HOME}/folder/
[root@localhost folder]# ls fold*
folder1:

folder2:
```
* ?: khớp một lần xuất hiện của một ký tự.
```
[root@localhost folder]# ls f??der?
folder1:

folder2:
```
* [...]: xác định một lần xuất hiện, một tập hợp hoặc một phạm vi ký tự
```
[root@localhost folder]#  ls f[a-z]*[0-9]
folder1:

folder2:
```
Bạn cũng có thể sử dụng dấu ngoặc nhọn ({}) để mở rộng một tập hợp các ký tự để khớp với một phần của tệp hoặc tên thư mục.
```
[root@localhost ~]# touch file{1,2,3}
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  do1  file1  file2  file3  filex.cpio  folder  hieu.txt
```
```
[root@localhost ~]# touch file-{a..c}-{1,2,3}
[root@localhost ~]# ls file-*
file-a-1  file-a-2  file-a-3  file-b-1  file-b-2  file-b-3  file-c-1  file-c-2  file-c-3
```
Bạn có thể sử dụng ký tự chấm than (!) Để loại trừ một mẫu:
```
[root@localhost ~]# ls file-[!a-b]-[!1-2]
file-c-3
```

