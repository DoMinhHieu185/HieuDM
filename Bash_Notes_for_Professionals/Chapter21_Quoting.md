# Quoting(Trích dẫn)
### Section 21.1: Double quotes for variable and command substitution(Dấu ngoặc kép cho biến và lệnh thay thế)
Các phép thay thế biến chỉ nên được sử dụng bên trong dấu ngoặc kép.
```
[root@localhost ~]# calculation='2 * 3'
[root@localhost ~]# echo "$calculation"
2 * 3
[root@localhost ~]# echo $calculation #In ra số 2 - In ra tất cả thư mục hiện tại - in số 3
2 anaconda-ks.cfg combined dohieu end_date file file1.sh file_all.gz fruits.txt hello.sh hieu.txt list.txt loi.txt output.txt pipeFolder start_date test.sh 3
[root@localhost ~]# echo "$(($calculation))"
6
```
Bên ngoài dấu ngoặc kép, $var nhận giá trị của var, chia nó thành các phần được phân tách bằng khoảng trắng và diễn giải mỗi phần dưới dạng một ký tự đại diện. Trừ khi bạn muốn hành vi này, hãy luôn đặt $var bên trong dấu ngoặc kép: "$var".

Điều tương tự cũng áp dụng cho các thay thế lệnh: "$(mycommand)" là đầu ra của mycommand.
```
[root@localhost ~]# echo "$(pwd)"
/root
[root@localhost ~]# echo "$(whoami)"
root
```
Câu lệnh thay thế có ngữ cảnh trích dẫn của riêng chúng. Viết các thay thế lồng vào nhau tùy ý rất dễ dàng vì trình phân tích cú pháp sẽ theo dõi độ rộng lồng nhau.
```
[root@localhost ~]# c=8
[root@localhost ~]#  echo "formatted text: $(printf "a + b = %04d" "${c}")"
formatted text: a + b = 0008
```

### Section 21.2: Difference between double quote and single quote(Sự khác biệt giữa dấu ngoặc kép và dấu ngoặc đơn.)
|Dấu ngoặc kép- `""`|Dấu ngoặc đơn- `''`|
|-|-|
|Cho phép mở rộng biến|Ngăn chặn mở rộng biến|
|Cho phép mở rộng lịch sử nếu được bật|Ngăn mở rộng lịch sử|
|Cho phép thay thế lệnh|Ngăn chặn thay thế lệnh|
|`*` và `@`có thể có nghĩa đặc biệt|`*` và `@` luôn là chính nó|
|Có thể chứa ngoặc đơn hoặc ngoặc kép|Không cho phép ngoặc đơn bên trong ngoặc đơn|
|`$`,`,",\ có thể thoát bằng `\` để ngăn ý nghĩa đặc biệt của chúng|Tất cả đều là chữ|

Thuộc tính chung cho cả hai:    
* Ngăn chăn hiện tượng globbing
* Ngăn tách từ

```
[root@localhost ~]# echo "!cat"
echo "cat text "
cat text 

[root@localhost ~]# echo '!cat'
!cat

[root@localhost ~]# a='var'
[root@localhost ~]# echo $a
var
[root@localhost ~]# echo '$a'
$a
[root@localhost ~]# echo "$a"
var
```

### Section 21.3: Newlines and control characters(Dòng mới và ký tự điều khiển)
Một dòng mới có thể được bao gồm trong một chuỗi được trích dẫn đơn hoặc chuỗi được trích dẫn kép. Lưu ý rằng dấu gạch chéo ngược-dòng mới khôngdẫn đến một dòng mới, ngắt dòng bị bỏ qua.
```
newline1='
'
newline2="
"
newline3=$'\n'
empty=\

echo "Line${newline1}break"
echo "Line${newline2}break"
echo "Line${newline3}break"
echo "No line break${empty} here"
```
Output
```
[root@localhost ~]# ./hello.sh
Line
break
Line
break
Line
break
No line break here
```
Bên trong chuỗi ký tự đô la, có thể sử dụng ký tự gạch chéo ngược hoặc hoặc dấu gạch chéo ngược bát phân để chèn các ký tự điều khiển giống như nhiều ngôn ngữ lập trình khác
```
[root@localhost ~]# echo $'Tab: [\t]'
Tab: [  ]

[root@localhost ~]# echo $'Tab again: [\009]'
Tab again: [

[root@localhost ~]# echo $'Form feed: [\f]'
Form feed: [
            ]

[root@localhost ~]# echo $'Line\nbreak'
Line
break
```

### Section 21.4: Quoting literal text(Trích dẫn văn bản theo đúng nghĩa gốc.)
Tất cả các ký tự đặc biệt được hiển thị dưới dòng sau:
```
!"#$&'()*;<=>? @[\]^`{|}~
```
Dấu gạch chéo ngược trích dẫn ký tự tiếp theo, tức là ký tự tiếp theo được hiểu theo nghĩa đen.
```
[root@localhost ~]#  echo \!\"\#\$\&\'\(\)\*\;\<\=\>\?\ \ \@\[\\\]\^\`\{\|\}\~
!"#$&'()*;<=>?  @[\]^`{|}~
```
Tất cả các văn bản giữa các dấu ngoặc đơn được in theo nghĩa gốc. Dấu gạch chéo ngược chẵn là viết tắt của chính nó, và khổng thể bao gồm một chích dẫn duy nhất; thay vào đó, bạn có thể dừng chuỗi ký tự, bao gồm một ngoặc đơn theo nghĩa đen với dấu gạch chéo ngược và bắt đầu lại chuỗi ký tự.
```
[root@localhost ~]# echo '!"#$&'\''()*;<=>? @[\]^`{|}~'
!"#$&'()*;<=>? @[\]^`{|}~
```
So sánh lại chuỗi ký tự sau khi in ra, 4 ký tự `'\''` cho phép cắt tách chuôi ký tự đặc biệt.
```
'!"#$&'	\''	()*;<=>? @[\]^`{|}~'
 !"#$&'		()*;<=>? @[\]^`{|}~
```


