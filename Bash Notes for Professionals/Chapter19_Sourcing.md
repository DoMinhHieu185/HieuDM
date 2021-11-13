# Sourcing
### Section 19.1: Sourcing a file(Tìm nguồn cung cấp tệp)
Tìm nguồn cung ứng với một tệp khác với việc thực thi, ở chỗ tất cả các lệnh được đánh giá trong ngữ cảnh của phiên bash hiện tại - điều này có nghĩa là bất kỳ biến, hàm hoặc bí danh nào được xác định sẽ tồn tại trong suốt phiên của bạn.

* Tạo một file test.sh
```
#!/bin/bash 
export A="alo 123"
alias sayhi="echo Hello Mygirl"
sayHello() {
 echo "Hello Everyone"
}
```
Từ phiên của bạn, thực hiện source file:
```
source test.sh
```
Bạn có thể sử dụng sẵn tài nguyên từ tệp vừa được hiện làm source Output:
```
[root@localhost ~]# echo $A
alo 123
[root@localhost ~]# sayhi
Hello Mygirl
[root@localhost ~]# sayHello
Hello Everyone
```
* Sử dụng cách sau có chức năng tương tự với `source`, đơn giản ngắn gọn hơn:
```
[root@localhost ~]# . test.sh
```

### Section 19.2: Sourcing a virtual environment(Tìm nguồn cung ứng môi trường ảo)
Khi phát triển một số ứng dụng trên máy, việc tách các phần phụ thuộc thành các phần phụ thuộc ra môi trường ảo sẽ trở nên hữu ích.

Với việc sử dụng virtualenv, các môi trường được lấy nguồn từ shell của bạn để khi bạn chạy một lệnh, nó đến từ môi trường ảo đó. Điều này được cài đặt phổ biến nhất bằng cách sử dụng `pip`.
```
pip install https://github.com/pypa/virtualenv/tarball/15.0.2
```
Tạo một môi trường mới
```
virtualenv --python=python3.5 my_env
```
Kích hoạt môi trường
```
source my_env/bin/activate
```