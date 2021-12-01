# Viết kịch bản với các tham số
### Section 23.1: Multiple Parameter Parsing(Phân tích cú pháp nhiều tham số)
Để phân tích cú pháp nhiều tham số, các ưu thích của việc này là sử dụng vòng lặp `while, `lệnh `case`, `shift`

`shift` được sử dụng để bật tham số đầu tiên trong chuỗi, làm cho giá trị trước là $2, bây giờ là $1. Điều này hữu ích cho các xử lý đỗi số tại một thời điểm.
```
#!/bin/bash
# Load the user defined parameters
while [[ $# > 0 ]]
do
 case "$1" in
 -a|--valueA)
 valA="$2"
shift
;;
 -b|--valueB)
 valB="$2"
shift
;;
 --help|*)
 echo "Usage:"
echo " --valueA \"value\""
 echo " --valueB \"value\""
 echo " --help"
exit 1
;;
 esac
 shift
done
echo "A: $valA"
echo "B: $valB"
```
Output
```
[root@localhost ~]# vi test.sh
[root@localhost ~]# ./test.sh
A:
B:
[root@localhost ~]# ./test.sh a
Usage:
 --valueA "value"
 --valueB "value"
 --help
[root@localhost ~]# ./test.sh a --help
Usage:
 --valueA "value"
 --valueB "value"
 --help
[root@localhost ~]# ./test.sh --valueA 25
A: 25
B:
[root@localhost ~]# ./test.sh --valueB 255
A:
B: 255
[root@localhost ~]# ./test.sh --valueB 255 --valueA 122
A: 122
B: 255
```

### Section 23.2: Argument parsing using a for loop(Phân tích cú pháp đối số bằng vòng lặp for)
Một ví dụ đơn giản cung cấp các tùy chọn:
|Option| Alt. Opt||
|-|-|-|
|-h|--help|Hiển thị hướng dẫn|
|-v|--version|Hiển thị thông tin phiên bản|
|-dr path|--doc-root path|một tùy chọn nhận tham số phụ(một đường dẫn)|
|-i|--install|Một tùy chọn boolean (true/false)| 
|-*|--|tùy chọn không hợp lệ|
```
#!/bin/bash
dr=''
install=false
skip=false
for op in "$@";do
    if $skip;then skip=false;continue;fi
    case "$op" in
        -v|--version)
            echo "$ver_info"
            shift
            exit 0
            ;;
        -h|--help)
            echo "$help"
            shift
            exit 0
            ;;
        -dr|--doc-root)
            shift
            if [[ "$1" != "" ]]; then
                dr="${1/%\//}"
                shift
                skip=true
            else
                echo "E: Arg missing for -dr option"
                exit 1
            fi
            ;;
        -i|--install)
            install=true
            shift
            ;;
        -*)
            echo "E: Invalid option: $1"
            shift
            exit 1
            ;;
    esac
done
```

### Section 23.3: Wrapper script
Wraper script là một tập lệnh bao bọc một tệp hoặc lệnh khác để cung cấp các chức năng bổ sung hoặc chỉ để thực hiện một cái gì đó.

Ví dụ, trong hệ thống GNU/Linux mới đang được thay thế bằng một tệp lệnh trình bao bọc có tên egrep.
```
#!/bin/sh
exec grep -E "$@"
```
Vì vậy khi bạn chạy `egrep` trong các hệ thống như vậy, bạn thực sự đang chạy `grep -E` với tất cả các đối số được chuyển tiếp.

### Section 23.4: Accessing Parameters(Truy cập các tham số)
Khi thực thi một tập lệnh Bash, các tham số được truyền vào tập lệnh được đặt tên phù hợp với vị trí của chúng: $ 1 làtên của tham số đầu tiên, $ 2 là tên của tham số thứ hai, v.v

Một tham số bị thiếu chỉ đơn giản là đánh giá một trống. Kiểm tra sự tồn tại của một tham số có thể được thực hiện như sau:
```
if [ -z "$1" ]; then
 echo "Không được cung cấp đối số"
fi
```
Output
```
[root@localhost ~]# ./test.sh
Không được cung cấp đối số
[root@localhost ~]# ./test.sh a
```

**Nhận tất cả các tham số**
$@ và $* là các cách tương tác với tất cả các tham số lệnh

* $*: Mở rộng đến các tham số vị trí, bắt đầu từ một. Khi mở rộng xảy ra trong pham vi dấu ngoặc kép, nó mở rộng thành một từ duy nhất với giá trị của một tham số được phân tách bằng ký tự đầu tiên của biến đặc biệt IFS
* $@: Mở rộng đến các tham số vị trí, bắt đầu từ một. Khi mở rộng xảy ra trong dấu ngoặc kép, mỗi tham số mở rộng thành một từ riêng biệt.

**Nhận số lượng tham số**
`$#` nhận số lượng tham số được truyền vào một tệp lệnh. Một trường hợp sử dụng điển hình sẽ là:

```
if [ $# -eq 0 ]; then
 echo "Không được cung cấp đối số"
fi
echo $#
```
Output
```
[root@localhost ~]# ./test.sh
Không được cung cấp đối số
0
[root@localhost ~]# ./test.sh 1 2 3 4
4
[root@localhost ~]# ./test.sh 122 45 95
3
```
Ví dụ 1: Lặp lại tất cả các đối số và kiểm tra xem chúng có phải một tệp không:

```
for item in "$@"
do
   if [[ -f $item ]]; then
   echo "$item Là một tệp"
   fi
done
```
Output
```
[root@localhost ~]# ./test.sh 122 file1 file2 hieu.txt
file1 Là một tệp
file2 Là một tệp
hieu.txt Là một tệp
```
Ví dụ 2:
```
for (( i = 1; i <= $#; ++ i ))
do
 item=${@:$i:1}
 if [[ -f $item ]]; then
 echo "$item là một file"
 fi
done
```

### Section 23.5: Split string into an array in Bash(Tách chuỗi thành một mảng trong bash)
Giả sử chúng ta có một tham số string và chúng ta muốn chia nó bằng dấu cách.
```
string="học viện kỹ thuật mật mã"
```
* Để chia string này bằng dấu cách, chúng ta có thể sử dụng:
```
IFS=' ' read -r -a array <<< "$string"
```
Ở đây, IFS là một biến đặc biệt được gọi là dấu phân tách trường bên trong, xác định ký tự hoặc các ký tự để tách chuỗi ký tự hoặc mẫu xác định thành các thông báo cho một số hoạt động

* Để truy cập vào phần tử riêng lẻ:

```
echo "${array[0]}"
```
Output
```
[root@localhost ~]# ./test.sh
học
```
* Để truy cập vào các phần tử:
```
for i in "${array[@]}"
do
   echo "$i"
done
```
Output
```
[root@localhost ~]# ./test.sh
học
viện
kỹ
thuật
mật
mã
```
* Để nhận được cả chỉ mục và giá trị:
```
for index in "${!array[@]}"
do
 echo "$index ${array[index]}"
done
```
Output
```
[root@localhost ~]# ./test.sh
0 học
1 viện
2 kỹ
3 thuật
4 mật
5 mã
```




