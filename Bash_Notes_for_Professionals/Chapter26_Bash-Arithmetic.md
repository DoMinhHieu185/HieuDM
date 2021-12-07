# Chapter 26: Bash Arithmetic
### Section 26.1: Simple arithmetic with (( ))(Số học đơn giản với (()))
```
#!/bin/bash
echo $((1 + 1))
```
output
```
[root@localhost ~]# ./test.sh
2
```
* Cách khác
```
#!/bin/bash
var1=5
var2=6
((output=$var1 * $var2))
printf "%d\n" "$output"
```
Output
```
[root@localhost ~]# ./test.sh
30
```

### Section 26.2: Arithmetic command(Lệnh số học)
* let
```
let num=1+2
let num="1+2"
let 'num= 1 + 2'
let num=1 num+=2
```
Bạn cần dấu ngoặc kép nếu có khoảng trắng hoặc ký tự nháy đơn. Vì vậy, chúng sẽ gặp lỗi
```
let num = 1 + 2 #wrong
let 'num = 1 + 2' #right
let a[1] = 1 + 1 #wrong
let 'a[1] = 1 + 1' #right
```
* (( ))
```
((a=$a+1)) #add 1 vào a
((a = a + 1)) #giống trên
((a += 1)) #giống trên
```
Chúng ta có thể sử dụng (()) trong if . Một số ví dụ
```
if (( a > 1 )); then echo "a is greater than 1"; fi
```
Đầu ra của (()) có thể được gán cho một biến
```
result=$((a + 1))
```
Hoặc được sử dụng trực tiếp trong đầu ra
```
echo "The result of a + 1 is $((a + 1))"
```

### Section 26.3: Simple arithmetic with expr(Số học đơn giản với expr)
```
#!/bin/bash
expr 1 + 2
```
Output
```
[root@localhost ~]# ./test.sh
3
```
