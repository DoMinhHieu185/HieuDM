# Cấu trúc điều khiển

|Toán tử tệp|Thông tin chi tiết|
|-|-|
|-e "$file"|Trả về true nếu tệp tồn tại.|
|-d "$file"|Trả về true nếu tệp tồn tại và là một thư mục|
|-f "$file"|Trả về true nếu tệp tồn tại và là tệp thông thường|
|-h "$file"|Trả về true nếu tệp tồn tại và là một liên kết tượng trưng|

|Bộ so sánh chuỗi|Thông tin chi tiết|
|-|-|
|-z "$str"|Đúng nếu độ dài của chuỗi bằng 0|
|-n "$str"|Đúng nếu độ dài của chuỗi khác 0|
|"$str" = "$str2"|Đúng nếu chuỗi $ str bằng chuỗi $ str2. Không tốt nhất cho số nguyên. Nó có thể hoạt động nhưng sẽ mâu thuẫn|
|"$str" != "$str2"|Đúng nếu các chuỗi không bằng nhau|

|Bộ so sánh số nguyên|Thông tin chi tiết|
|-|-|
|"$int1" -eq "$int2"|Đúng nếu các số nguyên bằng nhau|
|"$int1" -ne "$int2"|Đúng nếu các số nguyên không bằng|
|"$int1" -gt "$int2"|Đúng nếu int1 lớn hơn int 2|
|"$int1" -ge "$int2"|Đúng nếu int1 lớn hơn hoặc bằng int2|
|"$int1" -lt "$int2"|Đúng nếu int1 nhỏ hơn int 2|
|"$int1" -le "$int2"|Đúng nếu int1 nhỏ hơn hoặc bằng int2|

### Section 10.1: Conditional execution of command lists(Thực hiện có điều kiện các danh sách lệnh)
**Cách sử dụng thực thi có điều kiện của danh sách lệnh**

Bất kỳ lệnh, biểu thức hoặc hàm bên trong nào cũng như bất kỳ lệnh hoặc tập lệnh bên ngoài nào đều có thể được thực thi có điều kiện bằng cách sử dụng các toán tử && (và) và || (hoặc).

```
[root@localhost ~]# cd dohieu && pwd
/root/dohieu
[root@localhost dohieu]#  touch file-abc && ls
file-abc
```
```
[root@localhost ~]#  cat hieu.txt || echo "hello"
Do Minh Hieu
AT140612
Yen Bai
nghia lo
xem phim
18
05
1999
[root@localhost ~]#  cat hieudo.txt || echo "hello"
cat: hieudo.txt: No such file or directory
hello
```
```
[root@localhost ~]# cat list.txt  && pwd || echo "No such directory"
b
a
c
/root
[root@localhost ~]# cat file1  && pwd || echo "None file1"
cat: file1: No such file or directory
None file1
```
* Nếu thực hiện cat thành công thì sẽ thực hiện `pwd` và không thực hiện `echo`
* Nếu `cat` file không thành công thực hiện lệnh `echo`
```
cd my_directory && ls file1 || echo "No such directory"
```
* Nếu cd không thành công, ls bị bỏ qua và thực thi echo
* Nếu cs thành công, thực thi ls
  * Nếu ls thành công, echo bị bỏ qua
  * Nếu ls không thành công, echo được thực thi

**Tại sao sử dụng thực thi có điều kiện của danh sách lệnh**
* Thực thi có điều kiện nhanh hơn `if ... then` đó nhưng lợi thế chính của nó là cho phép các funtion và script thoát sớm, hoặc "ngắn mạch".
* Trong một số trường hợp, không phải dọn dẹp bất cứ thứ gì trước khi rời khỏi function. Lệnh return sẽ giải quyết mọi thứ trong function và thực thi nhận lại là thứ return trả về trên stack.
* Trở lại từ các chức năng hoặc thoát script càng sớm càng tốt, do đó có thể cải thiện hiệu suất và giảm tải hệ thống bằng cách tránh thực thi mã không cần thiết.

