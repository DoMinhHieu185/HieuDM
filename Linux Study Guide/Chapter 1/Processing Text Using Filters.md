# Processing Text Using Filters
### File-Combining Commands(Các lệnh kết hợp tệp)
Để xem một tệp văn bản, hãy sử dụng lệnh `cat` với cú pháp cơ bản như sau:
```
cat [OPTION]… [FILE]…
```

**Listing 1.27**:Sử dụng lệnh `cat` để hiển thị một tệp
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
AT14G
Yen Bai
```
Sử dụng lệnh cat nối 2 tệp để hiện thị nội dung 2 tệp
```
[root@localhost ~]# cat hieu.txt number.txt
Do Minh Hieu
AT14G
Yen Bai
1
18
5
1999
dsf
hieu
```

### File-Transforming  Commands(Lệnh chuyển đổi tệp)
#### Uncovering with `od`
Tiện ích od có thể hữu ích vì nó cho phép bạn hiển thị nội dung của tệp ở dạng bát phân (cơ số 8), hệ thập lục phân (cơ số 16), số thập phân (cơ số 10) và ASCII. Cú pháp cơ bản của nó như sau:
```
od [OPTION]... [FILE]...
```
Theo mặc định, od hiển thị văn bản của tệp ở dạng bát phân
* Ví dụ: Sử dụng lệnh `od` để hiển thị văn bản của tệp trong hệ bát phân
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
AT14G
Yen Bai
[root@localhost ~]# od hieu.txt
0000000 067504 046440 067151 020150 064510 072545 040412 030524
0000020 043464 054412 067145 041040 064541 000012
0000033
```
* Ví dụ: Sử dụng lệnh `od -cb` để hiển thị thông tin bổ sung
Sử dụng các tùy chọn -cb để hiển thị các ký tự trong tệp, cùng với vị trí byte bát phân của mỗi ký tự trong tệp văn bản.
```
[root@localhost ~]# od -cb hieu.txt
0000000   D   o       M   i   n   h       H   i   e   u  \n   A   T   1
        104 157 040 115 151 156 150 040 110 151 145 165 012 101 124 061
0000020   4   G  \n   Y   e   n       B   a   i  \n
        064 107 012 131 145 156 040 102 141 151 012
0000033
```

#### Separating with `split`
Một lệnh hay để sử dụng là `split`. Tiện ích này cho phép bạn chia một tệp lớn thành nhiều phần nhỏ hơn, rất tiện lợi khi bạn muốn nhanh chóng tạo một tệp văn bản nhỏ hơn để thử nghiệm. Cú pháp cơ bản cho lệnh `split` như sau:
```
split [OPTION]... [INPUT [PREFIX]]
```
* Ví dụ: Sử dụng lệnh `split -l` để chia tệp theo số dòng
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
AT14G
Yen Bai
[root@localhost ~]# split -l 1 hieu.txt dohieu
[root@localhost ~]# ls
anaconda-ks.cfg  dohieuaa  dohieuab  dohieuac  hieu.txt  number.txt  splitaa
[root@localhost ~]# cat dohieuaa
Do Minh Hieu
```
Lưu ý rằng ngay cả khi bạn chỉ định tên tệp mới (PREFIX), tiện ích tách sẽ gắn các ký tự bổ sung, chẳng hạn như aa và ab, vào tên, như được hiển thị trong ví dụ trên

### File-Formatting Commands(Lệnh định dạng tệp)
#### Organizing with `sort`
Tiện ích `sort` sắp xếp dữ liệu của tệp. Hãy nhớ rằng nó không thay đổi tệp gốc; chỉ có đầu ra được sắp xếp. Cú pháp cơ bản của lệnh này như sau:
```
sort [OPTION]... [FILE]...
```
* Ví dụ: Sử dụng lệnh `sort` để sắp xếp dữ liệu tệp
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
AT14G
Yen Bai
[root@localhost ~]# sort hieu.txt
AT14G
Do Minh Hieu
Yen Bai
```
Sử dụng `-n` để sắp xếp chữ trước rồi mới đến số
```
[root@localhost ~]# sort hieu.txt
05
18
1999
AT14G
Do Minh Hieu
Yen Bai
[root@localhost ~]# sort -n hieu.txt
AT14G
Do Minh Hieu
Yen Bai
05
18
1999
```

#### Numbering with `nl`
Một lệnh định dạng tệp hữu ích khác là tiện ích `nl` (tiện ích dòng số). Lệnh nhỏ này cho phép bạn đánh số các dòng trong tệp văn bản theo những cách hiệu quả. Nó thậm chí còn cho phép bạn sử dụng các biểu thức chính quy (được trình bày ở phần sau của chương này) để chỉ định những dòng nào cần đánh số. Cú pháp của lệnh nl khá đơn giản:
```
nl [OPTION]... [FILE]...
```
* Ví dụ: Sử dụng lệnh `nl` để thêm số vào các dòng không trống
```
[root@localhost ~]# nl hieu.txt
     1  Do Minh Hieu

     2  AT14G
     3  Yen Bai
     4  18

     5  05
     6  1999
```
* Ví dụ 2: Sử dụng lệnh `nl -ba` để đánh số tất cả các dòng tệp văn bản
```
[root@localhost ~]# nl -ba hieu.txt
     1  Do Minh Hieu
     2
     3  AT14G
     4  Yen Bai
     5  18
     6
     7  05
     8  1999
```

