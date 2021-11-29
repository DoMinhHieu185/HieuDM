#  top -- Hiển thị processes
### 1. Notes
Cách dùng 
```
top -hv | -bcHiOSs -d secs -n max -u|U user -p pid(s) -o field -w [cols]
```
* Lệnh `top` hiển thị thông tin tóm tắt hệ thống được sắp xếp trên 5 khu vực.
* Khu vực đầu tiên hiển thị thời gian hiện tại, thời gian kể từ lần khởi động cuối cùng, tổng số người dùng, tải trung bình của hệ thống trong 1, 5 và 15 phút qua.
* Khu vực thứ hai hiển thị số lượng tiến trình và bao nhiêu tiến trình đang chạy, đang ngủ, đã dừng, thây ma.
* Các khu vực cuối cùng hiển thị thông tin về CPU, bộ nhớ vật lý và bộ nhớ hoán đổi.

Lệnh `top` cũng hiển thị danh sách chi tiết của tất cả các tiến trình đang chạy.

Theo mặc định, danh sách cung cấp các header sau:
* PID: id quy trình.
* USER: chủ sở hữu của quá trình.
* PR: mức độ ưu tiên của quy trình.
* NI: giá trị tốt đẹp của quá trình.
* VIRT: bộ nhớ ảo được sử dụng bởi tiến trình.
* RES: bộ nhớ vật lý được sử dụng bởi quá trình.
* SHR: bộ nhớ được chia sẻ với các tiến trình khác.
* S: trạng thái của tiến trình (D: ngủ liên tục, R: đang chạy, S: đang ngủ, T: dừng bởi tín hiệu điều khiển công việc, t: dừng bởi trình gỡ lỗi trong quá trình theo dõi, Z: zombie).
* % CPU: tỷ lệ thời gian CPU mà quá trình đang khởi kiện.
* % MEM: phần bộ nhớ vật lý mà quá trình đang khởi kiện.
* TIME +: thời gian CPU được sử dụng bởi tiến trình.
* COMMAND: dòng lệnh được sử dụng để bắt đầu quá trình

### 2. Examples
```
[root@localhost ~]# top
top - 15:09:01 up  4:33,  3 users,  load average: 0.00, 0.01, 0.05
Tasks: 101 total,   1 running, 100 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem :   995684 total,   701044 free,   178324 used,   116316 buff/cache
KiB Swap:  2097148 total,  2097148 free,        0 used.   683876 avail Mem

   PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
   984 root      20   0  574300  17436   6136 S  0.3  1.8   0:02.61 tuned
     1 root      20   0  128048   6624   4144 S  0.0  0.7   0:02.27 systemd
     2 root      20   0       0      0      0 S  0.0  0.0   0:00.01 kthreadd
     4 root       0 -20       0      0      0 S  0.0  0.0   0:00.00 kworker/0:0H
     5 root      20   0       0      0      0 S  0.0  0.0   0:00.09 kworker/u256:0
```
* Theo mặc định, danh sách được sắp xếp bằng cách sử dụng cột % CPU.
* Để thay đổi tiêu đề (thêm hoặc bớt) và / hoặc điều chỉnh cột sắp xếp, hãy nhấn phím 'f'.
Điều hướng bằng Up / Dn.
* Nhấn phím 'd' hoặc <dấu cách> để thêm hoặc xóa tiêu đề.
* Nhấn phím 's' để áp dụng các thay đổi.
* Nhấn phím 'q' hoặc <esc> để thoát.