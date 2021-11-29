# Công việc và quy trình
### Section 8.1: Job handling(Xử lý công việc)
**Creating jobs**
Để tạo một job, chỉ cần thêm một & sau lệnh. `&` không phải là một tham số cho chương trình. Nó cho shell. `& `là chạy chương trình ở chế độ nền trong shell.
```
[root@localhost ~]# sleep 50 &
[1] 1294
```
Ví dụ trên là thực hiện sleep trong 50. Nếu không có & thì sau 50 giây bạn mới thực hiện được câu lệnh tiếp còn nếu có & ở cuối cùng thì bạn có thể thực hiện lệnh ngay lập tức.
* [1] Là thứ tự job đang thực hiện
* 1294 là PID- Process ID
Bạn có thể thực hiện một lệnh tiếp theo mà không cần đợi job thực hiện xong bằng tổ hợp phím `Ctrl + Z`.
```
[root@localhost ~]# sleep 50
^Z
[1]+  Stopped                 sleep 50
```

**Background and foreground a process(Bối cảnh và tiền cảnh một quá trình)**
Để đưa một process lên ưu tiên chạy trước, lệnh fg được sử dụng cùng với %
```
[root@localhost ~]# sleep 50 &
[2] 1303
[root@localhost ~]# fg %1
sleep 50
```
Để đưa nó trở lại nền, bạn có thể sử dụng lệnh `bg`. Do phiên đầu cuối bị chiếm dụng, trước tiên bạn cần dừng quá trình bằng cách nhấn `Ctrl + z`.
```
[root@localhost ~]# sleep 300
^Z
[5]+  Stopped                 sleep 300
[root@localhost ~]# bg %5
[5]+ sleep 300 &
```
* bg %5 #thực hiện tiếp job[5]

Lệnh job để biết hiện tại có các `job` lại đang làm việc hoặc đang bị hoãn:
```
[root@localhost ~]# jobs
[1]   Running                 sleep 400 &
[2]-  Running                 sleep 300 &
[3]+  Stopped                 sleep 200
```

**Killing running jobs**
```
[root@localhost ~]# jobs
[1]   Running                 sleep 400 &
[2]-  Running                 sleep 300 &
[3]+  Stopped                 sleep 200
[root@localhost ~]# kill %1
[root@localhost ~]# jobs
[1]   Terminated              sleep 400
[2]-  Running                 sleep 300 &
[3]+  Stopped                 sleep 200
```
Tiến trình `sleep` chạy trong nền với id quy trình (pid) 1396 và số job 1. Để tham chiếu tiến trình, bạn có thể sử dụng pid hoặc số công việc. Nếu bạn sử dụng số công việc, bạn phải bắt đầu bằng `%`. Tín hiệu `kill` mặc định là SIGTERM, cho phép tiến trình đích thoát ra một cách không ảnh hưởng.

Một số tín hiệu của lệnh kill phổ biến. Để xem đầy đủ sử dụng `kill -l`
|Signal name |Signal name |Hiệu ứng|
|-|-|-|
|SIGHUP|1|hangup|
|SIGINT|2|Ngắt từ bàn phím|
|SIGKILL|9|kill signal|
|SIGTERM|15|terminal signal|

**Start and kill specific processes(Bắt đầu và kết thúc các quy trình cụ thể)**
Có lẽ đây là các để kill một process đang chạy là chọn nó thông qua tên process

`pkill -f test.sh`

Hoặc một cách chi tiết hơn bằng cách sử dụng pgrep để kiếm PID thực tế:

`kill $(pgrep -f 'bash test.sh')`

Một cách tương tự có thể đạt được bằng cách sử dụng `grep` với lệnh `ps -ef | grep name_process` sau đó kill process được liệt kê ra.

### Section 8.2: Check which process running on specific port(Kiểm tra process nào đang chạy trên cổng cụ thể)
Để kiểm tra quá trình nào đang chạy trên cổng cụ thể 22 
```
[root@localhost ~]# lsof -i :22
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
sshd     980 root    3u  IPv4  19894      0t0  TCP *:ssh (LISTEN)
sshd     980 root    4u  IPv6  19904      0t0  TCP *:ssh (LISTEN)
sshd    1245 root    3u  IPv4  20851      0t0  TCP localhost.localdomain:ssh->192.168.122.1:51763 (ESTABLISHED)
sshd    1249 root    3u  IPv4  20916      0t0  TCP localhost.localdomain:ssh->192.168.122.1:51764 (ESTABLISHED)
sshd    1621 root    3u  IPv4  23389      0t0  TCP localhost.localdomain:ssh->192.168.122.1:55338 (ESTABLISHED)
sshd    1625 root    3u  IPv4  23459      0t0  TCP localhost.localdomain:ssh->192.168.122.1:55339 (ESTABLISHED)
```

### Section 8.3: Disowning background job(Từ chối background job)
`disown %[job]` Điều này cho phép một process thoát khỏi job.
* Điều này cho phép một quá trình chạy dài tiếp tục sau khi trình shell của bạn (terminal, ssh, v.v.) bị đóng.

### Section 8.4: List Current Jobs(Liệt kê công việc hiện tại)
Lệnh job để biết hiện tại có các `job` lại đang làm việc hoặc đang bị hoãn:
```
[root@localhost ~]# jobs
[1]   Running                 sleep 400 &
[2]-  Running                 sleep 300 &
[3]+  Stopped                 sleep 200
```

### Section 8.5: Finding information about a running process(Tìm kiếm thông tin về một quy trình đang chạy)
`ps aux | grep <search-term>` Hiển thị các quy trình phù hợp với cụm từ tìm kiếm.
```
[root@localhost ~]# ps aux | grep httpd
root       1770  0.0  0.0 112812   976 pts/1    R+   14:38   0:00 grep --color=auto httpd
```
Ở đây, cột thứ hai là id quy trình.

### Section 8.6: List all processes(Liệt kê tất cả các quy trình)
Các hai cách phổ biến để liệt kê tất cả các quy trình trên một hệ thống. Liệt kê tất cả các process đang chạy bởi tất cả người dùng chúng khác nhau về định dạng mà chúng xuất ra
* `ps -ef`
* `ps aux`
