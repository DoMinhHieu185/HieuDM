# Đầu ra tập lệnh màu
### Section 50.1: color-output.sh
Trong phần mở đầu của tập lệnh bash, có thể xác định một số biến có chức năng như trình trợ giúp tô màu hoặc định dạng đầu ra đầu cuối trong quá trình chạy tập lệnh.

Các nền tảng khác nhau sử dụng các chuỗi khác nhau để thể hiện màu sắc. Tuy nhiên có 1 tiện ích được gọi là tput hoạt động trên tất cả hệ thống *nix và trả về chuỗi màu thiết bị đầu cuối dành riêng cho nền tảng thông minh qua 1 API đa nền tảng nhất quán.

Ví dụ: để lưu trữ chuỗi ký tự biến văn bản đầu cuối thành màu đỏ hoặc xanh lá cây:
```
red=$(tput setaf 1)
green=$(tput setaf 2)
```
Hoặc, để lưu trữ chuỗi ký tự đặt lại văn bản về giao diện mặc định:
```
reset=$(tput sgr0)
```
Sau đó, nếu bash script cần thiết để hiện thị các đầu ra có màu khác nhau, điều này có thể đạt được với:
```
echo "${green}{Success!${reset}" && echo "${red}Failure.${reset}"
```
