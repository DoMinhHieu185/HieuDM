# Mảng
### Section 12.1: Array Assignments(Gán mảng)
**List Assignment - Gán vào list**
Bash sử dụng dấu cách để phân tách các phần tử trong mảng:
```
[root@localhost ~]# array=(1 2 3 4)
[root@localhost ~]# echo ${array[2]}
3
[root@localhost ~]# echo ${array[@]}
1 2 3 4
[root@localhost ~]# city=("Ha Noi" "HCM" "Da Nang" "Hai Phong")
[root@localhost ~]# echo ${city[@]}
Ha Noi HCM Da Nang Hai Phong
[root@localhost ~]# echo ${city[0]}
Ha Noi
[root@localhost ~]# echo ${city[3]}
Hai Phong
[root@localhost ~]# echo ${city[-1]}
Hai Phong
[root@localhost ~]# echo ${city[-2]}
Da Nang
```
* Trong dấu ngoặc vuông là thứ tự của phần trong mảng.
  * @: Lấy ra tất cả các phần tử trong mảng
  * Số nguyên dương là từ trái qua phải. Bắt đầu bằng 0 là phần tử đầu tiên
  * Số nguyên âm là lấy từ phải qua trải bắt đầu bằng -1

**Subscript Assignment**
Tạo một mảng với các chỉ số phần tử rõ ràng:
```
array=([3]='fourth element' [4]='fifth element')
```
**Assignment by index - Tạo mảng theo chỉ mục**
```
[root@localhost ~]# array[0]="dong mot"
[root@localhost ~]#  array[1]="dong hai"
[root@localhost ~]#  echo ${array[1]}
dong hai
```

**Assignment by name (associative array)-Tạo mảng theo tên**
`declare`: Là một lệnh dựng sẵn của bash shell. Nó được sử dụng để khai báo các biến và hàm shell, thiết lập các thuộc tính của chúng và hiển thị các giá trị của chúng.
```
[root@localhost ~]# declare -A array
[root@localhost ~]# array[first]='First element'
[root@localhost ~]# array[second]='Second element'
[root@localhost ~]# echo ${array[second]}
Second element
```
**Dynamic Assignment-Tạo mảng động**
Tạo một mảng từ đầu ra của lệnh khác, ví dụ: sử dụng seq để nhận phạm vi từ 1 đến 10:
```
array=(`seq 1 10`)
```
Phép gán từ các đối số đầu vào của tập lệnh:
```
array=("$@")
```
```
[root@localhost ~]# array1=(`seq 1 10`)
[root@localhost ~]#  echo ${array1[5]}
6
[root@localhost ~]#  echo ${array1[@]}
1 2 3 4 5 6 7 8 9 10
```

### Section 12.2: Accessing Array Elements(Truy cập các phần tử mảng)
Khai báo mảng và phần tử trong mảng:
```
array1=(`seq 1 10`)
```
In phần tử ở index 0
```
[root@localhost ~]#  echo ${array1[0]}
1
```
Lấy ra phần tử ở vị trí đầu tiên

In phần tử cuối cùng bằng cú pháp mở rộng chuỗi con
```
[root@localhost ~]# echo "${array1[@]: -1 }"
10
```
In phần tử cuối cùng bằng cú pháp chỉ số con
```
[root@localhost ~]# echo "${array1[-1]}"
10
```
In tất cả các phần tử, mỗi phần tử được trích dẫn riêng biệt
```
[root@localhost ~]# echo "${array1[@]}"
1 2 3 4 5 6 7 8 9 10
```
In tất cả các phần tử dưới dạng một chuỗi được trích dẫn duy nhất
```
[root@localhost ~]# echo "${array1[*]}"
1 2 3 4 5 6 7 8 9 10
```
In tất cả các phần tử từ chỉ mục 1, mỗi phần tử được trích dẫn riêng biệt
```
[root@localhost ~]# echo "${array1[@]:1}"
2 3 4 5 6 7 8 9 10
```
In 3 phần tử từ chỉ mục 1, mỗi phần tử được trích dẫn riêng biệt
```
[root@localhost ~]# echo "${array1[@]:1:3}"
2 3 4
```

