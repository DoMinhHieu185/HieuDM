# tar - thao tác lưu trữ băng
### 1. Notes
```
tar {-c} [options] [-f archive-file] [files | directories]

tar {-r | -u} [options] [-f archive-file] [files | directories]

tar {-t | -x} [options] [-f archive-file]
```
Bạn có thể sử dụng các tùy chọn ' -z ' hoặc ' -j ' để chuyển hướng đầu ra đến các lệnh gzip hoặc bzip2 để nén.

Bạn có thể sử dụng `gzip` và `gunzip` để nén và giải nén các tệp lưu trữ: gzip -- compression/decompression

### 2. Examples
* Tạo tệp lưu trữ
  * Lưu trữ một thư mục:
```
[root@localhost ~]# tar -cf nen1.tar folder
[root@localhost ~]# ls
anaconda-ks.cfg  dohieu  file1  folder  hello.sh  hfile1  hieu.txt  nen1.tar  pipeFolder  sfile1
```
Nội dung file lưu trữ
```
[root@localhost ~]# tar -tf nen1.tar
folder/
folder/file1
folder/file2
```
  * Chỉ lưu trữ nội dung của thư mục:
```
[root@localhost ~]# tar -cf nen2.tar folder/*
[root@localhost ~]# ls
anaconda-ks.cfg  dohieu  file1  folder  hello.sh  hfile1  hieu.txt  nen1.tar  nen2.tar  pipeFolder  sfile1
```
Nội dung file lưu trữ
```
[root@localhost ~]# tar -tf nen2.tar
folder/file1
folder/file2
```
* Sử dụng tùy chọn `-v` để hiển thị chi tiết bổ sung về nội dung lưu trữ:
```
[root@localhost ~]# tar -tvf nen2.tar
lrwxrwxrwx root/root         0 2021-11-21 15:54 folder/file1 -> file1
lrwxrwxrwx root/root         0 2021-11-21 15:54 folder/file2 -> file2
```

* Giải nén nội dung lưu trữ vào đĩa:
```
[root@localhost ~]# ls
anaconda-ks.cfg  file1  hello.sh  hieu.txt  nen1.tar  nen2.tar
[root@localhost ~]# tar -xf nen1.tar
[root@localhost ~]# ls
anaconda-ks.cfg  file1  folder  hello.sh  hieu.txt  nen1.tar  nen2.tar
```
```
[root@localhost ~]# ls -al folder/
total 0
drwxr-xr-x. 2 root root  32 Nov 21 15:54 .
dr-xr-x---. 5 root root 252 Nov 22 10:53 ..
lrwxrwxrwx. 1 root root   5 Nov 21 15:54 file1 -> file1
lrwxrwxrwx. 1 root root   5 Nov 21 15:54 file2 -> file2
```
  * Sử dụng tùy chọn `-m` để không trích xuất thời gian sửa đổi
```
[root@localhost ~]# tar -xmf nen1.tar
[root@localhost ~]# ls -al folder/
total 0
drwxr-xr-x. 2 root root  32 Nov 22 10:55 .
dr-xr-x---. 5 root root 252 Nov 22 10:55 ..
lrwxrwxrwx. 1 root root   5 Nov 22 10:55 file1 -> file1
lrwxrwxrwx. 1 root root   5 Nov 22 10:55 file2 -> file2
```

* Lưu trữ tệp và nén tệp bằng tùy chọn '-z'
```
[root@localhost ~]# tar -cvzf nen1.gz file1
file1
```
* Giải nén tệp và giải nén tệp lưu trữ bằng tùy chọn ' -z '
```
[root@localhost ~]# tar -xvzf nen1.gz -C folder
file1
```


