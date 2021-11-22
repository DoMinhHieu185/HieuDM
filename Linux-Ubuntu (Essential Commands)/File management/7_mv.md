# mv - di chuyển tệp / thư mục
### 1. Notes
```
mv source_file target_file

mv source_file ... target_directory

mv source_directory ... target_directory
```
`target_file` có thể là tên tệp, thư mục (trong trường hợp này tệp sẽ được chuyển đến thư mục khác), hoặc tên thư mục / tệp (trong trường hợp này tệp sẽ được chuyển đến thư mục khác và được đổi tên).

Di chuyển một thư mục, sẽ di chuyển thư mục và tất cả nội dung của nó.

Khi di chuyển tệp và thư mục, số inode và dấu thời gian của các tệp và thư mục này không bị thay đổi.

### 2. Examples
* Di chuyển tệp
  * Di chuyển tệp1 từ thư mục1 sang thư mục2 
```
[root@localhost ~]# mv ~/scp.txt folder/
[root@localhost ~]# ls folder
folder1  folder2  scp.txt
```
  * Di chuyển tệp1 từ thư mục1 sang thư mục2
```
[root@localhost ~]# mv ~/file1 folder/doiten.txt
[root@localhost ~]# ls folder
doiten.txt  folder1  folder2  scp.txt
```
* Đổi tên tệp
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  dohieu  file2  folder  hieu  hieu.txt
[root@localhost ~]# mv file2 file1
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  dohieu  file1  folder  hieu  hieu.txt
```
* Di chuyển thư mục
```
[root@localhost ~]# cd folder
[root@localhost folder]# mv folder1/ folder2/
[root@localhost folder]# ls folder2
file1  file2  file3  folder1  hieu.txt
```
* Đổi tên thư mục:
```
[root@localhost folder]# mv folder2 folder3
[root@localhost folder]# ls
doiten.txt  folder3  scp.txt
```

