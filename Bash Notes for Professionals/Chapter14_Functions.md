# Funtion
### Section 14.1: Functions with arguments(Các hàm có đối số)
Trong file hello.sh:
```
#!/bin/bash
greet() {
local name="$1"
echo "Hello, $name"
}
greet "$1"
```
* Output
```
[root@localhost ~]# bash hello.sh
Hello, Do Hieu
```

Với nhiều đối số Ví dụ 2:

```
#!/bin/bash
greet() {
echo "Firstname: $1"
echo "Lastname: $2"
}
greet "$@"
```
* Output
```
[root@localhost ~]# bash hello.sh do hieu
Firstname: do
Lastname: hieu
```
  > $@ tham chiếu đến tất cả các đối số của một hàm
  > đối với các đối số nhiều hơn 9 $ 10 sẽ không hoạt động (bash sẽ đọc nó là **$1**0), bạn cần thực hiện ${10} ,${11} , v.v.

Ví dụ 4: đối với các đối số mặc định, hãy sử dụng ${1: -default_val}
```
#!/bin/bash
foo() {
local val=${1:-25}
echo "$val"
}
foo
foo 30
foo abc
```
* Output
```
[root@localhost ~]# ./hello.sh
25
30
abc
```
  > Nó chỉ lấy 25 là giá trị cho $val trong function còn lại value động.

Section 14.2: Simple Function(Function đơn giản)
Trong hello.sh:
```
greet ()
{
 echo "Hello World!"
}
# Gọi function để thực hiện
greet
```
* Output:
```
[root@localhost ~]# ./hello.sh
Hello World!
```

Chú ý: Việc sử dụng source cung cấp tên tệp có các hàm làm cho chúng có sẵn trong phiên bash hiện tại của bạn.

```
[root@localhost ~]#  source hello.sh
Hello World!
[root@localhost ~]# greet
Hello World!
```
Bạn có thể sử dụng export Một function trong một số shells để nó tiếp xúc với các process con.
```
[root@localhost ~]# bash -c 'greet'
bash: greet: command not found
[root@localhost ~]# export -f greet
[root@localhost ~]# bash -c 'greet'
Hello World!
```

### Section 14.3: Handling flags and optional parameters( Xử lý flag và các tham số tùy chọn)
`getopts` phân tích cú pháp các tùy chọn lệnh và đối số , chẳng hạn như những đối số được truyền cho một tập lệnh shell .

### Section 14.4: Print the function definition(In định nghĩa hàm)
```
getfunc() {
declare -f "$@"
}
function func(){
echo "I am a sample function"
}
funcd="$(getfunc func)"
getfunc func # or echo "$funcd"
```
* Output
```
[root@localhost ~]# ./hello.sh
func ()
{
    echo "I am a sample function"
}
```

### Section 14.5: A function that accepts named parameters(Một function chấp nhận các tham số được đặt tên)
```
foo() {
    while [[ "$#" -gt 0 ]]
    do
        case $1 in
            -f|--follow)
            local FOLLOW="following"
            ;;
            -t|--tail)
            local TAIL="tail=$2"
            ;;
        esac
        shift
    done
    echo "FOLLOW: $FOLLOW"
    echo "TAIL: $TAIL"
}
```
* Output
```
[root@localhost ~]#  source hello.sh
[root@localhost ~]# foo -a
FOLLOW:
TAIL:
[root@localhost ~]# foo -t
FOLLOW:
TAIL: tail=
[root@localhost ~]# foo -f
FOLLOW: following
TAIL:
[root@localhost ~]# foo -t 10
FOLLOW:
TAIL: tail=10
[root@localhost ~]# foo -f -t 10
FOLLOW: following
TAIL: tail=10
```

### Section 14.6: Return value from a function(Trả về giá trị từ một function)
Câu lệnh `return` trong Bash không trả về giá trị như C-functions, thay vào đó, nó thoát khỏi hàm với một giá trị trả về trạng thái. Bạn có thể coi nó là trạng thái thoát của funtion đó

Nếu bạn muốn trả về một giá trị từ function thì hãy gửi giá trị đến stdout như sau:
```
fun() {
local var="Sample value to be returned"
echo "$var"
#printf "%s\n" "$var"
}
```
* Output
```
[root@localhost ~]# source hello.sh
[root@localhost ~]# fun
Sample value to be returned
```

### Section 14.7: The exit code of a function is the exit code of its last command( exit code cả một hàm là exit code của lệnh cuối cùng)
```
is_alive() {
ping -c1 "$1" &> /dev/null
}
```
Function này sẽ gửi một lệnh ping đến một máy chủ được chỉ định bởi tham số đầu tiên. STDOUT và STDERR của lệnh ping đều được gửi đên /dev/null, vì vậy hàn sẽ không bao giờ xuất ra bất kỳ thứ gì. Nhưng lệnh ping sẽ có exit code bằng 0 khi thành công và khác 0 khi thất bại vì đây là lệnh thoát cuối cùng của function, exit code của ping sẽ được sử dụng lại cho exit code của function chính.

Ví dụ: nếu máy chủ graucho được thiết lập, hãy kết nối với máy chủ đó bằng ssh 
```
if is_alive graucho; then
ssh graucho
fi
```
