# Section 1.1: Hello Word
### Interactive Shell
* Bash Shell thường được sử dụng tương tác: Nó cho phép nhập và chỉnh sửa các lệnh, sau đó thực thi chúng khi bạn nhấn return. Nhiều hệ điều hành Unix-base và Unix-like làm bash mặc định (Đặc biệt là linux và MacOS). Thiết bị đầu cuối tự động nhập một chương trình Bash shell tương tác khi khởi động. Nhập hello world bằng cách gõ như sau:
```
[root@localhost ~]# echo "Hello Word"
Hello Word
```
  > * echo là một lệnh trong bash ghi các đối số mà nó nhận được vào đầu ra tiêu chuẩn. Nó thêm một dòng mới vào đầu ra.
  > * Bạn có thể thay đổi trình bao bằng cách nhập tên của trình bao trong thiết bị đầu cuối. Ví dụ: sh, bash, v.v.
### Non-Interactive Shell (Shell không tương tác)
Bash shell cũng có thể được chạy không tương tác từ một script, làm cho shell không cần sự tương tác của con người. Hành vi tương tác và hành vi theo tập lệnh phải giống hệt nhau - một cân nhắc thiết kế quan trọng của Unix V7 Bourne shell và tạm dịch là Bash. Do đó, bất cứ điều gì có thể được thực hiện tại dòng lệnh đều có thể được đưa vào một tệp kịch bản để sử dụng lại

Làm theo các bước để tạo một script Hello world:
* Tạo file mới có tên hello.sh: `touch hello.sh`
* Thêm quyền thực thi đối với file: `chmod +x hello.sh`
* Thêm code vào file hello.sh
```
#!/bin/bash
echo "Hello World"
```
  * Dòng 1 của tập lệnh phải bắt đầu bằng chuỗi ký tự #! được gọi là shebang1. Shebang hướng dẫn hệ điều hành chạy
  * Dòng 2 sử dụng echo để ghi Hello World vào đầu ra tiêu chuẩn
* Thực thi tập lệnh hello.sh từ dòng lệnh bằng cách sử dụng một trong các cách sau:
  * ./hello.sh - được sử dụng phổ biến nhất và được khuyến nghị
  * /bin/bash hello.sh
  * bash hello.sh - giả sử `/bin` nằm trong $PATH của bạn
  * sh hello.sh

Đối với việc sản xuất ra một sản phẩm thực sự, bạn sẽ bỏ qua phần mở rộng .sh và có thể di chuyển đến một thư mục trong path của bạn để nó có sẵn cho bạn sử dụng ở bất cứ thư mục nào. Giống như việc thực hiện cat hay ls.

Những sai lầm phổ biến bao gồm:
  * 1. Không áp dụng quyền thực thi trên tệp, chmod +x script.sh khi thực thi sẽ xuất hiện -bash: ./script.sh: Permission denied
  * 2. Chỉnh sửa tập lệnh trên Windows tạo ra các ký tự kết thúc dòng không chính xác mà Bash không thể xử lý
  * 3. Sử dụng sh ./hello-world.sh, không nhận ra rằng bash và sh là các shell riêng biệt với các tính năng riêng biệt (mặc dù vì Bash tương thích ngược nên sai lầm ngược lại là vô hại).

  Dù sao, chỉ cần dựa vào dòng shebang của script là rất thích hợp để viết rõ ràng bash hoặc sh (hoặc python hoặc perl hoặc awk hoặc ruby hoặc ...) trước tên tệp của mỗi script.
  
  Một dòng shebang phổ biến được sử dụng để làm cho script của bạn dễ di động hơn là sử dụng `#!/Usr/bin/env bash` thay vì mã hóa cứng một đường dẫn đến Bash. Bằng cách đó, `/usr/bin/env` phải tồn tại, nhưng ngoài thời điểm đó, bash chỉ cần nằm trên PATH của bạn. Trên nhiều hệ thống, / bin / bash không tồn tại và bạn nên sử dụng `/usr/local/bin/bash` hoặc một số đường dẫn tuyệt đối khác; thay đổi này tránh phải tìm ra chi tiết của điều đó.

# Section 1.2: Hello World Using Variables(Hello World Sử dụng các biến)
Tạo một tệp mới có tên `hello.sh` với nội dung sau và cấp cho nó quyền thực thi với `chmod + x hello.sh`.
  > Execute/Run via: ./hello.sh
```
#!/usr/bin/env bash
# Lưu ý rằng không thể sử dụng dấu cách xung quanh toán tử gán `=`
whom_variable="World"
# Sử dụng printf để xuất dữ liệu một cách an toàn
printf "Hello, %s\n" "$whom_variable"
```
Thao tác này sẽ in Hello, World ra đầu ra tiêu chuẩn khi được thực thi.

Để cho bash biết tập lệnh ở đâu, bạn cần phải rất cụ thể, bằng cách trỏ nó vào thư mục chứa, thông thường với ./ nếu đó là thư mục làm việc của bạn

