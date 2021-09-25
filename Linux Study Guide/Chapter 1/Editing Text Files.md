# Editing Text Files
### Look at Text Editors
Có 3 trình soạn thảo văn bản dòng lệnh phổ biến trên Linux
* nano
* vim
* emacs
### Understanding **vim** Modes
Trình soạn thảo `vim` có 3 chế độ:
* `Command Mode`: là chế độ bình thường. Tại đây bạn có thể nhập tổ hợp phím để thực hiện lệnh
* `Insert mode`: là chế độ chỉnh sửa hoặc nhập. Bạn vào chế độ này bằng phím `i` và rời khỏi chế độ này bằng phím `esc`
* `Ex mode`: Chế độ này đôi khi còn được gọi là lệnh dấu hai chấm vì mọi lệnh được nhập vào đây đều được đặt trước bằng dấu hai chấm (:).
### Exploring Basic Text-Editing Procedures
Các lệnh di chuyển trong chế độ `command Mode` của lệnh vim thường được sử dụng

`h`: Di chuyển con trỏ sang trái một ký tự.
`l`: Di chuyển con trỏ sang phải một ký tự. 
`j`: Di chuyển con trỏ xuống một dòng
`k`: Di chuyển con trỏ lên một dòng
`w`: Di chuyển con trỏ về phía trước một từ trước từ tiếp theo.
`e`: Di chuyển con trỏ đến cuối từ hiện tại.
`b`: Di chuyển con trỏ về phía sau một từ
`^ `: Di chuyển con trỏ đến đầu dòng.
`$`: Di chuyển con trỏ đến cuối dòng.
`gg`: Di chuyển con trỏ đến dòng đầu tiên của tệp.
`G`: Di chuyển con trỏ đến dòng cuối cùng của tệp.
`nG`: Di chuyển con trỏ đến dòng thứ `n` của tệp.
`Ctrl+b`: Cuộn lên gần như toàn màn hình.
`Ctrl+f`: Cuộn xuống gần như toàn màn hình.
`Ctrl+u`: Cuộn lên nửa màn hình.
`Ctrl+d`: Cuộn xuống nửa màn hình.
`Ctrl+y`: Cuộn lên một dòng.
`Ctrl+e`: Cuộn xuống một dòng.

Các lệnh chỉnh sửa trong chế độ lệnh(command mode) `vim` thường được sử dụng

`a`: Chèn văn bản sau con trỏ
`A`: Chèn văn bản vào cuối dòng văn bản.
`dd`: Xóa dòng hiện tại.
`dw`: Xóa từ hiện tại.
`i`: Chèn văn bản trước con trỏ.
`I`: Chèn văn bản trước khi bắt đầu dòng văn bản.
`o`: Mở một dòng văn bản mới bên dưới con trỏ và chuyển sang chế độ chèn.
`O`: Mở một dòng văn bản mới phía trên con trỏ và chuyển sang chế độ chèn.
`p`: Dán văn bản đã sao chép vào sau con trỏ.
`P`: Dán văn bản đã sao chép (kéo theo) trước con trỏ.
`yw`: sao chép từ hiện tại
`yy`: Sao chép dòng hiện tại
`v`: Chuyển sang chế độ VISUAL  
`V`: Chuyển sang chế độ VISUAL LINE (chọn hàng thay vì chọn từ như VISUAL)  
`Esc`: Chuyển sang chế độ NORMAL  
`x`: Xóa kí tự tại con trỏ  
`y`: Copy phần văn văn bản đã chọn trong chế độ VISUAL  
`d2w`: Xóa 2 từ đăng sau con trỏ (delete ... word)  
`d$`: Xóa đến cuối dòng  
`d3b`: Xóa 2 từ đằng trước con trỏ (delete ... backwards)  
`dt)`: Xóa đến kí tự ")" (delete till ...)  
`d2j`: Xóa 2 dòng bên dưới (delete ... j là xuống)  
`d2h`: Xóa 2 chữ bên trải (delete ... h là qua trái)  
`u`: Undo   
`Ctrl-r`: Redo 

Trong chế độ lệnh, bạn có thể thực hiện các lệnh chỉnh sửa thêm một bước nữa bằng cách sử dụng cú pháp đầy đủ của chúng, như sau:

```
COMMAND [NUMBER-OF-TIMES] ITEM
```
* Ví dụ, nếu bạn muốn xóa ba từ, bạn sẽ nhấn các phím D, 3 và W. Nếu bạn muốn sao chép (kéo) văn bản từ con trỏ đến cuối dòng văn bản, bạn sẽ nhấn các phím Y $, di chuyển đến vị trí bạn muốn dán văn bản và nhấn phím P.

Các lệnh chế độ `Ex mode` thường được sử dụng

`:! command`: Thực hiện lệnh shell và hiển thị kết quả, nhưng đừng thoát khỏi trình soạn thảo.
`:r! command`: Thực thi lệnh shell và đưa kết quả vào vùng đệm của trình soạn thảo.
`:r file`: Đọc nội dung tệp và đưa chúng vào vùng đệm của trình soạn thảo.

### Saving Changes

Lưu các thay đổi trong trình soạn thảo văn bản _vim_
`:w`: Lưu văn bản  
`:wq`: Lưu và thoát văn bản ( hoặc sử dụng ZZ )  
`:q!`: Thoát không lưu  

