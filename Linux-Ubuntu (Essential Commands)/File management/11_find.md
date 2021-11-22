# find - tìm kiếm tệp / thư mục

### 1. Notes
```
find path ...
```
Bạn có thể muốn bỏ qua lỗi quyền truy cập và chuyển hướng chúng đến `/dev/null` bằng cách sử dụng toán tử chuyển hướng STDERR:
```
find path ... 2> /dev/null
```
Để lọc ra các kết quả tìm kiếm, bạn có thể sử dụng các tùy chọn sau: `-or`, `-o`, `-and`, `-not`

để kết hợp các tùy chọn này và tạo một biểu thức, bạn có thể sử dụng cú pháp sau: `\( expression \)`(chú ý không gian trước và sau khi biểu hiện)
```
find . \( -name file1 -or -name folder1 \) -ls
```
```
find . \( -name file1 -o -name folder1 \) -ls
```
```
find . \( -name file1 -and -name folder1 \) -ls
```
```
find . \( -name file1 -not -name folder1 \) -ls
```
Bạn có thể thực hiện một lệnh trên kết quả tìm kiếm bằng cách sử dụng các tùy chọn sau: `-exec`, `-ok`

Tùy chọn `-exec` thực hiện lệnh trên mỗi tệp được tìm thấy (hoặc thư mục) mà không yêu cầu xác nhận.

Tùy chọn `-ok` yêu cầu xác nhận trước khi thực hiện lệnh trên mỗi tệp được tìm thấy (hoặc thư mục). Bạn có thể xác nhận việc thực hiện lệnh bằng cách gõ y và nhấn Enter, nếu không nhấn Enter để bỏ qua việc thực hiện lệnh.

Cú pháp cho cả hai tùy chọn như sau:
```
find . -exec command {} \;
```
```
find . -ok command {} \;
```
Lưu ý việc sử dụng dấu ngoặc nhọn đóng vai trò giữ chỗ cho tên tệp (hoặc thư mục) được tìm thấy.
* Dòng lệnh phải kết thúc bằng dấu chấm phẩy (;) hoặc ký tự dấu cộng (+).
* Ký tự dấu chấm phẩy (;) buộc thực hiện lệnh cho mỗi tệp được tìm thấy.
* Ký tự dấu cộng (+) cho phép thực hiện lệnh trên một nhóm tệp được tìm thấy

Ký tự dấu chấm phẩy (;) nên được thoát bằng ký tự gạch chéo ngược (\) để tránh việc shell diễn giải dấu chấm phẩy như một ký tự đặc biệt (dấu phân tách lệnh shell). Bạn cũng có thể thoát khỏi ký tự dấu chấm phẩy (;) bằng cách đặt nó trong dấu ngoặc kép (";") hoặc dấu ngoặc kép (';'). Bạn cũng có thể muốn thoát khỏi ký tự dấu cộng (+) bằng ký tự gạch chéo ngược (\).
```
[root@localhost ~]# find . -exec echo {} \;
.
./.bash_logout
./.bash_profile
./.bashrc
./.cshrc
./.tcshrc
./anaconda-ks.cfg
./configwp.sh
./hieu.txt
./.bash_history
./.ssh
./.ssh/known_hosts
./file1
```
```
[root@localhost ~]#  find . -exec echo {} \+
. ./.bash_logout ./.bash_profile ./.bashrc ./.cshrc ./.tcshrc ./anaconda-ks.cfg ./configwp.sh ./hieu.txt ./.bash_history ./.ssh ./.ssh/known_hosts ./file1
```

### 2. Examples
* Tìm tập tin
```
[root@localhost ~]# find . -type f
./.bash_logout
./.bash_profile
./.bashrc
./.cshrc
./.tcshrc
./anaconda-ks.cfg
./configwp.sh
./hieu.txt
./.bash_history
./.ssh/known_hosts
./file1
```
* Tìm kiếm thư mục
```
[root@localhost ~]# find . -type d
.
./.ssh
./folder
```
* Tìm kiếm tệp / thư mục với một tên cụ thể:
  * Tìm kiếm tệp với một tên cụ thể
```
[root@localhost ~]# find . -type f -name 'file1'
./file1
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  hieu.txt
```
  * Tìm kiếm thư mục với một tên cụ thể
```
[root@localhost ~]# find . -type d -name 'folder'
./folder
```
  * Tìm kiếm các tệp có tên không kết thúc bằng `.sh`