Đoạn mã sau châp nhận một đối số $1 , là đối số dòng lệnh đầu tiên và xuất nó ra một chuỗi định dạng. Nôi dung tệp lệnh như sau:
  > Execute/Run via: ./hello.sh World
```
#!/usr/bin/env bash
printf "Hello, %s\n" "$1"
```
* Thực hiện lệnh với đối số là ký tự theo sao câu lệnh:
```
[root@localhost ~]# vi hello.sh
[root@localhost ~]# ./hello.sh Hieu
Hello, Hieu
[root@localhost ~]# ./hello.sh Do Hieu
Hello, Do
[root@localhost ~]# ./hello.sh "Do Hieu"
Hello, Do Hieu
[root@localhost ~]# ./hello.sh
Hello,
```
  * Câu lệnh 1, đối số bằng với một chuỗi
  * Câu lệnh 2, đối với chuỗi có phân cách nhau bằng dấu cách, đối số $1 chỉ được ứng với 1 chuỗi đầu tiền sau câu lệnh.
  * Để xử lý câu lệnh thứ 2 không hiện thị được chuỗi thì ta cần thêm dấu ngoặc kép cho câu lệnh
  * Câu lệnh 4 là không có đối số.

# Section 1.3: Hello World with User Input(Hello World với đầu vào của người dùng)
Phần sau sẽ nhắc người dùng nhập dữ liệu, rồi lưu trữ dữ liệu đầu vào đó dưới dạng chuỗi (văn bản) trong một biến. Sau đó, biến được sử dụng để đưa ra một thông báo cho người dùng.
```
#!/usr/bin/env bash
echo "Ten ban la gi?"
read name
echo "Ten toi la, $name."
```
Lệnh `read` ở đây đọc một dòng dữ liệu từ đầu vào chuẩn vào tên biến. Sau đó, điều này được tham chiếu bằng cách sử dụng $ name và được in ra chuẩn bằng cách sử dụng echo.

```
[root@localhost ~]# ./hello.sh
Ten ban la gi?
hieu
Ten toi la ,hieu
```

Nếu bạn muốn nối một cái gì đó vào giá trị biến trong khi in nó, hãy sử dụng dấu ngoặc nhọn xung quanh tên biến như được hiển thị trong ví dụ sau:
```
#!/usr/bin/env bash
echo "Ban dang lam gi do?"
read action
echo "Toi dang ${action} phim"
```
* Output
```
[root@localhost ~]# ./hello.sh
Ban dang lam gi do?
xem
Toi dang xem phim
```

# Section 1.4: Importance of Quoting in Strings (Tầm quan trọng của trích dẫn chuỗi)
Trích dẫn rất quan trọng đối với việc mở rộng chuỗi trong bash. Với những thứ này, bạn có thể kiểm soát cách bash phân tích cú pháp và mở rộng chuỗi của bạn.

Có hai loại trích dẫn:
  * Weak-Yếu: sử dụng dấu ngoặc kép: "
  * Strong-Mạnh: sử dụng dấu ngoặc kép: '
Nếu bạn muốn mở rộng đối số của mình, bạn có thể sử dụng Trích dẫn yếu:
```
#!/usr/bin/env bash
world="World"
echo "Hello $world"
```
* Output
```
[root@localhost ~]# ./hello.sh
Hello World
```
Nếu bạn không muốn mở rộng đối số, hãy sử dụng Strong qouting:
```
#!/usr/bin/env bash
world="World"
echo 'Hello $world'
```
* Output
```
[root@localhost ~]# ./hello.sh
Hello $world
```
Bạn cũng có thể sử dụng dấu \ để ngăn mở rộng:
```
#!/usr/bin/env bash
world="World"
echo "Hello \$world"
```
* Output
```
[root@localhost ~]# ./hello.sh
Hello $world
```

# Section 1.5: Viewing information for Bash built-ins(Xem thông tin cho tích hợp sẵn của Bash)
`help [command]`: Dùng để xe thông tin, cách sử dụng và các tùy chọn có trong câu lệnh

# Section 1.6: Hello World in "Debug" mode (Chế độ “Debug”)
```
[root@localhost ~]# cat hello.sh
#!/usr/bin/env bash
echo "Hello World"
[root@localhost ~]# bash -x hello.sh
+ echo 'Hello World'
Hello World
```
Đối số -x cho phép bạn xem qua từng dòng trong tập lệnh. Một ví dụ điển hình là :
```
#!/bin/bash
echo "Hello World\n"
adding_string_to_number="s"
v=$(expr 5 + $adding_string_to_number)
```
* Output
```
[root@localhost ~]# ./hello.sh
Hello world
expr: non-integer argument
```
Lỗi được nhắc ở trên không đủ để theo dõi tập lệnh; tuy nhiên, sử dụng cách sau sẽ giúp bạn hiểu rõ hơn về nơi tìm lỗi trong tập lệnh.

```
[root@localhost ~]# bash -x hello.sh
+ echo 'Hello world '
Hello world
+ adding_string_to_number=s
++ expr 5 + s
expr: non-integer argument
+ v=
```

# Section 1.7: Handling Named Arguments(Xử lý các đối số được đặt tên)

