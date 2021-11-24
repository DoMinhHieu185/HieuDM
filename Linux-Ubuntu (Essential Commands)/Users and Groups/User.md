# Users
### 1. Who is logged in (users)
In người dùng hiện đang đăng nhập:
```
[root@localhost ~]# users
root root
```
### 2. Add a new user (useradd)
Sử dụng lệnh useradd để thêm người dùng mới ( man useradd ):

Cách sử dụng
```
useradd [options] USER
```
Options
```
  -b, --base-dir BASE_DIR       thư mục cơ sở cho thư mục chính của tài khoản mới (mặc định "/ home")
  -d, --home-dir HOME_DIR       thư mục chính của tài khoản mới (mặc định: "/{BASE_DIR}/{USER}")
  -m, --create-home             tạo thư mục chính của người dùng
  -G, --groups GROUPS           danh sách các nhóm bổ sung của tài khoản mới
  -s, --shell SHELL             đăng nhập shell của tài khoản mới (/bin/false để dừng đăng nhập SSH)
  -c, --comment COMMENT         comment
  -e, --expiredate EXPIRE_DATE  ngày hết hạn của tài khoản mới
  -f, --inactive INACTIVE       thời gian không hoạt động của mật khẩu của tài khoản mới
```
Lệnh `useradd` ảnh hưởng đến hai tệp "/etc/passwd" và "/etc/group".

Đây là cách dữ liệu được cấu trúc trong các tệp này:
  * /etc/passwd
```
[root@localhost ~]# cat /etc/passwd | grep "hieu"
hieu:x:1000:1000:adm:/home/hieu:/bin/bash
```
  * Ở đây:
    * hieu: tên tài khoản
    * x: Trình giữ chỗ cho mật khẩu. Mật khẩu được lấy từ tệp "/ etc / shadow".
    * 1000: User ID.
    * 1000: Group ID.
    * adm : Comment.
    * /home/hieu: Thư mục chính.
    * /bin/bash: User shell.
  * /etc/group
```
[root@localhost ~]# cat /etc/group | grep hieu
hieu:x:1000:
```
  * Ở đây
    * hieu: Tên nhóm
    * x: Trình giữ chỗ cho thông tin mật khẩu. Mật khẩu được lấy từ tệp "/etc/gshadow".
    * 1000: ID nhóm
    *   : Danh sách người dùng thuộc nhóm được phân tách bằng dấu phẩy.
Examples:
* Tạo người dùng với nhóm mặc định có tên người dùng
```
[root@localhost ~]# sudo useradd hieu2
[root@localhost ~]# cat /etc/passwd | grep hieu2
hieu2:x:1001:1001::/home/hieu2:/bin/bash
[root@localhost ~]# cat /etc/group | grep hieu2
hieu2:x:1001:
```
* Tạo người dùng với nhóm mặc định và gán người dùng vào nhóm "group1"
```
[root@localhost ~]#  sudo useradd -m -G group1 -s /bin/bash hieu3
[root@localhost ~]# cat /etc/passwd | grep hieu3
hieu3:x:1002:1003::/home/hieu3:/bin/bash
[root@localhost ~]# cat /etc/group | grep hieu3
group1:x:1002:hieu3
hieu3:x:1003:
```
* Tạo người dùng có tên "hieu4" với nhóm mặc định có tên "hieu4".
  + đặt thư mục chính cơ sở thành "/hieu4_home_dir".
  + tạo thư mục chính cơ sở "/hieu4_home_dir".
```
[root@localhost ~]# sudo useradd -m -d /hieu4_home_dir hieu4

[root@localhost ~]# cat /etc/passwd | grep hieu4
hieu4:x:1003:1004::/hieu4_home_dir:/bin/bash

[root@localhost ~]# cat /etc/group | grep hieu4
hieu4:x:1004:

[root@localhost ~]# ll -a /hieu4_home_dir
total 12
drwx------.  2 hieu4 hieu4  62 Nov 23 12:01 .
dr-xr-xr-x. 18 root  root  246 Nov 23 12:01 ..
-rw-r--r--.  1 hieu4 hieu4  18 Apr  1  2020 .bash_logout
-rw-r--r--.  1 hieu4 hieu4 193 Apr  1  2020 .bash_profile
-rw-r--r--.  1 hieu4 hieu4 231 Apr  1  2020 .bashrc
```
* Tạo người dùng có tên "mtitek1" với nhóm mặc định có tên "hieu5".
  * đặt thư mục cơ sở thành "/user_base_dir".
  * tạo thư mục chính cơ sở "/user_base_dir/hieu5".
