# chmod - thay đổi ACL của tệp (Danh sách kiểm soát truy cập)
### 1. Notes
```
chmod ACL file ...
```
* Lệnh chmod có thể được sử dụng để sửa đổi Danh sách kiểm soát truy cập (ACL) được liên kết với tệp và thư mục.
* Lệnh chmod cũng có thể được sử dụng để sửa đổi chế độ tệp của tệp và thư mục
* Nếu tệp / thư mục có ACL, dấu "+" sẽ được in khi sử dụng lệnh "ls -l".
* Mỗi tệp / thư mục có một ACL, chứa danh sách các mục nhập có thứ tự.
* Mỗi mục nhập đề cập đến một người dùng hoặc nhóm và cấp ("allow") hoặc từ chối ("deny") một tập hợp các quyền.
* Trong trường hợp người dùng và nhóm tồn tại có cùng tên, người dùng hoặc tên nhóm có thể được đặt trước bằng "user:" hoặc "group:".
* Nếu tên người dùng hoặc nhóm chứa khoảng trắng, bạn có thể sử dụng ':' làm dấu phân cách giữa tên và quyền.

### 2. Examples
* Thêm mục ACL mới cấp quyền " read", " write", " append" và " execute" cho "user1" trên tệp "file1"
```
[hieu@localhost ~]$ ls -l file1
-rwx------. 1 hieu hieu 0 Nov 22 14:40 file1
```
thay đổi quyền ACL
```
