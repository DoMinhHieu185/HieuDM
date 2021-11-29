#  Groups
### 1. List the groups of the current process (groups)
* In các nhóm cho quy trình hiện tại
```
[root@localhost ~]# groups
root
```
* Bạn có thể in các nhóm của một người dùng cụ thể
```
[root@localhost ~]# groups hieu hieu4 hieu5
hieu : hieu
hieu4 : hieu4
hieu5 : hieu5
```

### 2. Add a new group (groupadd)
* Sử dụng lệnh groupadd để thêm một nhóm mới ( man groupadd ):
```
Usage: groupadd [options] GROUP

Options:
  -f, --force  thoát thành công nếu nhóm đã tồn tại
```
Examples:
* Tạo một nhóm có tên là "newgroup"
```
[root@localhost ~]# sudo groupadd newgroup

[root@localhost ~]# cat /etc/group | grep newgroup
newgroup:x:1006:
```

### 3. Delete a group (groupdel)
Examples:
* Xóa nhóm 
```
[root@localhost ~]# sudo groupdel newgroup
```