### File-Viewing Commands(Lệnh xem tệp)
#### Using `more` or `less`
* lệnh `more` và `less` được sử dụng để xem file dưới dạng cuộn
* bạn có thể chuyển tiếp qua tệp văn bản bằng cách nhấn phím cách (xuống một trang) hoặc phím Enter (xuống một dòng).
* Nhấn `Q` để thoát
* Với `less` bạn có thể cuộn lên xem lại

#### Looking at files with `head`
Một công cụ tiện dụng khác để hiển thị các phần của tệp văn bản là tiện ích head. Cú pháp lệnh head được hiển thị như sau:
```
head [OPTION]... [FILE]...
```
Theo mặc định, lệnh `head` hiển thị 10 dòng đầu tiên của tệp văn bản

* Ví dụ: Sử dụng lệnh head
```
[root@localhost ~]# head /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
```
tùy chọn -n được sử dụng để xem số dòng đầu theo ý muốn
* Ví dụ 2: Sử dụng lệnh head để hiện thị 2 dòng đầu
```
[root@localhost ~]# head -n 2 /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
```

#### Viewing Files with `tail`
Ngược lại với lệnh head, lệnh tail được sử dụng để xem số dòng cuối cùng của file. Mặc định là 10.
```
tail [OPTION]... [FILE]...
```
* Ví dụ: Sử dụng lệnh `tail`
```
[root@localhost ~]# tail /etc/passwd
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
polkitd:x:999:998:User for polkitd:/:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
hieu:x:1000:1000::/home/hieu:/bin/bash
tuan:x:1001:1001::/home/tuan:/bin/bash
```
Tùy chọn -n được sử dụng để xác định số dòng muốn hiển thị
* Ví dụ 2: Sử dung lệnh `tail` hiển thị 2 dòng cuối
```
[root@localhost ~]# tail -n 2 /etc/passwd
hieu:x:1000:1000::/home/hieu:/bin/bash
tuan:x:1001:1001::/home/tuan:/bin/bash
```

### File-Summarizing  Commands(Các lệnh tóm tắt tệp)
#### Counting with `wc`
Tiện ích dễ nhất và phổ biến nhất để xác định số lượng trong tệp văn bản là tiện ích wc. Cú pháp cơ bản của lệnh như sau:
```
wc [OPTION]... [FILE]...
```
Khi bạn đưa ra lệnh `wc` mà không có tùy chọn nào và chuyển cho nó một tên tệp, tiện ích sẽ hiển thị số dòng, từ và byte của tệp theo thứ tự đó
* Ví dụ: 
```
[root@localhost ~]# wc hieu.txt
 8  9 40 hieu.txt
```

#### Pulling Out Portions with `cut`
Sử dụng lệnh cut để cắt 1 số ký tự hoặc text để file hiển thị theo ý muốn.
```
[root@localhost ~]# head -n 2 /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
[root@localhost ~]# head -n 2 /etc/passwd | cut -d ":" -f 1,7
root:/bin/bash
bin:/sbin/nologin
```
Lệnh head hiển thị hai dòng đầu tiên của tệp mật khẩu. Tệp văn bản này sử dụng dấu hai chấm (:) để phân cách các trường trong mỗi bản ghi. Việc sử dụng lệnh cắt đầu tiên chỉ định dấu phân cách dấu hai chấm bằng cách sử dụng tùy chọn -d. Chú ý dấu hai chấm được đặt trong dấu ngoặc kép để tránh kết quả không như mong muốn. Tùy chọn -f chỉ định rằng chỉ các trường 1 (tên người dùng) và 7 (trình bao) mới được hiển thị.

#### Discovering Repeated Lines with `uniq`
Sử dụng uniq để loại bỏ các dòng trùng lặp trong 1 file.
```
[root@localhost ~]# cat dohieu.txt
hieu
hieu
hieu
do minh hieu
do minh hieu
at14
at14

[root@localhost ~]# uniq dohieu.txt
hieu
do minh hieu
at14

```
#### Digesting an MD5 Algorithm
Kiểm tra tính toàn vẹn của file sử dụng hàm băm MD5
```
[root@localhost ~]# md5sum dohieu.txt
3d913477550f98cdd8efd3b58329bd28  dohieu.txt
```

#### Securing Hash Algorithms
Thuật toán hàm băm an toàn (sha) cũng được sử dụng để xác minh tính toàn vẹn của file khi nó được sao chéo hoặc di chuyển sang 1 vị trí khác.
```
[root@localhost ~]# sha256sum dohieu.txt
251cfd7e3f339a5e336a4aa68d89a56bd4fa20219b6a563b7cdede396d2c78fe  dohieu.txt
[root@localhost ~]# sha512sum dohieu.txt
2b9e03b08f3ff9a9f9ae8f559fb963c8b2a33bc92c9ea49d2d7ed6b29817027390aef54642e5ee8509baeb179c24e1dc7be78ce69c24e631c392f1d132c481e6  dohieu.txt
```
