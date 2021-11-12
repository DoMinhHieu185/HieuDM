# Mở rộng tham số Bash
Ký tự $ giới thiệu để mở rộng tham số thay thế lệnh hoặc mở rộng số học. Tên Tham số hoặc ký hiệu được mở rộng có thể được đặt trong dấu ngoặc nhọn, là tùy chọn nhưng dùng để bảo vệ biến thành được mở rộng từ các ký tự ngay sau nó, có thể được hiểu là một phần của tên.

### Section 15.1: Modifying the case of alphabetic characters(Sửa đổi trường hợp của các ký tự chữ cái)
* Chỉ ký tự đầu tiên thành chữ hoa
```
[root@localhost ~]# v="hello"
[root@localhost ~]# printf '%s\n' "${v^}"
Hello
```
* Tất cả các ký tự:
```
[root@localhost ~]# v="hello"
[root@localhost ~]# printf '%s\n' "${v^^}"
HELLO
```
```
[root@localhost ~]# v="hello world"
[root@localhost ~]# declare -u string="$v"
[root@localhost ~]# echo "$string"
HELLO WORLD
```
* Thành chữ thường: chỉ ký tự đầu tiên
```
[root@localhost ~]# v="THANK"
[root@localhost ~]# printf '%s\n' "${v,}"
tHANK
```
* Thành chữ thường: tất cả các ký tự
```
[root@localhost ~]# v="THANK"
[root@localhost ~]# printf '%s\n' "${v,,}"
thank
```
```
[root@localhost ~]# v="THANK YOU"
[root@localhost ~]# declare -l string="$v"
[root@localhost ~]# echo $string
thank you
```
* Trường hợp chuyển đổi: Thay đổi ở tất cả các ký tự.
```
[root@localhost ~]# v="Thank You"
[root@localhost ~]# printf '%s\n' "${v~~}"
tHANK yOU
```
* Trường hợp chuyển đổi: Chỉ ký tự đầu tiên.
```
[root@localhost ~]# v="Thank You"
[root@localhost ~]# printf '%s\n' "${v~}"
thank you
```

### Section 15.2: Length of parameter(Độ dài của một tham số)
* Độ dài của một chuỗi
```
[root@localhost ~]# v='12345'
[root@localhost ~]# echo "${#v}"
5
```
  >Lưu ý rằng đó là một độ dài được dựa theo các ký tự
* Số phần tử của mảng
```
[root@localhost ~]# myarr=(1 2 34 5 6 789)
[root@localhost ~]# echo "${#myarr[@]}"
6
```

* Làm với các tham số vị trí
```
[root@localhost ~]# set -- 1 2 3 4123c 124
[root@localhost ~]# echo "${#@}"
5
[root@localhost ~]# echo "$#"
5
```

### Section 15.3: Replace pattern in string(Thay thế trong chuỗi)
```
[root@localhost ~]# str='I am a string'
[root@localhost ~]# echo "${str/a/A}"
I Am a string
```
* `echo "${str/a/A}"`: phân tích trong ${str/a/A}
  * str tên chuỗi
  * a chữ cần thay
  * A thay đổi chữ a đầu tiên thành A. Muốn thay đổi tất cả chữ a thành A: "${tr//a/A}

Thay đổi ký tự đầu tiên:
```
[root@localhost ~]# str='I am a string'
[root@localhost ~]# echo "${str/#I/this}"
this am a string
```

Thay đổi ký tự cuối cùng:

```
[root@localhost ~]# str='I am a string'
[root@localhost ~]#  echo "${str/%g/N}"
I am a strinN
```

Thay đổi ký tự trong chuỗi thành không có:
```
[root@localhost ~]# str='I am a string'
[root@localhost ~]#  echo "${str/%g/}"
I am a strin
```

Thêm ký tự vào các item có trong một mảng:

```
[root@localhost ~]# A=(hello world)
[root@localhost ~]# echo "${A[@]/#/R}"
Rhello Rworld
[root@localhost ~]# echo "${A[@]/%/_E}"
hello_E world_E
```

### Section 15.4: Substrings and subarrays(Substrings và subarrays)
Đặt biến cho chuỗi ký tự:
```
var='0123456789abcdef'
```
* `${var:n}` Lấy từ vị trí số n đến hết
```
[root@localhost ~]# var='0123456789abcdef'
[root@localhost ~]# printf '%s\n' "${var:3}"
3456789abcdef
[root@localhost ~]# printf '%s\n' "${var:10}"
abcdef
```
* `${var:n:y}` Lấy từ vị trí n, lấy ra y ký tự.
```
[root@localhost ~]# printf '%s\n' "${var:1:9}"
123456789
[root@localhost ~]# printf '%s\n' "${var:2:10}"
23456789ab
```
* ${var:n:-y} Số lượng độ dài âm tính từ cuối chuỗi. Lấy từ vị trí n và bỏ lại y ký tự cuối
```
[root@localhost ~]# printf '%s\n' "${var:5:-5}"
56789a
[root@localhost ~]# printf '%s\n' "${var:10:-1}"
abcde
```
* `${var: -n}` : Lấy số ký tự tính từ cuối. Khoảng trắng là cần thiết và khác với `${var:-n}`, có thể thay thế `${var:(-n)}`
```
[root@localhost ~]# printf '%s\n' "${var:-6}"
0123456789abcdef
[root@localhost ~]#  printf '%s\n' "${var: -6}"
abcdef
[root@localhost ~]# printf '%s\n' "${var:(-6)}"
abcdef
```
* Đối với mảng
```
[root@localhost ~]# myarr[0]='0123456789abcdef'
[root@localhost ~]# printf '%s\n' "${myarr[0]:7:3}"
789
```

