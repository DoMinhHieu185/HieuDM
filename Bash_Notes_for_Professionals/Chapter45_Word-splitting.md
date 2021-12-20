# Word splitting(Tách từ)
|Thông số|Chi tiết|
|-|-|
|IFS|Dấu tách trường nội bộ|
|-x|Các lệnh in và các đối số của chúng khi chúng được thực thi (Tùy chọn Shell)|
### Section 45.1: What, when and Why?
Khi shell thực hiện mở rộng tham số, thay thế lệnh, mở rộng biến hoặc số học nó sẽ quét các ranh giới từ trong kết quả. Nếu tìm thấy bất kỳ danh giới từ nào, thì kết quả sẽ được chia thành nhiều từ tại vị trí đó. Ranh giới từ được xác định bởi một biến shell IFS. Giá trị mặc định cho IFS la dấu cách, tab và dòng mới, tức là việc tách từ sẽ xảy ra trên ba ký tự khoảng trắng này nếu không được ngăn chặn một cách rõ ràng.
  > Sử dụng câu lệnh set để dặt hoặc bỏ đặt các giá trị của các tùy chọn shell và tham số vị trí. Bạn có thể thay đổi giá trị của các thuộc tính shell và tham số vị hoặc hiển thị tren và giá trị của các biến shell bằng lệnh set

```
set -x
var='I am
a
multiline string'
fun() {
 echo "-$1-"
 echo "*$2*"
 echo ".$3."
}
fun $var
```
Output
```
[root@localhost ~]# fun $var
-I-
*am*
.a.
```
Ví dụ trên, Hàm fun được thực thi $var được chia thành 5 args, chỉ I am và a được in ra.

### Section 45.2: Bad eects of word splitting(Các hiệu ứng xấu của việc tách từ)
### Section 45.3: Usefulness of word splitting(Tính hữu dụng của việc tách từ)
Có một số trường hợp tách từ có thể hữu ích:

Làm đầy mảng:
```
arr=($(grep -o '[0-9]\+' file))
```
  > Điều này sẽ điền vào arr với tất cả các giá trị số được tìm thấy trong tệp

Lặp các từ được phân tách bằng dấu cách:
```
words='foo bar baz'
for w in $words;do
 echo "W: $w"
done
```
Output
```
W: foo
W: bar
W: baz
```

### Section 45.4: Splitting by separator changes(Phân tách bằng các thay đổi về dấu phân tách)
Thực hiện thay thế đơn giản các dấu phân cách từ khoảng trắng sang dòng mới
```
[root@localhost ~]# sentence='1 2 3 4'
[root@localhost ~]# echo $sentence | tr " " "\n"
1
2
3
4
```
Nó tách giá trị và hiển thị nó từng dòng một.

### Section 45.5: Splitting with IFS(Phân tách với IFS)
Để rõ ràng hơn, hãy tạo một tệp lệnh có tên showarg:
```
#!/usr/bin/env bash
printf "%d args:" $#
printf " <%s>" "$@"
echo
```
Bây giờ xem sự khác biệt:
```
[root@localhost ~]# var="This is an example"
[root@localhost ~]# ./showarg $var
4 args: <This> <is> <an> <example>
```
 $var được chia thành 4 args. IFS là các ký tự khoảng trắng và do đó việc tách từ xảy ra trong khoảng trắng.
```
[root@localhost ~]# var="This/is/an/example"
[root@localhost ~]# ./showarg $var
1 args: <This/is/an/example>
```
Ở trên không xảy ra tách từ vì không tìm thấy ký tự IFS.

Bây giờ đặt IFS=/
```
[root@localhost ~]# IFS=/
[root@localhost ~]# var="This/is/an/example"
[root@localhost ~]# ./showarg $var
4 args: <This> <is> <an> <example>
```

### Section 45.6: IFS & word splitting(IFS và tách từ)
```
set -x
var='I am
a
multiline string'
IFS=' '
fun() {
 echo "-$1-"
 echo "*$2*"
 echo ".$3."
}
fun $var
```
output
```
[root@hd ~]# fun $var
-I-
*am
a
multiline*
.string.
```
Biến 1: I, biến 2:am a multiline, biến 3: string
```
[root@hd ~]# IFS=$'\n'
[root@hd ~]# fun $var
-I am-
*a*
.multiline string.
```
Phân tách bằng dòng mới
