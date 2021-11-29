# Chapter 22: Conditional Expressions(Biểu thức có điều kiện)
### Section 22.1: File type tests(kiểm tra loại tệp)
Toán tử điều kiện `-e` kiểm tra xem tệp có tồn tại hay không(bao gồm tất cả các loại tệp thư mục, ...).
```
[root@localhost ~]# filename=hieu.txt
[root@localhost ~]# if [[ -e $filename ]]; then
> echo "$filename ton tai trong thu muc $(pwd)"
> fi
hieu.txt ton tai trong thu muc /root
```
Các kiểm tra cho các loại tệp cụ thể.
```
if [[ -f $filename ]]; then
 echo "$filename là một tệp thông thường"
elif [[ -d $filename ]]; then
 echo "$filename là một thư mục"
elif [[ -p $filename ]]; then
 echo "$filename là một named pipe"
elif [[ -S $filename ]]; then
 echo "$filename is a named socket"
elif [[ -b $filename ]]; then
 echo "$filename is a block device"
elif [[ -c $filename ]]; then
 echo "$filename is a character device"
fi
if [[ -L $filename ]]; then
 echo "$filename is a symbolic link (to any file type)"
fi
```
Đối với một liên kết tượng trưng, ngoài -L, những kiểm tra này áp dụng cho mục tiêu và trả về false cho một liên kết bị hỏng.
```
if [[ -L $filename || -e $filename ]]; then
 echo "$filename tồn tại (nhưng có thể là một liên kết tượng trưng bị hỏng.)"
fi
if [[ -L $filename && ! -e $filename ]]; then
 echo "$filename là một liên kết tượng trưng bị hỏng."
fi
```

### Section 22.2: String comparison and matching( So sánh và sự tương đương của chuỗi)
So sánh chuỗi sử dụng toán tử == giữa các chuỗi được chích dẫn. Toán tử != nếu chuỗi không giống nhau.
```
[root@localhost ~]# string1="hello world"
[root@localhost ~]# string2="hello world"
[root@localhost ~]# string3="Hello World"
[root@localhost ~]# if [[ "$string1" == "$string2" ]]; then
> echo "\$string1 va \$string2 giong nhau"
> fi
$string1 va $string2 giong nhau
[root@localhost ~]#
[root@localhost ~]# if [[ "$string1" != "$string3" ]]; then
> echo "\$string1 va \$string3 khong giong nhau"
> fi
$string1 va $string3 khong giong nhau
```
Ví dụ 2:
```
string='abc'
pattern1='a*'
pattern2='x*'
if [[ "$string" == $pattern1 ]]; then
    echo "Chuỗi $string khớp với mẫu $pattern"
fi
if [[ "$string" != $pattern2 ]]; then
    echo "Chuỗi $string không khớp với $pattern"
fi
```
Output
```
[root@localhost ~]# ./test.sh
Chuoi abc khop voi mau
Chuoi abc khong khop mau
```
Các toán tử `<` và `>` so sánh các chuỗi theo thứ tự từ vựng (không có toán tử nào nhỏ hơn hoặc bằng hoặc lớn hơn hoặc bằng cho các chuỗi).

Có các bài kiểm tra một lần cho chuỗi trống
```
if [[ -n "$string" ]]; then
 echo "$string is không rỗng"
fi
if [[ -z "${string// }" ]]; then
 echo "$string Trống hoặc chỉ có chứa khoảng trắng"
fi
if [[ -z "$string" ]]; then
 echo "$string rỗng"
fi
```
Ở trên, dấu kiểm `-z` có thể có nghĩa là `$string` chưa được đặt(unset) hoặc nó được đặt thành một chuỗi trống. Để phân biệt giữa trống và chưa đặt(unset), hãy sử dụng:
```
if [[ -n "${string+x}" ]]; then
 echo "$string được đặt, có thể là chuỗi rỗng."
fi
if [[ -n "${string-x}" ]]; then
 echo "$string chưa được đặt hoặc có thể là một chuỗi rỗng"
fi
if [[ -z "${string+x}" ]]; then
 echo "$string is unset"
fi
if [[ -z "${string-x}" ]]; then
 echo "$string được đặt thành một chuỗi rỗng"
fi
```
|$string is: | unset | empty | non-empty |
|-|-|-|-|
| [[ -z ${string} ]] | true | true | false |
| [[ -z ${string+x} ]] | true | false | false |
| [[ -z ${string-x} ]] | false | true | false |
| [[ -n ${string} ]] | false | false | true |
| [[ -n ${string+x} ]] | false | true | true |
| [[ -n ${string-x} ]] | true | false | true |

