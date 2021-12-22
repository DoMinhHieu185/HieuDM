# Typing variables(Nhập biến)
### Section 52.1: declare weakly typed variables(Khai báo các biến)
`declare` là một lệnh của bash. (Sử dụng help để sử dụng "manpage"). Nó được sử dụng để hiện thị và xác định các biến hoặc hiển thị các nội dung của funtion 
```
declare [options] [name[=value]]...
```

```
# Tùy chọn được sử dụng để xác định
# declare -i- Biến được định nghĩa là số nguyên
declare -i myInteger
declare -i anotherInt=10
# Một mảng có giá trị
declare -a anArray=( one two three)
# an assoc Array
declare -A assocArray=( [element1]="something" [second]=anotherthing )
# Lưu ý bash nhận ra ngữ cảnh trong dấu []

# Tồn tại một số bổ ngữ
# -u- Khi biến được gán một giá trị, tất cả các ký tự viết thường sẽ được
# chuyển đổi thành chữ hoa. Thuộc tính chữ thường bị tắt.
declare -u big='this will be uppercase'
# -l: Khi biến được gán một giá trị, tất cả các ký tự viết hoa sẽ được chuyển đổi thành chữ thường. Thuộc tính viết hoa bị tắt.
declare -l small='THIS WILL BE LOWERCASE'
# readonly array- Chỉ đọc mảng
declare -ra constarray=( eternal true and unchangeable )
# Xuất số nguyên ra môi trường
declare -xi importantInt=42
```
Để hiển thị các biến và/hoặc hàm, cũng có một số tùy chọn
```
# in ra các biến và function được xác định
declare -f
# Giới hạn đầu ra chỉ cho các chức năng
declare -F
```
