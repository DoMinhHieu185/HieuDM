# Cấu trúc điều khiển

|Toán tử tệp||Thông tin chi tiết|
|-||-|
|-e "$file"||Trả về true nếu tệp tồn tại.|
|-d "$file"||Trả về true nếu tệp tồn tại và là một thư mục|
|-f "$file"||Trả về true nếu tệp tồn tại và là tệp thông thường|
|-h "$file"||Trả về true nếu tệp tồn tại và là một liên kết tượng trưng|

|Bộ so sánh chuỗi||Thông tin chi tiết|
|-||-|
|-z "$str"||Đúng nếu độ dài của chuỗi bằng 0|
|-n "$str"||Đúng nếu độ dài của chuỗi khác 0|
|"$str" = "$str2"||Đúng nếu chuỗi $ str bằng chuỗi $ str2. Không tốt nhất cho số nguyên. Nó có thể hoạt động nhưng sẽ mâu thuẫn|
|"$str" != "$str2"||Đúng nếu các chuỗi không bằng nhau|

|Bộ so sánh số nguyên||Thông tin chi tiết|
|-||-|
|"$int1" -eq "$int2"||Đúng nếu các số nguyên bằng nhau|
|"$int1" -ne "$int2"||Đúng nếu các số nguyên không bằng|
|"$int1" -gt "$int2"||Đúng nếu int1 lớn hơn int 2|
|"$int1" -ge "$int2"||Đúng nếu int1 lớn hơn hoặc bằng int2|
|"$int1" -lt "$int2"||Đúng nếu int1 nhỏ hơn int 2|
|"$int1" -le "$int2"||Đúng nếu int1 nhỏ hơn hoặc bằng int2|

### Section 10.1: Conditional execution of command lists(Thực hiện có điều kiện các danh sách lệnh)
