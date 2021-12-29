# Lệnh cut

|Tuỳ chọn|Mô tả|
|-|-|
|-b LIST, --bytes=LIST|In các byte được liệt kê trong tham số LIST|
|-c LIST, --characters=LIST|In các ký tự ở các vị trí được chỉ định trong tham số LIST|
|-f LIST, --fields=LIST|In các trường hoặc cột|
|-d DELIMITER|Được sử dụng để phân tách các cột hoặc trường|

Trong Bash, lệnh `cut` rất hữu ích để chia tệp thành nhiều phần nhỏ hơn.
### Section 57.1: Show the first column of a file(Hiển thị cột đầu tiên của tệp)
Giả sử bạn có tệp nội dung như sau:
```
Now call function 
First Name
Last Name
```
Tệp này có 3 cột được phân tách bằng dấu cách. Để chỉ lấy cột đầu tiên, hãy làm như sau.
```
cut -d ' ' -f1 filename
```
Flag -d, chỉ định dấu cách hoặc cái gì ngăn cách các bản ghi. flag -f chỉ định số trường hoặc số cột. Output
```
# cut -d ' ' -f1 filename 
Now
First
Last
```

### Section 57.2: Show columns x to y of a file(Hiển thị các cột từ x đến y của một tệp)
Đôi khi rất hữu ích khi hiển thị một loại các cột trong một tệp. Giả sử bạn có tệp này:
```
Hà Nội, Cầu Giấy, Trung Hòa, 2021, red
Hà Nội, Cầu Giấy, Dịch Vọng, 2000, red
Vĩnh Phúc, Phúc Yên, Phúc Thắng, 1993, green
```
Thực hiện lấy 3 cột đầu tiên ngăn cách nhau bằng dấu phẩy:
```
# cut -d ',' -f1-3 filename 
Hà Nội, Cầu Giấy, Trung Hòa
Hà Nội, Cầu Giấy, Dịch Vọng
Vĩnh Phúc, Phúc Yên, Phúc Thắng
```
