# Mở rộng bằng ký hiệu
### Section 31.1: Modifying filename extension(Sửa đổi phần mở rộng tên tệp)
```
[root@localhost ~]# mv file1.{jar,zip}
```
Câu lệnh trên thực hiện đổi tên phần mở rộng của tệp filename một cách ngắn ngọn hơn thay vì phải thực hiện câu lệnh `mv filename.jar filename.zip`

### Section 31.2: Create directories to group files by month and year(Tạo thư mục để nhóm tên theo tháng và năm)
```
[root@localhost ~]# mkdir 20{18..21}-{01..09}
[root@localhost ~]# ls
2018-01  2018-05  2018-09  2019-04  2019-08  2020-03  2020-07  2021-02  2021-06  anaconda-ks.cfg               hieu.txt
2018-02  2018-06  2019-01  2019-05  2019-09  2020-04  2020-08  2021-03  2021-07  CentOS-7-x86_64-DVD-2009.iso  test.sh
2018-03  2018-07  2019-02  2019-06  2020-01  2020-05  2020-09  2021-04  2021-08  file1.jar
2018-04  2018-08  2019-03  2019-07  2020-02  2020-06  2021-01  2021-05  2021-09  file2
```
Bạn có thể đệm các số 0:
```
echo {0001..11}
0001 0002 0003 0004 0005 0006 0007 0008 0009 0010 0011
```

### Section 31.3: Create a backup of dotfiles(Tạo bản sao lưu các tệp dotfiles)
```
[root@localhost ~]# cp .bashrc{,.bak}
```
Điều này mở rộng thành lệnh `cp .bashrc .bashrc.bak`

### Section 31.4: Use increments(Sử dụng increments)
```
[root@localhost ~]# echo {0..10..2}
0 2 4 6 8 10
[root@localhost ~]# echo {0..100..50}
0 50 100
```
Tham số thứ 3 để chỉ định giá trị gia tăng, {start..end..increment}

Cũng có thể được áp dụng với chữ:
```
[root@localhost ~]# for x in {a..z..6}; do echo -n $x; done
agmsy
```

### Section 31.5: Using brace expansion to create lists(Sử dụng dấu ngoặc nhọn để tạo danh sách)
Bash có thể dễ dàng tạo danh sách từ các ký tự chữ và số.
```
[root@localhost ~]# echo {a..z}
a b c d e f g h i j k l m n o p q r s t u v w x y z
[root@localhost ~]# echo {0..10}
0 1 2 3 4 5 6 7 8 9 10
[root@localhost ~]# echo {a..d}{1..10}
a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10
```
Mở rộng theo dấu ngoặc kép là mở rộng đầu tiên diễn ra, vì vậy nó không thể được kết hợp với bất kỳ mở rộng nào khác.

Chỉ có thể sử dụng các ký tự và chữ số.

Điều này sẽ không hoạt động: `echo {$(date +$H)..24}`

### Section 31.6: Make Multiple Directories with Sub-Directories(Tạo nhiều thư mục với thư mục con)
```
[root@localhost ~]# mkdir -p dohieu/hieu/{folder1,folder2,folder3}
```
Thao tác này sẽ tạo một thư mục cao nhất **dohieu** , sau đó tạo thư mục **hieu** bên trong, sau đó bên trong các **hieu** bao gồm có 3 thư mục con : folder1, folder2, folder3 Output:
```
[root@localhost ~]# tree
.

├── dohieu
│   └── hieu
│       ├── folder1
│       ├── folder2
│       └── folder3
5 directories, 0 files
```
Và như thế. Tối thấy điều này rất hữu ích để tạo nhiều thư mục và thư mục con cho các thư mục đích cụ thể, chỉ với một lệnh bash.
