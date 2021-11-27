# Các ký tự đặc biệt
### 1. Examples
Dấu ngoặc kép ký tự (") được sử dụng để phân tách một giá trị chuỗi.

Nếu chuỗi chứa các ký tự đặc biệt ($, \), chúng sẽ được diễn giải trước khi trả về kết quả cuối cùng.
```
[root@localhost ~]# var1=hieu
[root@localhost ~]# echo "do minh $var1 \$notvar"
do minh hieu $notvar
```
Dấu nháy đơn ký tự (') được sử dụng để phân tách một giá trị chuỗi.

Nếu chuỗi chứa các ký tự đặc biệt ($, \), chúng sẽ không được diễn giải và chúng sẽ được trả về như trong kết quả cuối cùng.
```
[root@localhost ~]# var1=hieu

[root@localhost ~]# echo 'do minh $var1 \$notvar'
do minh $var1 \$notvar
```
Dấu trọng âm của ký tự (`) được sử dụng để phân tách một giá trị chuỗi.

Toàn bộ chuỗi sẽ được diễn giải trước khi trả về kết quả cuối cùng.
```
[root@localhost ~]# echo `date | tr [A-Z] [a-z]`
fri nov 26 15:07:02 +07 2021
```
