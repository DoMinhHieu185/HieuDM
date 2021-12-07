# getopts : smart positionalparameter parsing(phân tích cú pháp tham số vị trí thông minh)

|Thông số|Chi tiết|
|-|-|
|optstring|Các ký tự tùy chọn được nhận dạng|
|name|Sau đó đặt tên nơi lưu trữ tùy chọn đã phân tích cú pháp|
`getopts` trong script: lấy các tùy chọn và đối số của chúng ta từ danh sách các tham số tuân theo cú pháp tùy chọn. Thông thường sử dụng `getopts` để phân tích các đối số được truyền vào cho chúng.

### Section 32.1: pingnmap
Tạo một file script có nôi dung như sau
```
#!/bin/bash
# Script name : pingnmap
# Tình huống: Quản trị viên hệ thống trong công ty phải liên tục làm
# việc với các câu lệnh ping và nmap, vì vậy quyết định đơn giản hóa 
# công việc bằng cách sử dụng một script
# Nhiệm vụ mà script sau khi viết xong phải làm được là
# 1. Ping - với tối đa 5 địa chỉ IP/tên miền. AND/OR
# 2. Kiểm tra xem một port cụ thể có đang mở với một tên miền/IP
# và getopts là để phân tích các đối số
# Tổng quan về các tùy chọn
# n : có nghĩa là nmap
# t : có nghĩa là ping 
# i : Tùy chọn để nhập địa chỉ IP
# p : Tùy chọn để nhập vào số của port 
# v : Tùy chọn để lấy ra phiên bản script

while getopts ':nti:p:v' opt
#Đưa ra: loại bỏ ngay từ đầu các lỗi không hợp lệ
do
case "$opt" in
    'i')ip="${OPTARG}" #Nếu opt = -i thì đặt ip bằng đối số theo sau nó
    ;;
    'p')port="${OPTARG}" #Nếu opt = -p thì đặt port bằng đối số theo sau nó
    ;;
    'n')nmap_yes=1; #opt có -n thì đặt biến nmap_yes=1
    ;;
    't')ping_yes=1; #opt có -t thì đặt biến ping_yes=1
    ;;
    'v')echo "pingnmap version 1.0.0"&& sleep 5  #Nếu có opt là -v thì thực hiện lệnh này luôn
    ;;
    *) echo "Invalid option $opt" # Còn nếu tất cả các case opt theo sau không đủ điều kiện trên thì thực hiện echo text sau.
    echo "Usage : "
    echo "pingmap -[n|t[i|p]|v]"
    ;;
esac
done
if [ ! -z "$nmap_yes" ] && [ "$nmap_yes" -eq "1" ] # nếu biến $nmap_yes có dữ liệu và bằng 1 mới thực hiện lệnh
then
    if [ ! -z "$ip" ] && [ ! -z "$port" ] # Nếu $ip và $port không bỏ trống thực hiện cmd trong then
    then
        nmap -p "$port" "$ip"
    fi
fi
if [ ! -z "$ping_yes" ] && [ "$ping_yes" -eq "1" ]  #Nếu $ping_yes không rỗng và =1 thực hiện cmd trong then
then
    if [ ! -z "$ip" ] #nếu $ip #0 thì thực hiện cmd then
    then
        ping -c 5 "$ip"
    fi
fi
shift $(( OPTIND - 1 )) # Xử lý các đối số bổ sung
if [ ! -z "$@" ]
    then
        echo "Đối số không có ở cuối : $@"
fi
```