### Section 22.3: Test on exit status of a command(Kiểm tra trạng thái thoát lệnh)
Để kiểm tra trạng thái thoát của lệnh:
```
if command;then
echo 'success'
else
echo 'failure'
fi
```
* Ví dụ
```
[root@localhost ~]# if ping google.em; then
> echo 'thanh cong'
> else
> echo 'that bai'
> fi
ping: google.em: Name or service not known
that bai

[root@localhost ~]# if ping google.com; then
> echo 'thanh cong'
> else
> echo 'that bai'
> fi
PING google.com (142.250.204.142) 56(84) bytes of data.
64 bytes from hkg07s41-in-f14.1e100.net (142.250.204.142): icmp_seq=1 ttl=128 time=102 ms
64 bytes from hkg07s41-in-f14.1e100.net (142.250.204.142): icmp_seq=2 ttl=128 time=83.1 ms
64 bytes from hkg07s41-in-f14.1e100.net (142.250.204.142): icmp_seq=3 ttl=128 time=69.8 ms
64 bytes from hkg07s41-in-f14.1e100.net (142.250.204.142): icmp_seq=4 ttl=128 time=81.6 ms
^C
--- google.com ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3032ms
rtt min/avg/max/mdev = 69.837/84.188/102.126/11.572 ms
thanh cong
```

### Section 22.4: One liner test
Bạn có thể làm như sau:
```
[[ $s = 'something' ]] && echo 'phù hợp' || echo "không phù hợp"
[[ $s == 'something' ]] && echo 'phù hợp' || echo "không phù hợp"
[[ $s != 'something' ]] && echo "không phù hợp" || echo "phù hợp"
[[ $s -eq 10 ]] && echo 'equal' || echo "not equal"
(( $s == 10 )) && echo 'equal' || echo 'not equal'
```
```
command && echo 'exited with 0' || echo 'non 0 exit'
cmd && cmd1 && echo 'Lệnh thành công' || echo 'Trong số đó có lệnh không thành công'
cmd || cmd1 # nếu cmd không thành công thực hiện cmd1
```

### Section 22.5: File comparison(so sánh tệp)
```
if [[ $file1 -ef $file2 ]]; then
 echo "$file1 và $file2 là cùng một tệp."
fi
```
“Tệp giống nhau” có nghĩa là việc sửa đổi một trong các tệp tại chỗ sẽ ảnh hưởng đến tệp còn lại. Hai tệp có thể giống nhau ngay cả khi chúng có tên khác nhau, chẳng hạn nếu chúng là liên kết cứng hoặc nếu chúng là liên kết tượng trưng với cùng một mục tiêu hoặc nếu một là một liên kết tượng trưng trỏ đến tệp kia.

Nếu hai tệp có cùng nội dung, nhưng chúng là các tệp riêng biệt (để việc sửa đổi một tệp không ảnh hưởng đến tệp kia), thì `-ef` báo cáo chúng là khác nhau. Nếu bạn muốn so sánh hai tệp từng byte, hãy sử dụng tiện ích `cmp`
```
if cmp -s -- "$file1" "$file2"; then
 echo "$file1 và $file2 có nội dung giống nhau"
else
 echo "$file1 và $file2 khác nhau"
fi
```
```
[root@localhost ~]# if cmp -s -- ./file1 ./file2; then  echo "file1 và file2 có nội dung giống nhau"; else  echo "file1 và file2 khác nhau"; fi
file1 và file2 có nội dung giống nhau
```
Để tạo ra một danh sách có thể đọc được của con người về sự khác biệt giữa các tệp văn bản, hãy sử dụng tiện ích diff

```
if diff -u ./file1 ./file2; then
    echo "$file1 and $file2 có nội dung giống nhau"
else
    :  #sự khác biệt giữa các tệp đã được liệt kê
fi
```
Output
```
[root@localhost ~]# if diff -u ./file1 ./file2; then
>     echo "$file1 and $file2 có nội dung giống nhau"
> else
>     :
> fi
--- ./file1     2021-11-29 10:58:32.076256851 +0700
+++ ./file2     2021-11-29 11:01:13.830262544 +0700
@@ -1 +1 @@
-hieu
+tuan
```
Sự khác biệt giữa các tệp được liệt kê.

### Section 22.6: File access tests(Kiểm tra quyền truy cập tệp)
```
if [[ -r $filename ]]; then
 echo "$filename là một tệp có thể đọc được"
fi
if [[ -w $filename ]]; then
 echo "$filename là một tệp có thể ghi"
fi
if [[ -x $filename ]]; then
 echo "$filename Là một tệp có thể thực thi"
fi
```
Output
```
[root@localhost ~]# ./test.sh
./test là một tệp có thể đọc được
./test là một tệp có thể ghi
./test Là một tệp có thể thực thi

[root@localhost ~]# ./test.sh
hieu.txt là một tệp có thể đọc được
hieu.txt là một tệp có thể ghi
```
Các bài kiểm tra này tính đến quyền và quyền sở hữu để xác định liệu script (hoặc các chương trình được khởi chạy từ script) có thể truy cập tệp hay không.

### Section 22.7: Numerical comparisons(So sánh số)
So sánh số sử dụng các toán tử so sánh:
```
if [[ $num1 -eq $num2 ]]; then
 echo "$num1 == $num2"
fi
if [[ $num1 -le $num2 ]]; then
 echo "$num1 <= $num2"
fi
```
Các toán tử số:

* -eq: bằng
* -ne: Không bằng
* -le: Nhỏ hơn hoặc bằng
* -lt: Nhỏ hơn
* -ge: Lớn hơn hoặc bằng
* -gt: Lớn hơn

Lưu ý rằng các toán tử `<` và `>` bên trong `[[...]]` so sánh các chuỗi, không phải số.