### Section 15.5: Delete a pattern from the beginning of a string(Xóa một mẫu khỏi đầu 1 chuỗi)
* ký tự đầ tiên
```
[root@localhost ~]# a='I am a string'
[root@localhost ~]# echo "${a#*a}"
m a string
```
* Tất cả ký tự
```
[root@localhost ~]# a='I am a string'
[root@localhost ~]# echo "${a##*a}"
 string
```

### Section 15.6: Parameter indirection(Hướng tham số)
Bash indirection cho phép lấy giá trị của một biến có tên được chứa trong một biến khác.
```
[root@localhost ~]#  red="the color red"
[root@localhost ~]# green="the color green"
[root@localhost ~]# color=red
[root@localhost ~]# echo "${!color}"
the color red
[root@localhost ~]#  color=green
[root@localhost ~]# echo "${!color}"
the color green
```
Chuyển hướng biến color đến biến red và biến green được khai báo hướng

* Ví dụ khác
```
# foo=10
# x=foo
# echo ${x} #In ra biến theo kiểu cơ bản
foo

# foo=10
# x=foo
# echo ${!x} 
10
```

### Section 15.7: Parameter expansion and filenames(Mở rộng tham số và tên tệp)
Bạn có thể sử dụng Bash Parameter Expansion để mô phỏng các hoạt động xử lý tên tệp phổ biến như `basename` và `dirname`

Ví dụ: Cho đường dẫn /tmp/ex/myfolder/file.txt

Để mô phỏng `dirname` và trả về tên thư mục của đường dẫn tệp:

```
# FILENAME="/tmp/ex/myfolder/file.txt"
# echo "${FILENAME%/*}"
/tmp/ex/myfolder
```

Để mô phỏng `basename` $FILENAME và trả về tên tệp của đường dẫn tệp:
```
# echo "${FILENAME##*/}"
file.txt
```

Để mô phỏng basename `$FILENAME` `.txt` và trả về tên tệp không có tên mở rộng `.txt`:
```
[root@localhost ~]# BASENAME="${FILENAME##*/}"
[root@localhost ~]# echo "${BASENAME%%.txt}"
file
```

### Section 15.8: Default value substitution(Thay thế giá trị mặc định)
`${parameter:-word}`: Nếu tham số không được đặt hoặc null, sự mở rộng của từ sẽ được thay thế. Nếu không, giá trị của tham số được thay thế.

```
$ unset var
$ echo "${var:-XX}" # Tham số chưa được đặt -> Xảy ra mở rộng
XX
$ var="" # Tham số là null -> Xảy ra mở rộng
$ echo "${var:-XX}"
XX
$ var=23 # Tham số không rỗng -> kết quả ban đầu
$ echo "${var:-XX}"
23
```
`${parameter:=word}`: Nếu tham số không được đặt hoặc null, phần mở rộng của ký tự được gán cho tham số. Giá trị của tham số sau đó được thay thế. Các tham số vị trí và tham số đặc biệt có thể không được gán theo cách này.

```
# unset var
# echo "${var:=XX}" # Tham số chưa được đặt -> được gắn vào XX
XX
# echo "$var"
XX
# var="" # Tham số null -> từ được gắn cho XX
# echo "${var:=XX}"
XX
# echo "$var"
XX
# var=23 # Tham số đã có giá trị -> Không gắn được
# echo "${var:=XX}"
23
# echo "$var"
23
```

### Section 15.9: Delete a pattern from the end of a string(Xoá một mẫu khỏi phần cuối của một chuỗi)
* Ký tự cuối
```
[root@localhost ~]# a='I am a string'
[root@localhost ~]# echo "${a%a*}"
I am
```
* Tất cả ký tự
```
[root@localhost ~]# a='I am a string'
[root@localhost ~]# echo "${a%%a*}"
I
```

### Section 15.10: Munging during expansion()
Các biến không nhất thiết phải mở rộng đến giá trị của chúng - các chuỗi con có thể được trích xuất trong quá trình mở rộng, điều nàycó thể hữu ích để giải nén phần mở rộng tệp hoặc các phần của đường dẫn. Các ký tự bóng bẩy giữ nguyên ý nghĩa thông thường của chúng, vì vậy . *đề cập đến một dấu chấm theo nghĩa đen, theo sau là bất kỳ chuỗi ký tự nào; nó không phải là một biểu thức chính quy.
```
$ v=foo-bar-baz
$ echo ${v%%-*}
foo
$ echo ${v%-*}
foo-bar
$ echo ${v##*-}
baz
$ echo ${v#*-}
bar-baz
```