```
[root@localhost ~]# find . -type f \! -name "*.sh"
./.bash_logout
./.bash_profile
./.bashrc
./.cshrc
./.tcshrc
./anaconda-ks.cfg
./hieu.txt
./.bash_history
./.ssh/known_hosts
./file1
```
  * Tìm kiếm các tệp / thư mục không phải là cả tệp và tên của chúng đều kết thúc bằng `.sh`
```
[root@localhost ~]# find . \! \( -type f -name "*.sh" \)
.
./.bash_logout
./.bash_profile
./.bashrc
./.cshrc
./.tcshrc
./anaconda-ks.cfg
./hieu.txt
./.bash_history
./.ssh
./.ssh/known_hosts
./file1
./folder
```
  * Tìm kiếm tệp / thư mục là thư mục hoặc tên của chúng kết thúc bằng `.sh`
```
[root@localhost ~]# find . \( -type d -or -name "*.sh" \)
.
./configwp.sh
./.ssh
./folder
```

* Tìm kiếm tệp / thư mục trong đó tên của tệp / thư mục chứa một mẫu cụ thể
  * Tìm kiếm các tệp trong đó tên của tệp chứa một mẫu cụ thể
```
[root@localhost ~]# find . -type f -name '*file*'
./.bash_profile
./file1
```
```
[root@localhost ~]# find . -type f | grep "file"
./.bash_profile
./file1
```
  * Tìm kiếm thư mục trong đó tên của thư mục chứa một mẫu cụ thể
```
[root@localhost ~]# find . -type d -name '*folder*'
./folder
```
```
[root@localhost ~]# find . -type d | grep "folder"
./folder
```
* Tìm kiếm các tệp có chứa một từ cụ thể:
```
[root@localhost ~]# find . -type f | xargs grep -l "Do Minh Hieu"
./hieu.txt
```
* Tìm kiếm tệp và sử dụng lệnh "-exec" để thực hiện các lệnh cụ thể:
  * Tìm kiếm các tệp trong đó tên của tệp chứa một mẫu cụ thể
```
[root@localhost ~]# find . -type f -exec ls -al {} \; | grep hieu
-rw-r--r--. 1 root root 41 Nov 18 16:04 ./hieu.txt
```
  * Tìm kiếm tệp bên trong 1 thư mục
```
[root@localhost ~]# find . -type d -name "folder" -exec ls -al {} \; | grep "hieu"
-rw-r--r--. 1 root root   0 Nov 21 14:58 hieu
```
* Tìm kiếm và xóa các tệp / thư mục:
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  hieu.txt
[root@localhost ~]# find . -type f -delete
[root@localhost ~]# ls
folder
```
```
find . -type f -exec rm -f {} \;
```
```
find . -type d -exec rm -rf {} \;
```
```
find . -type f -print0 | xargs -0 rm
```
* Tìm kiếm tệp và thay thế văn bản trong các tệp này:
```
[root@localhost ~]# cat hieu.txt
Do Minh Trang

AT14G
Yen Bai
18

05
1999
```
```
[root@localhost ~]# find . -type f -exec sed -i 's/Trang/Hieu/g' {} \;
```
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu

AT14G
Yen Bai
18

05
1999
```
* Tìm kiếm và đổi tên tệp
```
[root@localhost ~]# for i in `find . -type f -name "hieu.txt"`; do folderName=$(dirname "$i"); mv $folderName/hieu.txt $folderName/trang.txt; done
```

### 3. Possible values of find options(Giá trị có thể có của các tùy chọn find)
* Tất cả các tùy chọn có đối số là số (n) cho phép số đó đứng trước dấu cộng (+) hoặc dấu trừ (-);
```
+ {n}: dấu cộng (+) có nghĩa là 'nhiều hơn n' (+3: nhiều hơn 3)
- {n}: dấu trừ (-) có nghĩa là `nhỏ hơn n '(-3: nhỏ hơn 3)
{n}: có nghĩa là 'chính xác n' (3: chính xác 3)
```
* Đơn vị thời gian có thể có [smhdw] như sau
```
s: second
m: minute (60 seconds)
h: hour (60 minutes)
d: day (24 hours) (default)
w: week (7 days)
```
* Các đơn vị kích thước có thể có [ckMGTP] như sau
```
c: bytes
k: kilobytes (1024 bytes)
M: megabytes (1024 kilobytes)
G: gigabytes (1024 megabytes)
T: terabytes (1024 gigabytes)
P: petabytes (1024 terabytes)
```
* Các loại tệp có thể có như sau
```
f: regular file
d: directory
l: symbolic link
c: character special
b: block special
p: FIFO
s: socket
```
