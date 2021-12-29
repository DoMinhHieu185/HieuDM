# Biến cục bộ và toàn cục
Theo mặc định, mọi biến trong bash là global- biến toàn cục đối với mọi hàm, tập lệnh và thậm chí cả bên ngoài nếu bạn đang khai báo các biến của bạn bên trong một tệp lệnh.

Nếu bạn muốn biến của mình là biến cục bộ cho một hàm, bạn có thể sử dụng local để biến đó trở thành một biến mới độc lập với phạm vi toàn cục và giá trị của nó sẽ chỉ có thể truy cập được bên trong hàm đó.

### Section 58.1: Global variables
```
var="hello"
function foo(){
    echo $var
}
foo
```
Sẽ xuất ra `"hello"`, nhưng điều này cũng hoạt động theo cách khác:
```
function foo() {
    var="hello"
}
foo
echo $var
```
Cũng sẽ xuất ra `hello`

### Section 58.2: Local variables
```
function foo() {
    local var
    var="hello"
}
foo
echo $var
```
Sẽ không xuất ra gì, vì var là một biến local của hàm foo và giá trị của nó không được nhìn thấy từ bên ngoài.

### Section 58.3: Mixing the two together(Trộn cả hai với nhau.)
```
var="hello"
function foo(){
    local var="sup?"
    echo "inside function, var=$var"
}
foo
echo "outside function, var=$var"
```