```
[root@localhost ~]# mkdir /user_base_dir

[root@localhost ~]# sudo useradd -m -b /user_base_dir hieu5

[root@localhost ~]# cat /etc/passwd | grep hieu5
hieu5:x:1004:1005::/user_base_dir/hieu5:/bin/bash

[root@localhost ~]# cat /etc/group | grep hieu5
hieu5:x:1005:

[root@localhost ~]# ls -al /user_base_dir
total 0
drwxr-xr-x.  3 root  root   19 Nov 23 12:25 .
dr-xr-xr-x. 19 root  root  267 Nov 23 12:25 ..
drwx------.  2 hieu5 hieu5  62 Nov 23 12:25 hieu5

[root@localhost ~]# ls -al /user_base_dir/hieu5
total 12
drwx------. 2 hieu5 hieu5  62 Nov 23 12:25 .
drwxr-xr-x. 3 root  root   19 Nov 23 12:25 ..
-rw-r--r--. 1 hieu5 hieu5  18 Apr  1  2020 .bash_logout
-rw-r--r--. 1 hieu5 hieu5 193 Apr  1  2020 .bash_profile
-rw-r--r--. 1 hieu5 hieu5 231 Apr  1  2020 .bashrc
```

### 3. Change the user account (usermod)
Cập nhật thông tin tài khoản của người dùng ( man usermod ):
```
Usage: usermod [options] USER

Options:
  -d, --home HOME_DIR           thư mục chính mới cho tài khoản người dùng
  -s, --shell SHELL             shell đăng nhập mới cho tài khoản người dùng
  -G, --groups GROUPS           danh sách mới các NHÓM bổ sung
  -a, --append                  nối người dùng vào NHÓM bổ sung được đề cập bởi tùy chọn -G mà không xóa họ khỏi các nhóm khác
  -c, --comment COMMENT         comment
  -L, --lock                    khóa tài khoản người dùng
  -U, --unlock                  mở khóa tài khoản người dùng
  -e, --expiredate EXPIRE_DATE  đặt ngày hết hạn tài khoản thành EXPIRE_DATE
  -f, --inactive INACTIVE       đặt mật khẩu không hoạt động sau khi hết hạn thành INACTIVE
```
Examples:
* Thay đổi thư mục chính của người dùng và giao diện người dùng
```
[root@localhost ~]# sudo usermod --home /home/hieu1_new_home_directory/ --shell /bin/bash hieu2

[root@localhost ~]# cat /etc/passwd | grep hieu2
hieu2:x:1001:1001::/home/hieu1_new_home_directory/:/bin/bash
```
* Hạn chế người dùng truy cập tài khoản của mình:
```
[root@localhost ~]# sudo usermod --shell /usr/sbin/nologin hieu2
```

### 4. Delete the user account (userdel)
Delete a user (man userdel):
```
Usage: userdel [options] USER

Options:
  -r, --remove  loại bỏ thư mục chính và thư mục
  -f, --force   buộc xóa các tệp, ngay cả khi không thuộc sở hữu của người dùng
```
Examples:
* Xóa người dùng
```
[root@localhost ~]# sudo userdel -r hieu2
userdel: hieu2 home directory (/home/hieu1_new_home_directory/) not found
```

### 5. Hide a user from the login screen(Ẩn người dùng khỏi màn hình đăng nhập)
Bạn cần cấu hình AccountsService.(ubuntu)

Để ẩn người dùng có tên "hieu", hãy tạo tệp có tên "/var/lib/AccountsService/users/hieu" và thêm thông tin sau.
```
hieu@hieukma:~$ sudo vi /var/lib/AccountsService/users/hieu
```

### 6. Enable/Disable remote SSH login to a specific user(Bật / Tắt đăng nhập SSH từ xa cho một người dùng cụ thể)
Bạn có thể cần chỉnh sửa tệp "/etc/ssh/sshd_config" và thực hiện một trong những thao tác sau:
```
$ sudo vi /etc/ssh/sshd_config
# permit root login: yes/no
PermitRootLogin no

# allow some users
AllowUsers user2

# deny some users
DenyUsers user1
```
Tải lại cấu hình SSH:
```
[root@localhost ~]# systemctl restart sshd  #centos

hieu@hieukma:~$ sudo /etc/init.d/ssh reload   #ubuntu
[ ok ] Reloading ssh configuration (via systemctl): ssh.service.
```