### Section 10.2: If statement(Câu lệnh if)
Tạo 1 file có nội dung:
```
a=$1
if [[ a -eq 1 ]]; then
 echo "giá trị a bằng 1"
elif [[ a -gt 1 ]]; then
 echo "Giá trị a lớn hơn 1"
else
 echo "$1"
fi
```
```
[root@localhost ~]# ./file 1
giá trị 1 bằng 1
[root@localhost ~]# ./file 10
Giá trị 10 lớn hơn 1
[root@localhost ~]# ./file 0
0
```
* Việc dùng fi để đóng là bắt buộc, nhưng có thể bỏ qua elif hoặc else hoặc các mệnh đề khác.

* Dấu chấm phẩy trước `then` là cú pháp tiêu chuẩn để kết hợp hai lệnh trên một dòng; chúng có thể được bỏ qua chỉ khi `then` được chuyển sang dòng tiếp theo
* Dấu ngoặc [[ không phải là một phần của cú pháp, nhưng được coi như một lệnh; Nó là mã thoát của lệnh khi được kiểm tra. Do đó, bạn phải luôn bao gồm các khoẳng trắng xung quanh dấu ngoặc.
* Điều này cũng có nghĩa là kết quả của bất kỳ lệnh nào cũng có thể được kiểm tra. Nếu exit code từ câu lệnh là không, tuyên bố được coi là đúng.
```
if grep "1" num.txt; then
 echo "1 was found"
else
 echo "1 was not found"
fi
```
Các biểu thức toán học, khi được đặt tên bên trong dấu ngoặc kép, cũng trả về 0 hoặc 1 theo cách tương tự
```
if (( $1 + 5 > 91 )); then
 echo "$1 là một số lơn hơn 86"
fi
```

### Section 10.3: Looping over an array(Vòng lặp qua một mảng)
* Vòng lặp for: Nó cho phép bạn lặp lại các biến có trong mảng.
Khai báo một mảng:

`arr=(a b c d e f)`

```
for i in "${arr[@]}";do
 echo "$i"
done
```

hoặc
```
for ((i=0;i<${#arr[@]};i++));do
 echo "${arr[$i]}"
done
```

Cả hai đều đưa râ kết quả:
```
a
b
c
d
e
f
```

* Vòng lặp while: thực thi một đoạn mã nếu biểu thức điều kiện đúng và chỉ dừng lại khi nó sai
```
arr=(a b c d e f)

i=0
while [ $i -lt ${#arr[@]} ];do
    echo "${arr[$i]}"
    i=$(expr $i + 1)
done
```

hoặc
```
arr=(a b c d e f)
i=0
while (( $i < ${#arr[@]} ));do
    echo "${arr[$i]}"
    ((i++))
done
```

Kết quả:
```
[root@localhost ~]# ./file
a
b
c
d
e
f
```

### Section 10.4: Using For Loop to List Iterate Over Numbers(Sử dụng vòng lặp For để liệt kê Lặp lại trên các số)
```
#! /bin/bash
for i in {1..10}
    do
    echo $i
done
```

*Output
```
[root@localhost ~]# ./file
1
2
3
4
5
6
7
8
9
10
```

### Section 10.5: continue and break(tiếp tục và ngắt)
Ví dụ cho continue
```
for i in [series]
do
    command 1
    command 2
        if (condition) # Điều kiện để nhảy qua command 3
            continue # Bỏ qua đến giá trị tiếp theo trong "series"
        fi
    command 3
done
```

Ví dụ cho break
```
for i in [series]
do
    command 4
    if (condition) # Điều kiện vòng lặp cho break
    then
        command 5 # Thực hiện lệnh nếu vòng lặp cần break
        break
    fi
    command 6 # 
done
```
**continue**: bỏ qua các lệnh còn lại bên trong phần thân của vòng lặp đi kèm cho lần lặp hiện tại và chuyển quyền điều khiển chương trình cho lần lặp tiếp theo của vòng lặp.
```
i=0

while [[ $i -lt 5 ]]; do
  ((i++))
  if [[ "$i" == '2' ]]; then
    continue
  fi
  echo "Number: $i"
done

echo 'All Done!'
```

Output
```
Number: 1
Number: 3
Number: 4
Number: 5
All Done!
```
**break**: lệnh kết thúc vòng lặp hiện tại và chuyển điều quyền điều khiển chương trình cho lệnh sau vòng lặp kết thúc. Nó được sử dụng để thoát vòng lặp for, while , until, select.
```
i=0

while [[ $i -lt 5 ]]
do
  echo "Number: $i"
  ((i++))
  if [[ $i -eq 2 ]]; then
    break
  fi
done

echo 'All Done!'
```
* Output
```
Number: 0
Number: 1
All Done!
```

### Section 10.6: Loop break(Ngắt vòng lặp)
* Break nhiều vòng lặp
```
arr=(a b c d e f)
for i in "${arr[@]}";do
  echo "$i"
  for j in "${arr[@]}";do
     echo "$j"
     break 2
  done
done
```
Output
```
a
a
```

* Ngắt vòng lặp đơn
```
arr=(a b c d e f)
  for i in "${arr[@]}";do
    echo "$i"
    for j in "${arr[@]}";do
      echo "$j"
      break
    done
done
```
Output
```
[root@localhost ~]# ./file
a
a
b
a
c
a
d
a
e
a
f
a
```

### Section 10.7: While Loop(Vòng lặp while)
While để thực hiện vòng lặp đi lặp lại của một danh sách các lệnh, miễn while thực thi thành công
```
while CONTROL-COMMAND; do CONSEQUENT-COMMANDS; done
```
```
#! /bin/bash
i=0
while [ $i -lt 5 ] #While i nhỏ hơn 5
do
echo "i is currently $i"
i=$[$i+1] #Không để khoảng trắng xung quanh dấu ngoặc. Điều này làm cho nó không phải là một biểu thức kiểm tra
done #ends vòng lặp
```
  > Chú ý rằng có khoảng trống xung quanh dấu ngoặc {[]} trong quá trình kiểm tra (sau câu lệnh while). Những không gian này là cần thiết.

Output
```
[root@localhost ~]# ./file
i is currently 0
i is currently 1
i is currently 2
i is currently 3
i is currently 4
```

### Section 10.8: For Loop with C-style syntax(Vòng lặp với cú pháp kiểu C)
Định dạng cơ bản của vòng lặp for kiểu C là:
```
for (( variable assignment; condition; iteration process ))
for (( gán biến; điều kiện; quá trình lặp ))
```
* Việc gắn biến trong vòng lặp for có có thể chứa khoảng trắng
* Các biến tên không được đặt trước $
```
#! /bin/bash
for (( i = 0; i < 4; i++ ))
do
 echo "Số lần lặp $i"
done
```
Output
```
[root@hdv ]# ./file 
Số lần lặp 0
Số lần lặp 1
Số lần lặp 2
Số lần lặp 3
```

### Section 10.9: Until Loop(Vòng lặp until)
Giống như tên của nó thực hiện cho đến khi điều kiện bằng true thì dừng
```
i=5
until [[ i -eq 10 ]]; do #Check điều kiện cho đến khi i =10
 echo "i=$i" #Print ra giá trị của i
 i=$((i+1)) #Tăng giá trị i + 1
done
```
* Output
```
[root@localhost ~]# ./file
i=5
i=6
i=7
i=8
i=9
```
* Khi i đạt đến 10, điều kiện trong vòng lặp cho đến khi trở thành đúng và vòng lặp kết thúc.

### Section 10.10: Switch statement with case(switch...case)
Đối với case statement(câu lệnh trường hợp) bạn có thể so khớp giá trị với một biến

Đối số được truyền vào case được mở rộng và gắp khớp với từng mẫu.

Nếu một kết quả được tìm thấy là phù hợp, các lệnh ;; được thực hiện. Lệnh case thường được sử dụng để đơn giản hóa các điều kiện phức tạp khi bạn có nhiều sự lựa chọn khác nhau sẽ giúp bạn làm cho các script của mình dễ đọc hơn và dễ bảo trì hơn.
```
#!/bin/sh

echo "Bạn muốn nói gì ..."
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	hello)
		echo "Xin chào!"
		;;
    "Who is")
		echo "My computer!"
		;;
	bye)
		echo "Hẹn gặp lại!"
		break
		;;
	*)
		echo "Sorry, Tôi không hiểu"
		;;
  esac
done
echo 
echo "Cám ơn!"
```
Output
```
[root@hdv ]# ./file 
Bạn muốn nói gì ...
hello
Xin chào!
Who is
My computer!
bye
Hẹn gặp lại!

Cám ơn!
```
Khi bạn gõ hello thì exec thực hiện trả về lệnh echo "Xin chào!", gõ bye bash sẽ thực thi echo "Hẹn gặp lại!"; break




