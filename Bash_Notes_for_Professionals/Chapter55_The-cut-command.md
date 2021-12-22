# The cut command(lệnh cut)
|Tham số|Chi tiết|
|-|-|
|-f, --fields|Lựa chọn dựa trên trường|
|-d, --delimiter|Dấu phân cách để lựa chọn dựa trên trường|
|-c, --characters|Lựa chọn dựa trên ký tự, dấu phân cách bị bỏ qua hoặc lỗi|
|-s, --only-delimited|Chặn dòng không có ký tự phân tách (được in dưới dạng khác)|
|--complement|Đảo ngược lựa chọn (trích xuất tất cả ngoại trừ các trường / ký tự được chỉ định|
|--output-delimiter|Chỉ định khi nào nó phải khác với dấu phân cách đầu vào|

Lệnh `cut` là một cách nhanh chóng để trích xuất các phần của dòng tệp văn bản. Nó thuộc về các lệnh Unix lâu đời nhất. Các triển khai phổ biến nhất của nó là phiên bản GNU được tìm thấy trên Linux và phiên bản FreeBSD trên MacOS, nhưng mỗi phiên bản Unix đều có đặc điểm riêng. Các dòng đầu được đọc từ stdin hoặc từ các tệp được liệt kê dưới dạng đối số trên dòng lệnh.

### Section 55.1: Only one delimiter character(Chỉ một ký tự phân cách)
Bạn không thể có nhiều hơn một ký tự phân tách, nếu bạn chỉ định một cái gì đó như `-d ":;,"`, một số triển khai sẽ chỉ sử dụng ký tự đầu tiên làm dấu phân tách(trong trường hợp này sẽ là dấu phẩy)
```
# cut -d ",;:" -f2 <<<"Đỗ Minh Hiếu, Thanh Xuân, Hà Nội, SĐT:0965510185; job:IT"
cut: the delimiter must be a single character
Try 'cut --help' for more information.
```

### Section 55.2: Repeated delimiters are interpreted as empty fields(Dấu phân cách lặp lại là một trường trống)
```
# cut -d, -f1,3 <<<"a,,b,c,d,e"
a,b
```
Khá rõ ràng, nhưng với các chuỗi được phân tách bằng dấu cach, nó có thể ít rõ rằng hơn:
```
# cut -d ' ' -f1,3 <<<"a  b c d e"
a b
```
`cut` không thủ được sử dụng để phân tích cú pháp các đối số như shell và và chương trình khác

### Section 55.3: No quoting(Không trích dẫn)
Không có cách nào để bảo vệ dấu phân cách. Bảng tính và phần mềm sử lý CSV tương tự thường có thể nhận ra một ký tự trích dẫn văn bản, điều này giúp bạn có thể xác định các chuỗi có chứa dấu phân cách. Với `cut` bạn không thể.
```
# cut -d, -f3 <<<'name,Smith,"1, Co Street"'
"1
```

### Section 55.4: Extracting, not manipulating(Trích xuất, không thao tác)
Bạn chỉ có thể trích xuất các phần của dòng, không thể sắp xếp lại hoặc lặp lại các trường.
```
[root@localhost ~]# cut -d, -f2,1 <<<'Do,Hieu,VN'
Do,Hieu
[root@localhost ~]# cut -d, -f2,2 <<<'Do,Hieu,VN'
Hieu
```
