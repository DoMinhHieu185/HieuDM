#  ps - Liệt kê các quy trình
### 1. Notes
```
ps [-AaCcEefhjlMmrSTvwXx]
   [-O fmt | -o fmt]
   [-G gid [,gid...]]
   [-g grp [,grp...]]
   [-u uid [,uid...]]
   [-p pid [,pid...]]
   [-t tty [,tty...]] [-U user [,user...]]
```
Đối với các quy trình đã được chọn để hiển thị, thông tin mặc định để hiển thị bao gồm:

ID quy trình (PID), thiết bị đầu cuối điều khiển (TTY), thời gian CPU mà quy trình đã sử dụng và lệnh liên quan.

Lệnh ps hỗ trợ ba loại tùy chọn khác nhau:
* Tùy chọn kiểu Unix: chúng được đặt trước bởi một ký tự gạch ngang (-f, ...).
* Tùy chọn kiểu BSD: chúng không đứng trước ký tự gạch ngang (x, ...).
* Các tùy chọn dài GNU: chúng được đặt trước bởi các ký tự gạch ngang kép (--forest, ...).

Đây là danh sách một số header được hiển thị bằng lệnh ps:
* UID: người dùng đã bắt đầu process.
* PID: ID process.
* PPID: ID process của process gốc.
* C: việc sử dụng bộ xử lý.
* STIME: thời gian hệ thống bắt đầu process.
* TTY: thiết bị đầu cuối bắt đầu process.
* TIME: tổng thời gian cần thiết để chạy process.
* CMD: lệnh bắt đầu process.

Các tiêu đề bổ sung có thể được hiển thị với tùy chọn -l:
* F: cờ hệ thống được kernel gán cho tiến trình.
* S: trạng thái của tiến trình (O: đang chạy, S: đang ngủ, R: có thể chạy được, Z: zombie, T: đã dừng lại).
* PRI: mức độ ưu tiên của process(số thấp hơn có nghĩa là mức độ ưu tiên cao hơn).
* NI: giá trị tốt đẹp.
* ADDR: địa chỉ bộ nhớ của process.
* SZ: không gian hoán đổi theo yêu cầu của process.
* WCHAN: địa chỉ của kernel nơi process đang ngủ.

Tùy chọn kiểu BSD sẽ hiển thị một tiêu đề đặc biệt STAT hiển thị tình trạng của quá trình sử dụng hai ký tự:
* Ký tự đầu tiên hiển thị trạng thái của quá trình (O: đang chạy, S: đang ngủ, R: có thể chạy được, Z: zombie, T: đã dừng lại).
* Ký tự thứ hai hiển thị trạng thái của quá trình:
  * <: quá trình đang chạy ở mức ưu tiên cao.
  * N: tiến trình đang chạy ở mức ưu tiên thấp.
  * L: tiến trình có các trang bị khóa trong bộ nhớ.
  * s: tiến trình là một người dẫn đầu phiên.
  * l: quy trình đa luồng.
  * +: tiến trình đang chạy ở phía trước.

### 2. Examples
Liệt kê các process thuộc về người dùng hiện tại và đang chạy trên thiết bị đầu cuối hiện tại
  * Đầu ra mặc định
```
[root@localhost ~]# ps
   PID TTY          TIME CMD
  1802 pts/1    00:00:00 bash
  1957 pts/1    00:00:00 ps
```
  * Định dạng đầy đủ:
```
[root@localhost ~]# ps -f
UID         PID   PPID  C STIME TTY          TIME CMD
root       1802   1794  0 13:29 pts/1    00:00:00 -bash
root       2001   1802  0 14:34 pts/1    00:00:00 ps -f
```
  * Định dạng dài (tùy chọn kiểu Unix)
```
[root@localhost ~]# ps -l
F S   UID    PID   PPID  C PRI  NI ADDR SZ WCHAN  TTY          TIME CMD
4 S     0   1802   1794  0  80   0 - 28886 do_wai pts/1    00:00:00 bash
0 R     0   2002   1802  0  80   0 - 38337 -      pts/1    00:00:00 ps
```
  * Định dạng dài (tùy chọn kiểu BSD)
```
[root@localhost ~]# ps l
F   UID    PID   PPID PRI  NI    VSZ   RSS WCHAN  STAT TTY        TIME COMMAND
4     0   1244    671  20   0 115540  1980 n_tty_ Ss+  tty1       0:00 -bash
4     0   1268   1260  20   0 115544  2040 n_tty_ Ss+  pts/0      0:00 -bash
4     0   1802   1794  20   0 115544  2044 do_wai Ss   pts/1      0:00 -bash
0     0   2004   1802  20   0 153348  1488 -      R+   pts/1      0:00 ps l
```
* Liệt kê các quy trình thuộc về người dùng hiện tại bao gồm các quy trình không có thiết bị đầu cuối được chỉ định
```
[root@localhost ~]# ps x
   PID TTY      STAT   TIME COMMAND
     1 ?        Ss     0:02 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
     2 ?        S      0:00 [kthreadd]
     4 ?        S<     0:00 [kworker/0:0H]
     5 ?        S      0:00 [kworker/u256:0]
     6 ?        S      0:00 [ksoftirqd/0]
     7 ?        S      0:00 [migration/0]
     8 ?        S      0:00 [rcu_bh]
     9 ?        R      0:00 [rcu_sched]
    10 ?        S<     0:00 [lru-add-drain]
```
* Hiển thị hệ thống phân cấp các quy trình (mối quan hệ giữa các quy trình được vẽ bằng các ký tự ASCII)
```
[root@localhost ~]# ps x --forest
   PID TTY      STAT   TIME COMMAND
     2 ?        S      0:00 [kthreadd]
     4 ?        S<     0:00  \_ [kworker/0:0H]
     5 ?        S      0:00  \_ [kworker/u256:0]
     6 ?        S      0:00  \_ [ksoftirqd/0]
     7 ?        S      0:00  \_ [migration/0]
     8 ?        S      0:00  \_ [rcu_bh]
     9 ?        R      0:00  \_ [rcu_sched]
    10 ?        S<     0:00  \_ [lru-add-drain]
```
* Liệt kê tất cả các quy trình
```
[root@localhost ~]#  ps -e
   PID TTY          TIME CMD
     1 ?        00:00:02 systemd
     2 ?        00:00:00 kthreadd
     4 ?        00:00:00 kworker/0:0H
     5 ?        00:00:00 kworker/u256:0
```
cách khác
```
[root@localhost ~]# ps -A
   PID TTY          TIME CMD
     1 ?        00:00:02 systemd
     2 ?        00:00:00 kthreadd
     4 ?        00:00:00 kworker/0:0H
```
* Danh sách PID processes:
```
[root@localhost ~]# ps | grep bash | grep -v grep | awk '{print $1}'
1802

[root@localhost ~]# ps | grep bash | grep -v grep | awk {'print $1 " " $2 " " $3 " " $4 " " $5 '}
1802 pts/1 00:00:00 bash
```
* Kill processes
```
[root@localhost ~]# for pid in `ps -e -f | grep mongodb | grep -v grep | awk '{print $2}'`; do kill -9 $pid; done
```
