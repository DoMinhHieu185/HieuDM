# ls -- list directory contents
### 1. Notes
```
ls file....
```
* Đối với tệp, ls hiển thị tên và thông tin của từng tệp.
* Đối với thư mục, ls hiển thị tên và thông tin của tệp / thư mục chứa trong mỗi thư mục.
* Nếu không có tệp / thư mục nào được cung cấp, nội dung của thư mục hiện tại sẽ được hiển thị.
* Nếu có nhiều tệp / thư mục, các tệp sẽ được hiển thị trước tiên.

### 2. Examples
* (Tùy chọn -1) Liệt kê tên của từng tệp và thư mục trong một dòng:
```
[root@localhost ~]# ls -1 ~/folder
folder1
folder2
```
* Liệt kê tên và thông tin của từng tệp và thư mục (bao gồm ".", ".." và các tệp và thư mục bắt đầu bằng ".")
```
[root@localhost ~]# ls -al ~/folder
total 4
drwxr-xr-x. 4 root root   36 Nov 19 14:35 .
dr-xr-x---. 4 root root 4096 Nov 19 15:18 ..
drwxr-xr-x. 2 root root    6 Nov 19 14:35 folder1
drwxr-xr-x. 2 root root    6 Nov 19 14:35 folder2
```
  > Lưu ý: đối với một thư mục, số byte (ví dụ: 4096) thể hiện kích thước của tệp meta chứa thông tin về thư mục. Nó không cung cấp bất kỳ thông tin nào về kích thước thực của các tệp và thư mục trong thư mục đó.
* Liệt kê các tệp và thông tin thư mục con với nội dung của chúng (bao gồm ".", ".." và các tệp và thư mục bắt đầu bằng ".")
```
[root@localhost ~]# ls -al ~/folder/*
/root/folder/folder1:
total 0
drwxr-xr-x. 2 root root  6 Nov 19 14:35 .
drwxr-xr-x. 4 root root 36 Nov 19 14:35 ..

/root/folder/folder2:
total 0
drwxr-xr-x. 2 root root  6 Nov 19 14:35 .
drwxr-xr-x. 4 root root 36 Nov 19 14:35 ..
```
* (Tùy chọn -d) Liệt kê các tệp và thông tin thư mục con mà không có nội dung của chúng (ngoại trừ ".", ".." và các tệp và thư mục bắt đầu bằng ".")
```
hieu@hieukma:~$ ls -ald ~/folder/*
drwxrwxr-x 2 hieu hieu 4096 Nov 19 08:34 /home/hieu/folder/folder1
drwxrwxr-x 2 hieu hieu 4096 Nov 19 08:34 /home/hieu/folder/folder2
```
* (Tùy chọn -S) Sắp xếp tệp và thư mục theo kích thước:
```
[root@localhost ~]#  ls -alS ~/folder
total 4
dr-xr-x---. 4 root root 4096 Nov 19 15:18 ..
drwxr-xr-x. 4 root root   36 Nov 19 14:35 .
drwxr-xr-x. 2 root root    6 Nov 19 14:35 folder1
drwxr-xr-x. 2 root root    6 Nov 19 14:35 folder2
```
* (Tùy chọn -t) Sắp xếp tệp và thư mục theo thời gian sửa đổi
```
[root@localhost ~]# ls -alt ~/folder
total 4
dr-xr-x---. 4 root root 4096 Nov 19 15:18 ..
drwxr-xr-x. 4 root root   36 Nov 19 14:35 .
drwxr-xr-x. 2 root root    6 Nov 19 14:35 folder1
drwxr-xr-x. 2 root root    6 Nov 19 14:35 folder2
```

### 3. Command Help (man ls)
* Tùy chọn " -l " hiển thị các ký tự sau cho loại tệp
```
-: Regular file.
d: Directory.
l: Symbolic link (linked file).
b: Block special file (block device).
c: Character special file (character device).
s: Socket link.
p: FIFO.
```
* Tùy chọn " -l " hiển thị các ký tự sau cho các quyền của tệp:
```
r: the file is readable (or you can open the directory).
w: the file is writable (or you can add/delete files or directories to/from the directory).
x: the file is executable (or the directory is searchable).
-: the file is | not readable | not writable | not executable.
```
Đối với một tệp lệnh cụ thể, bạn có thể thấy ký tự `s` thay vì ký tự `x` (-rwsrwsr--). Ký tự `s` có thể được đặt cho quyền của người dùng (setuid: đặt id người dùng khi thực thi) hoặc / và quyền nhóm (setgid: đặt id nhóm khi thực thi). Điều này cho phép người dùng thực thi lệnh nhưng quyền sở hữu lệnh đang chạy sẽ do người dùng hoặc nhóm sở hữu lệnh đó nắm giữ.

Đối với một số thư mục, bạn có thể thấy ký tự `t` thay vì ký tự `x` trong các quyền khác (drwxrwxr-t). Điều này cho thấy rằng bit dính đã được bật cho chúng, có nghĩa là người dùng có thể thêm hoặc xóa các tệp trong các thư mục đó nhưng họ không thể xóa các tệp của nhau.

Đối với một số tệp và thư mục, bạn có thể thấy ký tự `+` ở cuối các bit quyền (-rwsrwsr - +). Điều này có nghĩa là các tệp và thư mục đó có các thuộc tính bổ sung được gán cho chúng (tức là ACL).
