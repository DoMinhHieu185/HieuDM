# Type of Shells
### Section 49.1: Start an interactive shell(Bắt đầu một trình bao tương tác)
```
bash
```

### Section 49.2: Detect type of shell(Phát hiện loại shell)
```
shopt -q login_shell && echo 'login' || echo 'not-login'
```
### Section 49.3: Introduction to dot files
Trong Unix, các tệp và thư mục bắt đầu bằng dấu chấm thường chứa các cài đặt cho một chương trình cụ thể/ một loạt của chương trình. Các tệp thường bị ẩn khỏi người dùng dùng, vì vậy bạn sẽ cần phải chạy lệnh ls -a để xem chúng.

Ví dụ tệp dot: .bash_history, chứa các lệnh được thực thi mới nhất, giả sử người dùng đang sử dụng bash.
