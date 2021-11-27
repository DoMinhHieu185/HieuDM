# less - - hiển thị tệp
### 1. Notes
```
less file ...
```
Các `less` lệnh có một danh sách tên tập tin cho các đối số của nó và hiển thị nội dung của nó màn hình bởi màn hình.

► Nhấn `q` để thoát.

► Bấm `e` để cuộn về phía trước một dòng.
► Bấm `y` để cuộn lùi một dòng.

► Nhấn `f` để cuộn về phía trước một cửa sổ (hoặc nhấn phím cách).
► Bấm `b` để cuộn lùi một cửa sổ.
► Bấm `d` để cuộn về phía trước một nửa cửa sổ.
► Bấm `u` để cuộn lùi một nửa cửa sổ.

► Nhấn `g` để chuyển đến dòng đầu tiên trong tệp hiện tại.
► Nhấn `G` để chuyển đến dòng cuối cùng trong tệp hiện tại.

► Nhấn `:n` để chuyển sang tệp tiếp theo ().
► Nhấn `:q` để chuyển đến tệp trước đó.

► Nhấn `Ctrl+g` (hoặc `Ctrl+G`) để hiển thị tên tệp hiện tại, số dòng bắt đầu / kết thúc được hiển thị, số byte đã đọc và phần trăm dữ liệu được hiển thị. Ví dụ: file1 dòng 52-102 / 118 byte 6992/8145 85% (nhấn RETURN)

### 2. Examples
```
less file1 file2 file3
```
