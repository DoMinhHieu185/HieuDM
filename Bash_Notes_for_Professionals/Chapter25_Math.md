# Chapter 25: Math
### Section 25.1: Math using dc
`dc` là một trong những chương trình lâu đời nhất trên Unix

Nó sử dụng ký hiệu đánh bóng ngược , có nghĩa là trước tiên bạn xếp chồng các số, sau đó là các phép toán. Ví dụ `1 + 1` làđược viết dưới dạng `1 1+` 

Để in một phần tử từ đầu ngăn xếp, hãy sử dụng lệnh `p`
```
[root@localhost ~]# echo "1 1 + p" | dc
2
```
Hoặc
```
[root@localhost ~]# dc <<< '2 3 + p'
5
```
Bạn có thể in phần tử trên cùng nhiều lần
```
[root@localhost ~]# dc <<< '2 3 + p 3 + p'
5
8
```
Đối với số âm, hãy sử dụng tiền tố _
```
[root@localhost ~]# dc <<< '_1 p'
-1
```
Bạn cũng có thể sử dụng các chữ cái viết hoa từ A đến F cho các số từ 10 đến 15 và . như một dấu thập phân
```
[root@localhost ~]# dc <<< 'B.4 p'
10.4
```
`dc` đang sử dụng độ chính xác dự phòng có nghĩa là độ chính xác chỉ bị giới hạn bởi bộ nhớ khả dụng. Theo mặc định,độ chính xác được đặt thành 0 số thập phân
```
[root@localhost ~]# dc <<< '4 3 / p'
1
```
Chúng ta có thể tăng độ chính xác bằng lệnh k . 2k sẽ sử dụng
```
[root@localhost ~]# dc <<< '2k 4 3 / p'
1.33
```
```
[root@localhost ~]# dc <<< '4k 4 3 / p'
1.3333
```
Bạn cũng có thể sử dụng nó trên nhiều dòng
```
root@localhost ~]# dc << EOF
> 1 1 +
> 3 *
> p
> EOF
6
```

### Section 25.2: Math using bash capabilities
* Phép nhân
```
[root@localhost ~]# echo $((5 * 2))
10
```
* Phân số
```
[root@localhost ~]# echo $((5 / 2))
2
```
* Modulo
```
[root@localhost ~]# echo $((5 % 2))
1
```
* Luỹ thừa
```
[root@localhost ~]# echo $((5 ** 2))
25
```

### Section 25.3: Math using bc
`bc` là một ngôn ngữ máy tính chính xác tùy ý. Nó có thể được sử dụng tương tác hoặc được thực thi từ dòng lệnh.

Ví dụ, nó có thể in ra kết quả của một biểu thức
```
[root@localhost ~]# echo '2 + 3' | bc
5
```
Đối với số thập phân, bạn có thể nhập thư viện chuẩn `bc -l` 
```
[root@localhost ~]# echo '12 / 5' | bc -l
2.40000000000000000000
```
Nó có thể được sử dụng để so sánh các biểu thức
```
[root@localhost ~]# echo '8 > 5' | bc
1
[root@localhost ~]# echo '8 == 5' | bc
0
```

### Section 25.4: Math using expr