**String Operations-Hoạt động chuỗi**
Nếu tham chiếu đến một phần tử, các phép toán chuỗi vd:
```
[root@localhost ~]# array2=(zero one two)
```
* `echo "${array2[0]:0:3}"`: Lấy ra phần tử đầu tiên, trong đó 0 khởi đầu và lấy 3 ký tự trong phần tử để in ra
```
[root@localhost ~]# echo "${array2[0]:0:3}"
zer
```
* `echo "${array2[3]:3:4}"`: Lấy ra phần tử thứ 3, và bắt đầu lấy từ vị trí thứ 1 và lấy 2 ký tự.
```
[root@localhost ~]# echo "${array2[2]:1:2}"
wo
```
  >vì vậy ${array[$i]:N:M} đưa ra một chuỗi từ vị trí thứ N (bắt đầu từ 0) trong chuỗi ${array[$i]} với M các ký tự sau

### Section 12.3: Array Modification(Sửa đổi mảng)
**Thay đổi chỉ mục**
Sửa đổi hoặc nhập một phần tử cụ thể trong mảng:
```
[root@localhost ~]# array[1]="number one"
[root@localhost ~]# echo "${array[1]}"
number one
```
Phần tử array[1]=one thay thế nó bằng array[1]="number one"

**Nối tiếp**
Sửa đổi mảng, thêm phần tử vào cuối nếu không có chỉ số con nào được chỉ định.
```
array+=('fourth element' 'fifth element')
```
Thay thế toàn bộ mảng bằng một danh sách tham số mới.
```
array=("${array[@]}" "fourth element" "fifth element")
```
Thêm một phần tử ở đầu:
```
array=("new element" "${array[@]}")
```

**Chèn**
Chèn một phần tử tại một chỉ mục nhất định:
```
[root@localhost ~]# arr=(a b c d)
[root@localhost ~]# i=2
[root@localhost ~]# arr=("${arr[@]:0:$i}" 'new' "${arr[@]:$i}")
[root@localhost ~]# echo "${arr[2]}"
new
[root@localhost ~]# echo "${arr[*]}"
a b new c d
```

**Xoá bỏ**
Xóa phần tử chỉ định
```
[root@localhost ~]# arr=(a b c)
[root@localhost ~]# echo "${arr[@]}"
a b c
[root@localhost ~]# echo "${!arr[@]}" #In ra vị trí phần tử
0 1 2
[root@localhost ~]# unset -v 'arr[1]' #Xoá phần tử ở vị trí thứ 1
[root@localhost ~]# echo "${arr[@]}"
a c
[root@localhost ~]# echo "${!arr[@]}"
0 2
```

**Hợp nhất**
```
array3=("${array1[@]}" "${array2[@]}")
```
* Ví dụ
```
[root@localhost ~]# array1=(1 2 3 4)
[root@localhost ~]# array2=(a b c d)
[root@localhost ~]# array3=("${array1[@]}" "${array2[@]}")
[root@localhost ~]# echo ${array3[@]}
1 2 3 4 a b c d
```

**Lập lại chỉ mục một mảng.**
Điều này hữu ích nếu mảng của bạn bị xóa và chỉ số chỉ mục index không theo một chuỗi nhất đinh. và bạn muốn sắp xếp lại theo tuần tự
```
array=("${array[@]}")
```

### Section 12.4: Array Iteration(Lặp lại mảng)
Lặp lại mảng có hai loại, foreach và for-loop 

Cho mảng a
```
a=(1 2 3 4)
```
* Vòng lặp foreach
```
for y in "${a[@]}"; do
    echo "$y"
done
```
* for-loop
```
for ((idx=0; idx < ${#a[@]}; ++idx)); do
    echo "${a[$idx]}"
done
```

### Section 12.5: Array Length(Độ dài mảng)
`${#array[@]}` cung cấp độ dài của mảng `${array[@]}`
```
[root@localhost ~]# echo ${#array3[@]}
8
[root@localhost ~]# echo ${array3[@]}
1 2 3 4 a b c d
```
Điều này cũng hoạt động với các Chuỗi trong các phần tử đơn lẻ:
```
[root@localhost ~]# echo ${#array3[2]}
1
```

### Section 12.6: Associative Arrays(Mảng liên kết)
**Khai báo một mảng kết hợp**
```
declare -A aa
```
Việc khai báo một mảng kết hợp trước khi khởi tạo hoặc sử dụng là bắt buộc.

**Khởi tạo các phần tử**
```
declare -A aa
aa[say]=hello
aa[cmd]=ls
aa["Key world"]="Hello World"
```
Hoặc
```
declare -A aa
aa=([say]=hello [cmd]=ls ["Key world"]="Hello World")
```

