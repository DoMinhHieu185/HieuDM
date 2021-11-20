# wc - print word counts
### 1. Notes
`wc` in số từ
```
wc [OPTION]... [FILE]...
```
### 2. Examples
* Đếm tệp và thư mục
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  file2  file3  filex.cpio  folder  folder1  hfile1  hieu.txt
[root@localhost ~]# ls | wc -w
10
```
* Đếm số dòng trong một tệp
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
18/05/1999
Yen Bai
Nghia Lo
[root@localhost ~]# wc -l hieu.txt
4 hieu.txt
```
* In số ký tự
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
18/05/1999
Yen Bai
Nghia Lo
[root@localhost ~]# wc -m hieu.txt
41 hieu.txt
```
* In số byte
```
[root@localhost ~]# wc -c hieu.txt
41 hieu.txt
```
