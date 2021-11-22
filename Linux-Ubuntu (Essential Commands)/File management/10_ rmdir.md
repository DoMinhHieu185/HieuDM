# rmdir - xóa thư mục
### 1. Notes
```
rmdir directory ...
```
Lệnh rmdir loại bỏ danh sách các thư mục đã cung cấp (chúng được loại bỏ theo thứ tự đã cho).

Thư mục phải trống để được xóa bằng rmdirlệnh.

Bạn phải nhập tất cả các thư mục con trước thư mục mẹ của chúng để có thể xóa tất cả chúng.

### 2. Examples
* Xóa một thư mục
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  folder1  hieu.txt
[root@localhost ~]# rmdir folder1
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  hieu.txt
```
Thư mục phải trống, nếu không, bạn sẽ gặp lỗi này: " rmdir: folder: Directory not empty".

* Xóa một thư mục và các thư mục con của nó:
```
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  folder  hieu.txt
[root@localhost ~]# rmdir folder/folder1 folder/folder2 folder
[root@localhost ~]# ls
anaconda-ks.cfg  configwp.sh  file1  hieu.txt
```
