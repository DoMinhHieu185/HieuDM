# Chapter 23: Scripting with Parameters(Viết kịch bản với các tham số)

### Section 23.1: Multiple Parameter Parsing(Phân tích cú pháp nhiều tham số)
Để phân tích cú pháp nhiều tham số, cách ưu thích của việc này là sử dụng vòng lặp `while`, lệnh `case, shift`

`shift` được sử dụng để bật tham số đầu tiên trong chuỗi, làm cho giá trị trước là $2, bây giờ là $1. Điều này hữu ích cho các xử lý đỗi số tại một thời điểm
```
#!/bin/bash
# Load the user defined parameters
while [[ $# > 0 ]]
do
 case "$1" in
 -a|--valueA)
 valA="$2"
shift
;;
 -b|--valueB)
 valB="$2"
shift
;;
 --help|*)
 echo "Usage:"
echo " --valueA \"value\""
 echo " --valueB \"value\""
 echo " --help"
exit 1
;;
 esac
 shift
done
echo "A: $valA"
echo "B: $valB"
```