# Quản lý tiến trình
### Examining Process Lists(Kiểm tra danh sách quy trình)
Tại bất kỳ thời điểm nào, rất nhiều chương trình đang hoạt động đang chạy trên hệ thống Linux. Linux gọi mỗi chương trình đang chạy là một tiến trình. Hệ thống Linux gán cho mỗi tiến trình một ID tiến trình (PID) và quản lý cách tiến trình sử dụng bộ nhớ và thời gian CPU dựa trên PID đó.

Khi hệ thống Linux khởi động lần đầu tiên, nó bắt đầu một quá trình đặc biệt gọi là quá trình `init`. Quá trình `init` là cốt lõi của hệ thống Linux; nó chạy các script khởi động tất cả các quy trình khác đang chạy trên hệ thống, bao gồm các quy trình khởi động bảng điều khiển văn bản và cửa sổ đồ họa mà bạn sử dụng để đăng nhập

#### Viewing Processes with ps(Xem các quá trình với ps)
Bạn có thể xem các quy trình hiện đang chạy trên hệ thống Linux bằng cách sử dụng lệnh `ps`
```
[root@localhost ~]# ps
   PID TTY          TIME CMD
  1248 pts/0    00:00:00 bash
  1336 pts/0    00:00:00 ps
```
Theo mặc định, chương trình ps chỉ hiển thị các tiến trình đang chạy trong trình shell người dùng hiện tại. Trong ví dụ này, chúng ta chỉ có trình shell chạy (Bash) và tất nhiên là lệnh `ps`.

Đầu ra cơ bản của lệnh ps hiển thị PID được gán cho mỗi quá trình, thiết bị đầu cuối (TTY) mà chúng đã được bắt đầu từ đó và thời gian CPU mà quá trình đã sử dụng.

Xem mọi tiến trình đang chạy trên hệ thống sử dụng option `-ef`:
```
[root@localhost ~]# ps -ef
UID         PID   PPID  C STIME TTY          TIME CMD
root          1      0  0 11:46 ?        00:00:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
root          2      0  0 11:46 ?        00:00:00 [kthreadd]
root          4      2  0 11:46 ?        00:00:00 [kworker/0:0H]
root          5      2  0 11:46 ?        00:00:00 [kworker/u256:0]
root          6      2  0 11:46 ?        00:00:00 [ksoftirqd/0]
root          7      2  0 11:46 ?        00:00:00 [migration/0]
root          8      2  0 11:46 ?        00:00:00 [rcu_bh]
root          9      2  0 11:46 ?        00:00:00 [rcu_sched]
root         10      2  0 11:46 ?        00:00:00 [lru-add-drain]
root         11      2  0 11:46 ?        00:00:00 [watchdog/0]
root         13      2  0 11:46 ?        00:00:00 [kdevtmpfs]
root         14      2  0 11:46 ?        00:00:00 [netns]
...
```
* UID: Người dùng chạy tiến trình
* PID: ID của tiến trình
* PPID: ID của tiến trình mẹ nếu nó được sinh ra từ tiến trình khác
* C: The processor utilization over the lifetime of the process
* STIME: Thời gian hệ thống bắt đầu tiến trình
* TTY: Thiết bị đầu cuối mà từ đó tiến trình được bắt đầu
* TIME: Thời gian chuẩn bị cpu cần thiết để chạy tiến trình
* CMD: Tên chương trình bắt đầu tiến trình này

#### Understanding Process States(Hiểu các trạng thái của quy trình)
Các quá trình được hoán đổi vào bộ nhớ ảo được gọi là quá trình ngủ. Thường thì hạt nhân Linux đặt một tiến trình vào chế độ ngủ trong khi tiến trình này đang đợi một sự kiện.

Khi sự kiện kích hoạt, hạt nhân sẽ gửi tín hiệu cho quá trình. Nếu quá trình ở chế độ ngủ gián đoạn, nó sẽ nhận được tín hiệu ngay lập tức và thức dậy. Nếu quá trình ở chế độ ngủ liên tục, nó chỉ thức dậy dựa trên một sự kiện bên ngoài, chẳng hạn như phần cứng trở nên khả dụng. Nó sẽ lưu bất kỳ tín hiệu nào khác được gửi khi nó đang ngủ và hoạt động trên chúng khi nó thức dậy.

Nếu một quy trình đã kết thúc nhưng quy trình mẹ của nó không thừa nhận tín hiệu kết thúc vì nó đang ngủ, thì quy trình đó được coi là một thây ma. Nó bị mắc kẹt trong trạng thái lấp lửng giữa chạy và kết thúc cho đến khi quy trình chính xác nhận tín hiệu kết thúc.

