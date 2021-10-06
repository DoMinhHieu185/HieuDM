# Section 1.1: Hello Word
### Interactive Shell
* Bash Shell thường được sử dụng tương tác: Nó cho phép nhập và chỉnh sửa các lệnh, sau đó thực thi chúng khi bạn nhấn return. Nhiều hệ điều hành Unix-base và Unix-like làm bash mặc định (Đặc biệt là linux và MacOS). Thiết bị đầu cuối tự động nhập một chương trình Bash shell tương tác khi khởi động. Nhập hello world bằng cách gõ như sau:
```
[root@localhost ~]# echo "Hello Word"
Hello Word
```
  > * echo là một lệnh trong bash ghi các đối số mà nó nhận được vào đầu ra tiêu chuẩn. Nó thêm một dòng mới vào đầu ra.
  > * Bạn có thể thay đổi trình bao bằng cách nhập tên của trình bao trong thiết bị đầu cuối. Ví dụ: sh, bash, v.v.
### Non-Interactive Shell (Shell không tương tác)
Bash shell cũng có thể được chạy không tương tác từ một script, làm cho shell không cần sự tương tác của con người. Hành vi tương tác và hành vi theo tập lệnh phải giống hệt nhau - một cân nhắc thiết kế quan trọng của Unix V7 Bourne shell và tạm dịch là Bash. Do đó, bất cứ điều gì có thể được thực hiện tại dòng lệnh đều có thể được đưa vào một tệp kịch bản để sử dụng lại

Làm theo các bước để tạo một script Hello world:
* 