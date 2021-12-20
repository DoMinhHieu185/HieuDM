# Sử dụng "trap" để phản ứng lại tín hiệu và sự kiện hệ thống
|Tham số|Ý nghĩa|
|-|-|
|-p|Danh sách các bẫy hiện đã được cài đặt|
|-l|Liệt kê tên tín hiệu và số tương ứng|
### Section 47.1: Introduction: clean up temporary files(Giới thiệu: dọn dẹp các tệp tạm thời)
Bạn có thể sử dụng lệnh trap để "bẫy" tín hiệu; đây là shell tương đương với lệnh gọi signal() hoặc sigaction() trong C và hầu hết các ngôn ngữ lập trình khác để bắt tín hiệu.

Một trong những cách sử dụng phổ biến nhất của trap là dọn dẹp các tệp tạm thời trên cả lần thoát dự kiến và không mong muốn.
```
#!/bin/sh
# Tạo chức năng dọn dẹp
cleanup() {
 rm --force -- "${tmp}"
}
# Trap nhóm "EXIT" đặc biệt, Nhóm này luôn chạy khi thoát khỏi shell.
trap cleanup EXIT
# Tạo tệp tạm thời
tmp="$(mktemp -p /tmp tmpfileXXXXXXX)"
echo "Hello, world!" >> "${tmp}"
# Không cần rm -f "$tmp". Ưu điểm của việc sử dụng EXIT là nó vẫn hoạt động
# Ngay cả khi có lỗi hoặc nếu bạn đã sử dụng thoát..
```

### Section 47.2: Catching SIGINT or Ctl+C(Bắt SIGINT hoặc ctrl+C)
Bẫy được reset cho các subshell, vì vậy chế độ sleep sẽ vẫn hoạt động trên tín hiệu SIGINT được gửi bởi ^C(thường là thoát), Nhưng quy trình cha (tức tệp lệnh shell) sẽ không.
```
#!/bin/sh
# Chạy lệnh trên 2 tín hiệu (SIGINT, ^C gửi)
sigint() {
 echo "Killed subshell!"
}
trap sigint INT
# Hoặc sử dụng no-op để không có đầu ra
#trap : INT
# Điều này sẽ bị kill vào lần đầu tiên ^C
echo "Sleeping..."
sleep 500
echo "Sleeping..."
sleep 500
```

### Section 47.3: Accumulate a list of trap work to run at exit(Tích lũy danh sách các công việc trap để chạy khi thoát)
Bạn đã bao giờ quên thêm một trap để dọn dẹp tệp tam thời hoặc làm công việc khác khi thoát?

Bạn đã bao giờ đặt một cái trap mà hủy một trap khác chưa?

Code này giúp bạn dễ dàng thêm những việc cần làm khi thoát từng mục một, thay vì có một cái trap lớn câu lệnh ở đâu đó trong đoạn mã của bạn, có thể dễ bị quên.
```
# on_exit and add_on_exit
# Usage:
# add_on_exit rm -f /tmp/foo
# add_on_exit echo "I am exiting"
# tempfile=$(mktemp)
# add_on_exit rm -f "$tempfile"
# Based on http://www.linuxjournal.com/content/use-bash-trap-statement-cleanup-temporary-files
function on_exit()
{
 for i in "${on_exit_items[@]}"
 do
 eval $i
 done
}
function add_on_exit()
{
 local n=${#on_exit_items[*]}
 on_exit_items[$n]="$*"
 if [[ $n -eq 0 ]]; then
 trap on_exit EXIT
 fi
}
```

### Section 47.4: Killing Child Processes on Exit(Xử lý kill process con khi thoát)
Biểu thức trap không nhất thiết phải là các hàm hoặc chương trình riêng lẻ, chúng cũng có thể là các biểu thức phức tạp hơn

Bằng cách kết hợp `jobs -p` và `kill`, để kill tất cả cac process con đã sinh ra của shell khi thoát:
```
trap 'jobs -p | xargs kill' EXIT
```

### Section 47.5: react on change of terminals window size(Phản ứng khi thay đổi kích thước cửa sổ thiết bị đầu cuối)
Có một tín hiệu WINCH ( WINdowCHange), tín hiệu này được kích hoạt khi một người thay đổi kích thước của sổ terminal
```
declare -x rows cols
update_size(){
    rows=$(tput lines) # get actual lines of term
    cols=$(tput cols) # get actual columns of term
    echo DEBUG terminal window has no $rows lines and is $cols characters wide
}
trap update_size WINCH
```