#### Selecting Processes with ps(Chọn các quy trình với ps)
Xem process của user:
```
[root@localhost ~]# ps -u postfix
   PID TTY          TIME CMD
  1150 ?        00:00:00 qmgr
  1687 ?        00:00:00 pickup
```

#### Viewing Processes with top(Xem các tiến trình với top)
Sử dụng lệnh top để có thểm thông tin về các tiến trình đang chạy, nó được update real-time
```
[root@localhost ~]# top
top - 14:01:48 up  2:15,  1 user,  load average: 0.00, 0.01, 0.05
Tasks:  96 total,   1 running,  95 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :   995684 total,   714960 free,   168056 used,   112668 buff/cache
KiB Swap:  2097148 total,  2097148 free,        0 used.   696016 avail Mem

   PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
     1 root      20   0  128048   6592   4144 S  0.0  0.7   0:02.02 systemd
     2 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kthreadd
     4 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kworker/0:0H
     5 root      20   0       0      0      0 S  0.0  0.0   0:00.22 kworker/u256:0
     6 root      20   0       0      0      0 S  0.0  0.0   0:00.07 ksoftirqd/0
     7 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 migration/0
     8 root      20   0       0      0      0 S  0.0  0.0   0:00.00 rcu_bh
     9 root      20   0       0      0      0 S  0.0  0.0   0:00.71 rcu_sched
    10 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 lru-add-drain
    11 root      rt   0       0      0      0 S  0.0  0.0   0:00.04 watchdog/0
    13 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kdevtmpfs
    14 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 netns
    15 root      20   0       0      0      0 S  0.0  0.0   0:00.00 khungtaskd
    16 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 writeback
    17 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kintegrityd
    18 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 bioset
    19 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 bioset
    20 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 bioset
    21 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kblockd
    22 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 md
    23 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 edac-poller
    24 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 watchdogd
    30 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kswapd0
    31 root      25   5       0      0      0 S  0.0  0.0   0:00.00 ksmd
```
* Dòng đầu tiên hiển thị thời gian hiện tại, hệ thống đã hoạt động trong bao lâu, số lượng người dùng đã đăng nhập và tải trung bình trên hệ thống.
* Dòng thứ hai của tiện ích hàng đầu hiển thị thông tin quy trình chung (được gọi là các tác vụ ở trên cùng): có bao nhiêu quy trình đang chạy, đang ngủ, đã dừng hoặc ở trạng thái thây ma.
* Dòng tiếp theo hiển thị thông tin chung về CPU. Màn hình `top` chia việc sử dụng CPU thành nhiều loại tùy thuộc vào chủ sở hữu của tiến trình (người dùng so với tiến trình hệ thống) và trạng thái của tiến trình (đang chạy, không hoạt động hoặc chờ đợi).
* Sau đó, trong đầu ra của tiện ích `top` có hai dòng trình bày chi tiết trạng thái của bộ nhớ hệ thống. Dòng đầu tiên hiển thị trạng thái của bộ nhớ vật lý trong hệ thống, tổng bộ nhớ còn lại, dung lượng hiện đang được sử dụng và dung lượng còn trống. Dòng bộ nhớ thứ hai hiển thị trạng thái của vùng bộ nhớ hoán đổi trong hệ thống (nếu có cài đặt), cùng một thông tin.
* Cuối cùng, phần tiếp theo tiện ích `top` hiển thị danh sách chi tiết các quy trình hiện đang chạy, với một số cột thông tin trông quen thuộc từ đầu ra lệnh ps:
  * PID: ID của tiến trình
  * USER:Tên người dùng của chủ sở hữu quy trình
  * PR: Mức độ ưu tiên của tiến trình
  * NI: Giá trị tốt đẹp của tiến trình
  * VIRT: Tổng dung lượng bộ nhớ ảo được sử dụng bởi quá trình
  * RES: Dung lượng bộ nhớ vật lý mà quá trình đang sử dụng
  * SHR: Dung lượng bộ nhớ mà quy trình đang chia sẻ với các quy trình khác
  * S: Trạng thái quá trình (D = ngủ gián đoạn, I = nhàn rỗi, R = đang chạy, S = ngủ, T = theo dõi hoặc dừng, và Z = xác sống)
  * % CPU: Tỷ lệ thời gian CPU mà quá trình đang sử dụng
  * % MEM: Chia sẻ bộ nhớ vật lý khả dụng mà quá trình đang sử dụng
  * TIME +: Tổng thời gian CPU mà quá trình đã sử dụng kể từ khi bắt đầu
  * COMMAND: Tên dòng lệnh của quá trình (chương trình đã bắt đầu)

Theo mặc định, khi bạn bắt đầu `top`, nó sẽ sắp xếp các quá trình dựa trên giá trị% CPU.