**Truy cập một phần tử mảng kết hợp**
```
[root@localhost ~]# echo ${aa[say]}
hello
[root@localhost ~]# echo ${aa[cmd]}
ls
```

**Liệt kê các khóa mảng kết hợp**
```
echo "${!aa[@]}"
```
```
[root@localhost ~]# echo "${!aa[@]}"
say Key world cmd
```

**Liệt kê các giá trị mảng kết hợp**
```
echo "${aa[@]}"
```
```
[root@localhost ~]# echo "${aa[@]}"
hello Hello World ls
```

**Lấy ra cả key và value của mảng kết hợp**
```
for key in "${!aa[@]}"; do
    echo  ${key} : ${aa[$key]}
done
```
* Output
```
[root@localhost ~]# for key in "${!aa[@]}"; do
>     echo  ${key} : ${aa[$key]}
> done
say : hello
Key world : Hello World
cmd : ls
```

**Đếm phần tử mảng kết hợp**
```
[root@localhost ~]# echo "${#aa[@]}"
3
```

### Section 12.7: Looping through an array(Vòng lặp qua một mảng.)
```
arr=(a b c d e f)
```
* Sử dụng vòng lặp for. Cho i chạy trong mảng arr và in ra i.
```
for i in "${arr[@]}"; do
 echo "$i"
done
```
Output
```
[root@localhost ~]# ./file
a
b
c
d
e
f
```

* Sử dụng vòng lặp C-style
```
for ((i=0;i<${#arr[@]};i++)); do
echo "${arr[$i]}"
done
```
Output
```
[root@localhost ~]# ./file
a
b
c
d
e
f
```

* Sử dụng while, $i khi nào nhỏ hơn hoặc bằng chỉ mục có trong mảng thì dừng lại:
```
i=0
while [ $i -lt ${#arr[@]} ]; do
 echo "${arr[$i]}"
 i=$((i + 1))
done
```
Output
```
[root@localhost ~]# ./file
a
b
c
d
e
f
```

### Section 12.8: Destroy, Delete, or Unset an Array(Destroy, Delete, unset một mảng)
Để destroy, delete hoặc unset một mảng:
```
unset array
```
Để destroy, delete hoặc unset một phần tử mảng:
```
unset array[10]
```

### Section 12.9: Array from string(Mảng từ chuỗi)
```
stringVar="Apple Orange Banana Mango"
arrayVar=(${stringVar// / })
```
```
[root@localhost ~]# echo ${!stringVar[*]}
0
[root@localhost ~]# echo ${!arrayVar[*]}
0 1 2 3
```
Mỗi khoảng trắng trong chuỗi biểu thị một mục mới trong mảng kết quả. $arrayVar có 4 chỉ mục độc lập.

Tương tự, các ký tự khác có thể được sử dụng cho dấu phân cách.
```
[root@localhost ~]# stringVar="Apple+Orange+Banana+Mango"
[root@localhost ~]# arrayVar=(${stringVar//+/ })
[root@localhost ~]# echo ${arrayVar[0]}
Apple
[root@localhost ~]# echo ${arrayVar[3]}
Mango
```

### Section 12.10: List of initialized indexes(Danh sách các chỉ mục được khởi tạo)
```
[root@localhost ~]# arr[2]='second'
[root@localhost ~]# arr[10]='tenth'
[root@localhost ~]# arr[25]='twenty five'
[root@localhost ~]#  echo ${!arr[@]}
2 10 25
```

### Section 12.11: Reading an entire file into an array(Đọc toàn bộ tệp thành một mảng)
Đọc trong một bước duy nhất
```
IFS=$'\n' read -r -a arr < file
```
Đọc trong một vòng lặp:
```
arr=()
while IFS= read -r line; do
 arr+=("$line")
done
```
Sử dụng mapfile hoặc readarray 
```
mapfile -t arr < file
```
hoặc
```
readarray -t arr < file
```
* Output
```
[root@localhost ~]# cat file
1 2 3 4 5 6 7 8 9
```
```
[root@localhost ~]# echo ${arr[@]}
1 2 3 4 5 6 7 8 9
```

### Section 12.12: Array insert function(Function chèn mảng)
Funtion sẽ chèn một phần tử vào một mảng tại một chỉ mục duy nhất:
