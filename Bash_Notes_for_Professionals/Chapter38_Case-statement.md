# Case statement
### Section 38.1: Simple case statement(Câu lệnh trường hợp đơn giản)
Ở dạng đơn giản nhất được hỗ trợ bởi tất cả các phiên bản của bash, câu lệnh case thực thi trường hợp khớp với mẫu. ;; toán tử ngắt sau lần so khớp đầu tiên, nếu có.
```
#!/bin/bash
var=1
case $var in
1)
echo "Antartica"
;;
2)
echo "Brazil"
;;
3)
echo "Cat"
;;
esac
```
Output
```
[root@localhost ~]# ./test.sh
Antartica
```

### Section 38.2: Case statement with fall through
Kể từ bash 4.0, một toán tử mới `;&` đã được giới thiệu, cung cấp cơ chế hoạt động.
```
#!/bin/bash
var=1
case $var in
1)
echo "Antartica"
;&
2)
echo "Brazil"
;&
3)
echo "Cat"
;&
esac
```
Output
```
[root@localhost ~]# ./test.sh
Antartica
Brazil
Cat
```

### Section 38.3: Fall through only if subsequent pattern(s) match(Chỉ giảm nếu (các) mẫu tiếp theo khớp)
Kể từ Bash 4.0, một toán tử khác ;; & được giới thiệu cũng chỉ cung cấp nếu các mẫu trong (các) câu lệnh viết hoa tiếp theo, nếu có, khớp với
```
#!/bin/bash
var=abc
case $var in
a*)
echo "Antartica"
;;&
xyz)
echo "Brazil"
;;&
*b*)
echo "Cat"
;;&
esac
```
Output
```
[root@localhost ~]# ./test.sh
Antartica
Cat
```
Trong ví dụ dưới đây, abc khớp với cả trường hợp thứ nhất và thứ ba nhưng không khớp với trường hợp thứ hai. Vì vậy, trường hợp thứ hai không được thực hiện.