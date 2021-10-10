# Điều hướng thư mục
### Section 3.1: Absolute vs relative directories(Thư mục tuyệt đối và tương đối)
Để thay đổi thành một thư mục được chỉ định tuyệt đối, hãy sử dụng toàn bộ tên, bắt đầu bằng dấu gạch chéo /
```
cd /home/username/project/abc
```
Nếu bạn muốn thay đổi một thư mục gần hiện tại của bạn, bạn có thể chỉ định một vị trí tương đối.

Ví dụ: nếu bạn đã ở trong `/home/username`, bạn có thể nhập thư mục con `project`
```
[root@localhost hieu]# pwd
/home/hieu
[root@localhost hieu]# cd project
[root@localhost project]# pwd
/home/hieu/project
```

Nếu bạn muốn đi đến thư mục phía trên thư mục hiện tại, bạn có thể sử dụng bí danh `..`
```
[root@localhost project]# pwd
/home/hieu/project
[root@localhost project]# cd ..
[root@localhost hieu]# pwd
/home/hieu
```
Điều này cũng có thể được gọi là đi "lên" một thư mục.

### Section 3.2: Change to the last directory(Thay đổi thư mục cuối cùng)
Đối với trình `shell` hiện tại, điều này sẽ đưa bạn đến thư mục trước đó mà bạn đã ở đó, bất kể nó ở đâu
```
[root@localhost hieu]# cd -
/home/hieu/project
[root@localhost project]#
```
Nếu sử dụng liên tục nó sẽ đưa bạn đến 2 thư mục mà bạn đã sử dụng lần cuối cùng.

### Section 3.3: Change to the home directory(Thay đổi thư mục chính)
Thư mục mặc định là thư mục chính. Vì vậy `cd` không có bất kỳ thư mục nào sẽ đưa bạn đến thư mục chính của user đó
```
[hieu@localhost etc]$ pwd
/etc
[hieu@localhost etc]$ cd
[hieu@localhost ~]$ pwd
/home/hieu
```

Thư mục mặc định làm việc là thường là thư mục /root/ đối với user root:
```
[root@localhost ~]# echo $HOME
/root
```
Thư mục /home/username/ đối với user hiện tại đang thực thi.
```
[hieu@localhost ~]$ echo $HOME
/home/hieu
```
Biến $HOME là biến môi trường biểu thị thư mục của người dùng hiện tại.

### Section 3.4: Change to the Directory of the Script(Thay đổi đối với Thư mục của script)
Có hai loại bash script:
  * System tools - Các công cụ hệ thống hoạt động từ thư mục làm việc hiện tại
  * Project tools - Công cụ dự án sửa đổi tệp liên quan đến vị trí của chúng trong hệ thống tệp
Đối với loại script thứ hai, sẽ hữu ích khi thay đổi thành thư mục nơi script được lưu trữ. Điều này có thể được thực hiện bằng lệnh sau:
```
cd "$(dirname "$(readlink -f "$0")")"
```

Lệnh này chạy 3 lệnh:
  1. `readlink -f "$0"` xác định đường dẫn đến tập lệnh hiện tại ($0)
  2. `dirname` chuyển đổi đường dẫn đến script thành đường dẫn đến thư mục của nó
  3. `cd` thay đổi thư mục công việc hiện tại thành thư mục mà nó nhận được từ dirname

```
[root@localhost ~]# cd /etc
[root@localhost etc]# cd "$(dirname "$(readlink -f "/root/hello.sh")")"
[root@localhost ~]# pwd
/root
[root@localhost ~]# ls
anaconda-ks.cfg  hello.sh
```

