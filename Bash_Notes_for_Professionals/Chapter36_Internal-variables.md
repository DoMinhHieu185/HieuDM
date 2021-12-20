# Internal variables (Các biến nội bộ)
Tổng quan về các biến nội bộ của Bash, ở đâu, như thế nào và khi nào sử dụng chúng.
### Section 36.1: Bash internal variables at a glance(Tóm tắt các biến nội bộ)
|Variable|Chi tiết|
|-|-|
|$* / $@|Tham số (đối số) vị trí của Function/script. Mở rộng như sau: <br />$* và $* giống như $1 $2 ..<br />"$*" giống như "$1 $2 ..." 1 (1 ở đây được hiểu là các đối số được phân tách bằng ký tự đầu tiên của $Í, ký tự này không nhất thiết phải là khoảng trắng)<br />"$@" giống như "$1" "$2"... |
|$#|Số tham số vị trí được truyền vào cho Script hoặc function | 
|$!|pROCESS ID của lệnh cuối cùng (gần nhất cho pipeline) trong công việc gần nhất được đưa và nền (lưu ý rằng nó không nhất thiết phải giống với process group ID của công việc khi job control được bật)  |
|$$|ID của quá trình thực thi bash |
|$?|Exit code của lệnh cuối cùng|
|$n|Tham số vị trí, được biểu diễn từ 1,2,3,...,6|
|${n}|Giống bên trên nhưng n có thể lớn hơn 9|
|$0|Trong script, đường dẫn mà tệp lệnh được gọi; với tên bash -c 'printf  "%s\n" "$0"' name args ': name (đối số đầu tiên sau tập lệnh nội tuyến), ngược lại, argv [0] mà bash nhận được. |
|$_|Trường cuối cùng của lệnh cuối cùng|
|$IFS|Dấu phân tách trường nội bộ|
|$PATH|Biến môi trường $PATH được sử dụng để tra cứu các tệp thực thi|
|$OLDPWD|Thư mục làm việc trước đó|
|$PWD |Thư mục làm việc hiện tại|
|$FUNCNAME|Mảng của tên hàm trong stack lệnh gọi thực thi|
|$BASH_SOURCE|Mảng chứa đường dẫn sourcecho các phần tử trong mảng FUNCNAME. Có thể được sử dụng để lấy đường dẫn script|
|$BASH_ALIASES|Mảng liên kết chứa tất cả các bí danh hiện được xác định|
|$BASH_REMATCH|Chuỗi các kết quả phù hợp từ regex match gần nhất|
|$BASH_VERSION |Chuỗi phiên bản BASH |
|$BASH_VERSINFO |Một mảng gồm 6 phần tử với thông tin phiên bản bash |
|$BASH |Đường dẫn tuyệt đối đến Bash shell hiện đang thực thi( được xác định dựa trên csdl trên argv[0] và giá trị $PATH; có thể sai trong các trường hợp nền tảng khác nhau)|
|$BASH_SUBSHELL|Cấp độ Bash subshell|
|$UID|ID người dùng thực của quá trình chạy bash |
|$PS1|Dấu nhăc dòng lệnh chính; xem sử dụng các biến PS*|
|$PS2|Lời nhắc dòng lệnh phụ (được sử dụng cho đầu vào bổ sung)|
|$PS3|Lời nhắc dòng lệnh cấp ba (được sử dụng trong vòng lặp chọn)|
|$PS4|Lời nhắc dòng lệnh bậc bốn (được sử dụng để nối thông tin với đầu ra dài dòng)|
|$RANDOM|Một nguyên ngẫu nhiên từ 0 đến 32767|
|$REPLY|Biến được sử dụng theo cách read theo mặc định khi không có biến nào được chỉ định. Cũng được sử dụng bởi SELECT để trả về giá trị do người dùng cung cấp|
|$PIPESTATUS|Biến mảng giữ các giá trị trạng thái thoát của mỗi lệnh trong đường dẫn nền trước được thực thi gần đây nhất.|

  > Variable Assignment- phép gán biến không được có khoảng trắng trước và sau. `a=123` không được `a = 123`. Ví dụ sau (dấu bằng được bao quanh bởi dấu cách) riêng biệt có nghĩa là chạy lệnh a với các đối số = và 123, mặc dù nó cũng được nhìn thấy trong toán tử so sánh chuỗi (về mặt cú pháp là đối số của [ hoặc [[ hoặc bất kỳ thử nghiệm nào bạn đang sử dụng).

### Section 36.2: $@
`"$@"` mở rộng thành tất cả các đối số trong dòng lệnh dưới dạng từ riêng biệt. Nó khác với `"$*"`, mở rộng thành tất cả các đối số dưới dạng một từ duy nhất. `"$@"` đặc biệt hữu ích để lặp qua các đối số và xử lý đối số có dấu cách.

Thực hiện tạo script và thực hiện như sau để thấy sự khác biệt:
```
./script.sh "␣1␣2␣" "␣3␣␣4␣"
```

Biến $* và $@ sẽ mở rộng thành $1 $2, lần lượt mở rộng là 1 2 3 4 do đó, có vòng lặp:
```
#!/bin/bash 
for var in $*; do # same for var in $@; do
    echo $var
done

echo 
echo "-$1--$2"
echo $3
echo $@
```
Sẽ in ra cho cả 2 trưởng hợp $@ và $*:
```
[root@localhost ~]# ./test.sh ' 1 2 ' ' 3  4 '
1
2
3
4

- 1 2 -- 3  4 -

1 2 3 4
```
Trong khi `"$*"` sẽ được mở rộng thành `"$1 $2"` lần lượt sẽ mở rộng thành `" 1 2 3 4 "`
```
#!/bin/bash 
for var in "$*"; do 
    echo "<$var>"
done

echo 
echo "-$1--$2"
echo $3
echo $*
```
Output:
```
[root@localhost ~]# ./test.sh ' 1 2 ' ' 3  4 '
< 1 2   3  4 >

- 1 2 -- 3  4

1 2 3 4
```
Trong khi `"$@"` sẽ được mở rộng thành `"$1" "$2"` lần lượt sẽ mở rộng thành `"_1_2_" "_3__4_"`
```
#!/bin/bash 
for var in "$@"; do 
    echo "<$var>"
done

echo 
echo "-$1--$2"
echo $3
echo $*
```
Output
```
[root@localhost ~]# ./test.sh ' 1 2 ' ' 3  4 '
< 1 2 >
< 3  4 >

- 1 2 -- 3  4

1 2 3 4
```
Do đó bảo tồn cả khoảng cách bên trong các đối số và sự tách biệt đối số. Lưu ý rằng cáu trúc cho var trong `for var in "$@"; do ...` rất phổ biến và trở thành mặc định cho vòng lặp for và có thể rút gọn thành `for var; do ....`

### Section 36.3: $#
Để nhận số lượng đối số đã nhập vào dòng lệnh hoặc tham số vị trí, trong script:
```
#!/bin/bash
echo "$#"
```
Khi đó thực hiện nhập đối số:
```
[root@localhost ~]# ./test.sh ' 1 2 ' ' 3  4 '
2
[root@localhost ~]# ./test.sh 'mot hai ba'
1
[root@localhost ~]# ./test.sh 1 2 3 4
4
```

### Section 36.4: $HISTSIZE
Số câu lệnh mà môi trường nhớ tối đa:
```
[root@localhost ~]# echo $HISTSIZE
1000
```

### Section 36.5: $FUNCNAME
Để lấy tên của hàm hiện tại:
```
#!/bin/bash 
abc_function(){
 echo "Tên của hàm này là $FUNCNAME"
}
abc_function

home_function(){
 echo "---Home--- Tên của hàm này là $FUNCNAME"
}
home_function
```
Output:
```
[root@localhost ~]# ./test.sh
Tên của hàm này là abc_function
---Home--- Tên của hàm này là home_function
[root@localhost ~]#
```

### Section 36.6: $HOME
Thư mục chính của người dùng:
```
[hieu@localhost ~]$ echo $HOME
/home/hieu
```

### Section 36.7: $IFS
Chứa chuỗi dấu phân cách trường nội bộ mà bash sử dụng để chia chuỗi khi lặp lại, Giá trị mặc định là ký tự khoảng trắng, \n (dòng mới), \t(tab) và dấu cách. Thay đổi điều này thành một thứ khác cho phép bạn chia chuỗi bằng các ký tự khác nhau: vd1:

```
#!/bin/bash 
IFS=","
INPUTSTR="a,b,c,d"
for field in ${INPUTSTR}; do
    echo $field
done
```
Output
```
[root@localhost ~]# ./test.sh
a
b
c
d
```

vd2:
```
#!/bin/bash 
IFS=";"
INPUTSTR="a,b;c,d;e,f"
for field in ${INPUTSTR}; do
    echo $field
done
```
Output
```
[root@localhost ~]# ./test.sh
a,b
c,d
e,f
```

### Section 36.8: $OLDPWD
OLDPWD (OLDPrintWorkingDirectory) Chứa thư mục mà làm việc cuối cùng
```
[root@localhost ~]# pwd
/root
[root@localhost ~]# cd /root/dohieu
[root@localhost dohieu]# echo $OLDPWD
/root
```

### Section 36.9: $PWD
PWD (PrintWorkingDirectory) In ra thư mục đang làm việc hiện tại:
```
[root@localhost dohieu]# pwd
/root/dohieu
```

### Section 36.10: $1 $2 $3 etc..
Các tham số được truyền vào một script/function:
```
#!/bin/bash 
echo $1
echo $2
echo $3
```
output
```
[root@localhost ~]# ./test.sh do minh hieu
do
minh
hieu
```

### Section 36.11: $*
Sẽ trả về tất cả tham số trong một chuỗi duy nhất:
```
#!/bin/bash
echo "$*"
```
output
```
[root@localhost ~]# ./test.sh abc 12345 "hello world"
abc 12345 hello world
```

### Section 36.12: $!
Process IP(PID) của jobs cuối cùng chạy nền
```
[root@localhost ~]# sleep 5 &
[1] 1705
[root@localhost ~]# echo $!
1705
[1]+  Done                    sleep 5
```

### Section 36.13: $?
In ra Exit code cuối cùng
```
[root@localhost ~]# echo "" ; echo $?

0
[root@localhost ~]# $ ls; echo $?
-bash: $: command not found
127
[root@localhost ~]# ls *.blah;echo $?
ls: cannot access *.blah: No such file or directory
2
[root@localhost ~]# $yum install -y sadf;echo $?
install: invalid option -- 'y'
Try 'install --help' for more information.
1
```

### Section 36.14: $$
PID- Process ID của quy trình hiện tại
```
[root@localhost ~]# echo $$
1584
```

### Section 36.15: $RANDOM
Mỗi khi tham số này được tham chiếu, một số nguyên ngẫu nhiên từ 0 đến 32767 sẽ được tạo ra.
```
[root@localhost ~]# echo $RANDOM
28944
[root@localhost ~]# echo $RANDOM
2071
[root@localhost ~]# echo $RANDOM
13672
[root@localhost ~]# echo $RANDOM
21222
```

### Section 36.16: $BASHPID
Process ID của phiên bản bash hiện tại. Điều này không giống với biến $$, nhưng nõ thường cung cấp cùng một kết quả. Tính năng nà mới trong bash 4 và không hoạt động trong bash 3
```
[root@localhost ~]#  echo "\$\$ pid = $$ BASHPID = $BASHPID"
$$ pid = 1584 BASHPID = 1584
```

### Section 36.17: $BASH_ENV
Một biến môi trường trỏ đến tệp khởi động bash được đọc khi một tập lệnh được gọi.

### Section 36.18: $BASH_VERSINFO
Một mảng chứa thông tin phiên bản đầy đủ được chia thành các phần tử, thuận tiện hơn nhiều so với $BASH_VERSION nếu bạn chỉ đang tìm kiếm phiên bản chính:
```
[root@localhost ~]# for ((i=0; i<=5; i++)); do echo "BASH_VERSINFO[$i] = ${BASH_VERSINFO[$i]}"; done
BASH_VERSINFO[0] = 4
BASH_VERSINFO[1] = 2
BASH_VERSINFO[2] = 46
BASH_VERSINFO[3] = 2
BASH_VERSINFO[4] = release
BASH_VERSINFO[5] = x86_64-redhat-linux-gnu
```

### Section 36.19: $BASH_VERSION
Hiển thị phiên bản bash đang chạy, điều này cho phép bạn quyết định xem bạn có thể sử dụng bất kỳ tính năng nâng cao nào không:
```
[root@localhost ~]# echo $BASH_VERSION
4.2.46(2)-release
```

### Section 36.20: $EDITOR
Trình chỉnh sửa văn bản đang chạy, nếu điều này cho phép bạn quyết định xem bạn có thể sử dụng bất kỳ tính năng nâng cao nào không:

### Section 36.21: $HOSTNAME
Tên máy chủ được gán cho hệ thống trong quá trình khởi động.
```
[root@localhost ~]# echo $HOSTNAME
localhost.localdomain
```

### Section 36.22: $HOSTTYPE
Biến này xác định phần cứng, nó có thể hữu ích trong việc xác định mã nhị phân nào sẽ được thực thi:
```
[root@localhost ~]# echo $HOSTTYPE
x86_64
```

### Section 36.23: $MACHTYPE
Tương tự như $ HOSTTYPE ở trên, phần này cũng bao gồm thông tin về hệ điều hành cũng như phần cứng:
```
[root@localhost ~]# echo $MACHTYPE
x86_64-redhat-linux-gnu
```

### Section 36.24: $OSTYPE
Trả về thông tin về hệ điều hành đang chạy trên máy,:
```
[root@localhost ~]# echo $OSTYPE
linux-gnu
```

### Section 36.25: $PATH
Đường dẫn để tìm kiếm mã nhị phân cho các lệnh. Các ví dụ phổ biến bao gồm /usr/bin và /usr/local/bin.

Khi người dùng hoặc script cố gắng chạy một lệnh, các đường dẫn $PATH sẽ tìm kiếm tệp phù hợp để thực thi

Các thư mục trong $PATH được phân tách bằng ký tự hai chấm:
```
[root@localhost ~]# echo "$PATH"
/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
```

### Section 36.26: $PPID
Process ID của script hoặc shell's parent, có nghĩa là tiến trình được gọi ra tập lệnh hoặc trình bao hiện tại.
```
[root@localhost ~]# echo $$
1584
[root@localhost ~]# echo $PPID
1580
```

### Section 36.27: $SECONDS
Số giây mà một tệp script đã chạy. Điều này có thể khá hơn nếu được hiển thị trong shell:
```
[root@localhost ~]# echo $SECONDS
3921
```

### Section 36.28: $SHELLOPTS
Một danh sách chỉ đọc các tùy chọn cơ bản được cung cấp khi khởi động để kiểm soát hành vi của nó:
```
[root@localhost ~]#  echo $SHELLOPTS
braceexpand:emacs:hashall:histexpand:history:interactive-comments:monitor
```

### Section 36.29: $_
Xuất ra trường cuối cùng từ lệnh cuối cùng được thực thi
```
[root@localhost ~]# ll *.txt ;echo $_
-rw-r--r--. 1 root root   0 Dec 15 15:46 cong.txt
-rw-r--r--. 1 root root 646 Nov 26 17:05 hieu.txt
-rw-r--r--. 1 root root   0 Dec 15 15:46 tuan.txt
tuan.txt
```

### Section 36.30: $GROUPS
Một mảng chứa số lượng nhóm mà người dùng đang ở:

### Section 36.31: $LINENO
Xuất ra số dòng trong tập lệnh hiện tại. Hầu hết hữu ích khi gỡ lỗi tập lệnh.
```
#!/bin/bash
# this is line 2
echo something # this is line 3
echo $LINENO # Will output 4
```
output
```
[root@localhost ~]# ./test.sh
something
4
```

### Section 36.32: $SHLVL
Khi lệnh bash được thực thi, Một shell mới sẽ được mở. Biến môi trường $SHLVL chứa số lượng cấp shell mà shell hiện tại đang chạy trên đó. Một của sổ đầu cuối mới, việc thực hiện lệnh sau sẽ tạo ra các kết quả khác nhau dựa trên bản phân phối linux đang được sử dụng.
```
[root@localhost ~]# echo $SHLVL
1
[root@localhost ~]# bash
[root@localhost ~]# echo $SHLVL
2
[root@localhost ~]# bash
[root@localhost ~]# echo $SHLVL
3
```

### Section 36.33: $UID
Biến chỉ đọc lưu trữ số ID của người dùng, Câu lệnh được sử dụng bởi 3 người dùng khác nhau.
```
[root@localhost ~]# echo $UID
0
[root@localhost ~]# su - hieu
Last login: Wed Dec 15 14:38:27 +07 2021 on pts/0
[hieu@localhost ~]$ echo $UID
1000
```
