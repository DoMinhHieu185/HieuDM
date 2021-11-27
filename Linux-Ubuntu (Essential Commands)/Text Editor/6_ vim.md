# vim
### 1. Notes
Vim (Vi IMproved) là một trình soạn thảo văn bản có thể được sử dụng để chỉnh sửa tất cả các loại văn bản thuần túy.

Trước khi bạn bắt đầu chỉnh sửa văn bản, màn hình ở trạng thái chế độ bảng điều khiển. Khi bạn bắt đầu chèn văn bản, màn hình đang ở trạng thái chế độ chèn (bạn sẽ thấy -- INSERT --ở cuối màn hình). Khi bạn hoàn tất việc chỉnh sửa văn bản, bạn có thể nhấn Escphím để trở về trạng thái chế độ bảng điều khiển.
### 2. vi commands: INSERT
```
i
|chèn văn bản, trước con trỏ, cho đến khi người dùng nhấn <esc>

a
|chèn văn bản, sau con trỏ, cho đến khi người dùng nhấn <esc>

I
|chèn văn bản, ở đầu dòng hiện tại, cho đến khi người dùng nhấn <esc>

A
|chèn văn bản vào cuối dòng hiện tại cho đến khi người dùng nhấn <esc>

o
|chèn một dòng mới bên dưới dòng hiện tại, chèn văn bản, cho đến khi người dùng nhấn <esc>

O
|chèn một dòng mới phía trên dòng hiện tại, chèn văn bản, cho đến khi người dùng nhấn <esc>
```

### 3. vi commands: REPLACE
```
r
|thay thế ký tự dưới con trỏ bằng một ký tự khác

R
|thay thế nhiều ký tự, bắt đầu bằng ký tự dưới con trỏ, cho đến khi người dùng nhấn <esc>

cw
|thay thế từ, bắt đầu bằng ký tự dưới con trỏ, cho đến khi người dùng nhấn <esc>

c{n}w
|thay thế {n} từ, bắt đầu bằng ký tự dưới con trỏ, cho đến khi người dùng nhấn <esc> (c3w: thay thế 3 từ)

C
|thay thế phần còn lại của dòng, bắt đầu bằng ký tự dưới con trỏ, cho đến khi người dùng nhấn <esc>

cc
|thay thế dòng hiện tại, cho đến khi người dùng nhấn <esc>

{n}cc
c{n}c
|thay thế {n} dòng, bắt đầu bằng dòng hiện tại, cho đến khi người dùng nhấn <esc>
```

### 4. vi commands: DELETE
```
x
|xóa ký tự dưới con trỏ

{n}x
|xóa {n} ký tự, bắt đầu bằng ký tự dưới con trỏ (3x: xóa 3 ký tự)

dw
|xóa từ, bắt đầu bằng ký tự dưới con trỏ

d{n}w
|xóa {n} từ, bắt đầu bằng ký tự dưới con trỏ (d3w: xóa 3 từ)

D
|xóa phần còn lại của dòng, bắt đầu bằng ký tự dưới con trỏ

dd
|xóa dòng hiện tại

{n}dd
d{n}d
|xóa {n} dòng, bắt đầu bằng dòng hiện tại (3dd: xóa 3 dòng)
```
### 5. vi commands: COPY / PASTE
```
yy
|sao chép dòng hiện tại vào khay nhớ tạm

{n}yy
y{n}y
|sao chép {n} dòng, bao gồm cả dòng hiện tại, vào khay nhớ tạm (3yy: sao chép 3 dòng)

p
|chèn văn bản từ khay nhớ tạm vào sau dòng hiện tại
```
### 6. vi commands: UNDO
```
u
|hoàn tác sửa đổi cuối cùng
```
### 7. vi commands: SEARCH
```
/{pattern}
|Tìm kiếm chuyển tiếp trong tệp để biết sự xuất hiện của chuỗi (/ foo: tìm kiếm chuỗi "foo")

?{pattern}
|Tìm kiếm ngược trong tệp để biết sự xuất hiện của chuỗi

n
|Tìm kiếm về phía trước trong tệp để biết lần xuất hiện tiếp theo của chuỗi

N
|Tìm kiếm ngược trong tệp để tìm lần xuất hiện trước đó của chuỗi
```


