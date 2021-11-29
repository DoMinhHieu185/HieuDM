# cp/scp - sao chép tệp / thư mục
### 1. Notes
```
cp source_file target_file

cp source_file ... target_directory

scp source_file {DOMAIN_NAME}\\{USER_NAME}@{HOST_NAME}:target_directory

scp {DOMAIN_NAME}\\{USER_NAME}@{HOST_NAME}:source_file target_directory
```

### 2. Examples
#### Sao chép tệp
* Tạo một bản sao mới của tệp1 và đổi tên thành tệp2
```
[root@localhost ~]# cat hieu.txt
Do Minh Hieu
18/05/1999
Yen Bai
Nghia Lo
[root@localhost ~]# cp hieu.txt hieu2.txt
[root@localhost ~]# cat hieu2.txt
Do Minh Hieu
18/05/1999
Yen Bai
Nghia Lo
```
* Sao chép tệp1 từ thư mục1 sang thư mục2 
```
[root@localhost ~]# cp folder/folder1/file1 folder/folder2/
[root@localhost ~]# cd folder/folder2
[root@localhost folder2]# ls
file1
```
* Sao chép tệp1 (đổi tên thành tệp2) từ thư mục1 sang thư mục2
```
[root@localhost ~]# cp folder/folder1/file1 folder/folder2/file2
[root@localhost ~]# cd folder/folder2
[root@localhost folder2]# ls
file1  file2
```
* Sao chép tất cả các tệp (không bao gồm các thư mục con và các tệp bắt đầu bằng dấu chấm (.)) Trong folder1 vào folder2
```
[root@localhost ~]# ls folder/folder1
file1  file2  file3  hieu.txt
[root@localhost ~]# ls folder/folder2
[root@localhost ~]# cp folder/folder1/* folder/folder2/
[root@localhost ~]# ls folder/folder2
file1  file2  file3  hieu.txt
```

#### Sao chép thư mục:
* Sao chép thư mục thư mục1 trong thư mục2
```
[root@localhost ~]# cp -R folder/folder1 folder/folder2/
[root@localhost ~]# cd folder/folder2
[root@localhost folder2]# ls
file1  file2  file3  folder1  hieu.txt
```
* Sao chép nội dung (tệp và thư mục con ngoại trừ tệp bắt đầu bằng dấu chấm (.)) Của thư mục thư mục1 sang thư mục2
```
[root@localhost folder]# ls folder2
[root@localhost folder]# ls folder1
file1  file2  file3  hieu.txt
[root@localhost folder]# cp -R folder1/* folder2/
[root@localhost folder]# ls folder2
file1  file2  file3  hieu.txt
```

### Sao chép an toàn tệp / thư mục(scp):
* Sao chép tệp từ xa vào thư mục cục bộ
```
[root@localhost ~]# scp hieu@192.168.1.147:/home/hieu/scp.txt /root/
hieu@192.168.1.147's password:
scp.txt                                                                                                   100%   36    31.1KB/s   00:00
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  file2  folder  hfile1  hieu  hieu2.txt  hieu.txt  scp.txt
[root@localhost ~]# cat scp.txt
Day la may co dia chi 192.168.1.147
```
* Sao chép một thư mục từ xa vào một thư mục cục bộ
```
[root@localhost ~]# scp -r hieu@192.168.1.147:/home/hieu/folder/folder1 /root/
hieu@192.168.1.147's password:
file1                                                                                                     100%    0     0.0KB/s   00:00
file3                                                                                                     100%    0     0.0KB/s   00:00
file2                                                                                                     100%    0     0.0KB/s   00:00
```
* Sao chép một tệp cục bộ vào một thư mục từ xa
```
[root@localhost ~]# scp ~/file1 hieu@192.168.1.147:/home/hieu
hieu@192.168.1.147's password:
file1                                                                                                     100%   33    29.3KB/s   00:00
```
* Sao chép một thư mục cục bộ vào một thư mục từ xa:
```
[root@localhost ~]# scp -r ~/dohieu hieu@192.168.1.147:/home/hieu
hieu@192.168.1.147's password:
```



