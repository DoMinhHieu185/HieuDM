# Tìm hiểu quản trị tài khoản người dùng trên Linux

## Quản lí tài khoản người dùng trong Linux
Có 3 loại người dùng chính trong Linux
* **Root user**: là người dùng mạnh nhất trong hệ thông Linux và thường được tạo trong quá trình cài đặt. Người dùng root thì sẽ có quyền tuyệt đối trong hệ thống Linux
* **Regular User(Người sử dụng thường xuyên)**: là người dùng đăng nhập bình thường có thể được tạo bởi quản trị viên hệ thống. Người dùng thông thường chỉ có thể thực hiện các tác vụ và truy cập các tệp và thư mục mà họ được cấp quyền. Nếu cần, người dùng thông thường có thể được cấp các đặc quyền nâng cao để thực hiện các tác vụ cấp quản trị. Người dùng thông thường cũng có thể bị xóa hoặc vô hiệu hóa khi có nhu cầu.
* **Service Account(Tài khoản dịch vụ)**: Đây là tài khoản không đăng nhập được tạo khi cài đặt gói phần mềm. Các tài khoản này được các dịch vụ sử dụng để thực thi các quy trình trong hệ thống. Chúng không được thiết kế hoặc nhằm mục đích thực hiện bất kỳ tác vụ quản trị hoặc thông lệ nào trong hệ thống.

## Tệp quản lí người dùng
### Tệp /etc/paswd
Tệp / etc / passwd chứa khá nhiều thông tin về người dùng được chứa trong các trường khác nhau. Để xem nội dung của tập tin, bạn chỉ cần sử dụng lệnh `cat`
```
cat /etc/passwd
```
Đây là một đoạn mã của đầu ra.

```
hieu:x:1000:1000::/home/hieu:/bin/bash
```
Trong đó:
* Các tên : Đây là tên của người sử dụng, trong trường hợp này, tecmint.
* Các Password : Cột thứ hai đại diện cho mật khẩu được mã hóa của người dùng. Mật khẩu không được in dưới dạng văn bản thuần túy, thay vào đó, một trình giữ chỗ có dấu x được sử dụng.
* Các UID : Đây là tài khoản ID . Đó là một số nhận dạng duy nhất cho mọi người dùng.
* Các GID : Đây là Group ID .
* Mô tả ngắn gọn hoặc tóm tắt về người dùng.
* Đây là đường dẫn đến thư mục chính của người dùng. Đối với người dùng tecmint, chúng tôi có `/home/tecmint` 
* Đây là vỏ Đăng nhập. Đối với người dùng đăng nhập thường xuyên, điều này thường được biểu thị là `/bin/bash`. Đối với các tài khoản dịch vụ như SSH hoặc MySQL, điều này thường được biểu thị là `/bin/false`

### Tệp /etc/group
Tệp này chứa thông tin về các nhóm người dùng. Khi người dùng được tạo, trình bao tự động tạo một nhóm tương ứng với tên người dùng của người dùng. Đây được gọi là nhóm chính. Người dùng được thêm vào nhóm chính khi tạo
Tệp / etc / group có 3 cột. Từ ngoài cùng bên trái, chúng ta có:
* Tên nhóm. Mỗi tên nhóm phải là duy nhất.
* Mật khẩu nhóm. Thường được đại diện bởi một trình giữ chỗ x.
* ID nhóm (GID)
* Các thành viên trong nhóm. Đây là những thành viên thuộc nhóm. Trường này được để trống nếu người dùng là thành viên duy nhất trong nhóm.

Để xác nhận các nhóm mà người dùng thuộc về, hãy chạy lệnh:
```
groups username
```

### Tệp /etc/gshadow
Tập tin này có chứa mã hóa hoặc 'shadowed' mật khẩu cho các tài khoản nhóm và, vì lý do an ninh, không thể được truy cập bởi người dùng bình thường. Nó chỉ có thể được đọc bởi người dùng root và những người dùng có đặc quyền sudo.
```
[root@localhost ~]# sudo cat /etc/gshadow
root:::
hieu:!::
```
Từ ngoài cùng bên trái, tệp chứa các trường sau:
* Tên nhóm
* Mật khẩu nhóm được mã hóa
* Nhóm Admin
* Thành viên nhóm

### Tệp /etc/shadow
Tệp `/etc/shadow` lưu trữ mật khẩu thực của người dùng ở định dạng được băm hoặc mã hóa
```
[root@localhost ~]# cat /etc/shadow
hieu:$6$Z6Q02e1B$Nl9YPn5o4d0TCL2.KA43oJzFlPlmFGkEb6VUjLpqWegYGVWQQy1cl9y/olRIMOD8.8rfHoQkfmUl73moGZ1rc/:18895:0:99999:7:::
```
Tệp có 9 trường. Bắt đầu từ ngoài cùng bên trái, chúng ta có:
* Các tên(username): Đây là tên đăng nhập của bạn.
* Mật khẩu của các người dùng(user’s password): Điều này được trình bày ở định dạng băm hoặc mã hóa.
* Các thay đổi mật khẩu cuối cùng(last password change): Đây là ngày kể từ khi mật khẩu được thay đổi và được tính từ ngày kỷ nguyên. Kỷ nguyên là ngày 1 tháng 1 năm 1970.
* Độ tuổi mật khẩu tối thiểu(minimum password age): Đây là số ngày tối thiểu phải trôi qua trước khi có thể đặt mật khẩu.
* Độ tuổi mật khẩu tối đa(maximum password age): Đây là số ngày tối đa mà sau đó mật khẩu phải được thay đổi.
* Khoảng thời gian cảnh báo(warning period): Như tên cho thấy, đây là số ngày ngay trước khi mật khẩu hết hạn mà người dùng được thông báo về việc mật khẩu sắp hết hạn.
* Khoảng thời gian không hoạt động(inactivity period): Số ngày sau khi mật khẩu hết hạn mà tài khoản người dùng bị vô hiệu hóa mà người dùng không thay đổi mật khẩu.
* Ngày hết hạn( expiration date): Ngày tài khoản người dùng hết hạn.
* Trường dành riêng(Reserved field): Cái này để trống.

### Cách thêm người dùng trong hệ thống Linux
Cú pháp thêm người dùng
```
# adduser username
```
Cú pháp đặt mật khẩu cho người dùng
```
# passwd username
```
Sửa thông tin tài khoản .
```
usermod [options] [login_name]
```

### Cách xóa người dùng trong hệ thống Linux
Để xóa người dùng khỏi hệ thống, trước tiên bạn nên khóa người dùng đăng nhập vào hệ thống
```
# passwd -l username
```

Nếu muốn, bạn có thể sao lưu các tệp của người dùng bằng lệnh `tar` .
```
# tar -cvf /backups/backups-user.tar.bz2  /home/username
```

Cuối cùng, để xóa người dùng cùng với thư mục chính, hãy sử dụng lệnh 
```
userdel -r username
```
### Cách tạo và xóa nhóm.
Tạo nhóm
```
groupadd newgroup
```

Thêm user vào group

```
useradd -a -G newgroup username
```
Xóa một group
```
groupdel newgroup
```

Tạo mật khẩu cho group .
```
gpasswd [group_name]
```


### Lệnh `chage`
Lệnh chage thay đổi thông tin hết hạn mật khẩu người dùng
```
chage [option] [username login]
```