Sử dụng lệnh free để xem trạng thái ram của hệ thống
```
[root@localhost ~]# free -h
              total        used        free      shared  buff/cache   available
Mem:           972M        161M        705M        7.6M        105M        684M
Swap:          2.0G          0B        2.0G
```

### Employing Multiple Screens(Sử dụng nhiều màn hình)
`screen` command cho phép tạo cửa sổ làm việc. Khi đăng nhập ssh vào linux, hãy gõ `screen`, 1 cửa sổ làm việc sẽ được tạo.

### Understanding Foreground and Background Processes(Hiểu các quy trình tiền cảnh và hậu cảnh)
#### Sending a Job to the Background(Gửi một job đến nền)
Chạy một chương trình ở chế độ nền là một điều khá dễ thực hiện; chỉ cần đặt một ký hiệu và (&) sau lệnh.
```
[root@localhost ~]# sleep 200 &
[1] 45968
[root@localhost ~]# jobs
[1]+  Running                 sleep 200 &
```

#### Sending Multiple Jobs to the Background(Gửi nhiều job xuống nền)
#### Bringing Jobs to the Foreground(Đưa job lên làm trước)
Lệnh `fg` đứa job ở chế độ nền sang chế độ nền trước
* Cú pháp:
```
fg %[job number]
```

#### Sending a Running Program to the Background(Gửi chương trình đang chạy xuống nền)
Nếu bạn đã khởi động một chương trình ở chế độ nền trước và nhận thấy rằng sẽ mất một lúc để chạy, bạn vẫn có thể gửi chương trình đó sang chế độ nền. Đầu tiên, bạn phải tạm dừng quá trình bằng tổ hợp phím `Ctrl + Z`; điều này sẽ dừng (tạm dừng) chương trình và gán cho nó một job number.
Sau khi bạn có số công việc của chương trình bị tạm dừng, hãy sử dụng lệnh `bg` để gửi nó xuống nền
```
[root@localhost ~]# sleep 200
^Z
[1]+  Stopped                 sleep 200
[root@localhost ~]# bg %1
[1]+ sleep 200 &
```

#### Stopping a Job(Dừng một công việc)
Dùng lệnh `kill` để dừng job chạy nền
* Cú pháp
```
kill %[job number]
```

#### Keeping a Job Running after Logout(Giữ một công việc đang chạy sau khi đăng xuất)
Sử dụng lệnh `nohup` để giữ công việc chạy khi tắt máy hoặc treo máy

### Managing Process Priorities
Các lệnh `nice` và `renice` cho phép bạn thiết lập và thay đổi mức độ đẹp(nice level) của chương trình, từ đó điều chỉnh mức độ ưu tiên được hệ thống gán cho một ứng dụng. Lệnh `nice` cho phép bạn khởi động ứng dụng với cài đặt mức độ đẹp không mặc định. Định dạng trông như thế này:
```
nice -n VALUE COMMAND
```
* Tham số VALUE là một giá trị số từ –20 đến 19. Số càng thấp, mức độ ưu tiên cao hơn mà quá trình nhận được. Mức độ đẹp mặc định là không.
* Đối số COMMAND cho biết chương trình phải bắt đầu ở mức độ đẹp đã chỉ định.
* Để thay đổi mức độ ưu tiên của quá trình đang chạy, hãy sử dụng lệnh `renice`
```
renice PRIORITY [-p PIDS] [-u USERS] [-g GROUPS]
```
* Lệnh renice cho phép bạn thay đổi mức độ ưu tiên của nhiều quy trình dựa trên danh sách các giá trị PID, tất cả các quy trình được bắt đầu bởi một hoặc nhiều người dùng hoặc tất cả các quy trình được bắt đầu bởi một hoặc nhiều nhóm

### Sending Signals to Processes(Gửi tín hiệu đến các quá trình)
#### Sending Signals with the kill Command(Gửi tín hiệu bằng lệnh kill)
Sử dụng `kill -l` để liệt kê các tín hiệu. 

```
root@ubuntu18:~# kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```

ta có thể sử dụng cách kill tín hiệu để ngăn tín hiệu được gửi đi. 

VD: 

```
kill SIGNAL PID
```
Trong đó `SIGNAL` là tín hiệu được gửi đi và PID là id của tiến trình sẽ bị loại bỏ.


Để loại bỏ hoàn toàn 1 tiến trình, sử dụng `kill -9 PID`

vd: 

```
[root@centos7 ~]# ps -u postfix
  PID TTY          TIME CMD
 1137 ?        00:00:00 qmgr
 5750 ?        00:00:00 pickup
```
```
[root@centos7 ~]# kill -9 1137
```
```
[root@centos7 ~]# ps -u postfix
  PID TTY          TIME CMD
 5750 ?        00:00:00 pickup
```
