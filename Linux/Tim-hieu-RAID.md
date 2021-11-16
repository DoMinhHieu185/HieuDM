# Tìm hiểu RAID

## Mục lục
- [1, Khái niệm](#1-Khái-niệm)
- [2, Cách thức hoạt động](#2-Cách-thức-hoạt-động)
- [3, Kỹ thuật lưu trữ RAID](#3-Kỹ-thuật-lưu-trữ-RAID)
- [4, Điều kiện để cấu hình RAID](#4-Điều-kiện-để-cấu-hình-RAID)
- [5, Cách tính dung lượng RAID](#5-Cách-tính-dung-lượng-RAID)
- [6, Phân loại RAID](#6-Phân-loại-RAID)
## 1, Khái niệm
RAID (Redundant Arrays of Inexpensive Disks hoặc Redundant Arrays of Independent Disks) là hình thức ghép nhiều ổ đĩa cứng vật lý thành một hệ thống ổ đĩa cứng có chức năng gia tăng tốc độ đọc/ghi dữ liệu hoặc nhằm tăng thêm sự an toàn của dữ liệu chứa trên hệ thống đĩa hoặc kết hợp cả hai yếu tố trên.
## 2, Cách thức hoạt động
Cách thức hoạt động của RAID là sao chép dữ liệu lên hai hoặc nhiều ổ cứng vật lý được liên kết với nhau bằng 1 RAID Controller. RAID Controller có thể dựa trên một trong 2 nền tảng phần cứng hoặc phần mềm.

## 3, Kỹ thuật lưu trữ RAID
Các phương thức lưu trữ dữ liệu chính trong RAID là:
* Striping (Phân chia dải): Tách luồng dữ liệu thành các khối có kích thước nhất định (được gọi là kích thước khối) sau đó viết từng khối này qua từng RAID. Cách lưu trữ dữ liệu này ảnh hưởng đến hiệu suất.
* Mirroring (mirroring): Là một kỹ thuật lưu trữ trong đó các bản sao dữ liệu giống hệt nhau được lưu trữ trên các thành viên RAID cùng một lúc. Loại vị trí dữ liệu này ảnh hưởng đến khả năng chịu lỗi cũng như hiệu suất.
* Parity là một kỹ thuật lưu trữ được sử dụng các phương pháp phân loại và tổng kiểm tra. Trong kỹ thuật chẵn lẻ, một hàm chẵn lẻ nhất định được tính cho các khối dữ liệu. Nếu một ổ đĩa bị lỗi, khối bị thiếu được tính toán lại từ tổng kiểm tra, cung cấp khả năng chịu lỗi RAID.

Tất cả các loại RAID hiện có đều dựa trên phân dải, mirroring, chẵn lẻ. Hoặc kết hợp các kỹ thuật lưu trữ này.

## 4, Điều kiện để cấu hình RAID
* RAID chỉ nên làm việc với các loại ổ cứng dung lượng bằng nhau.
* Nếu khác sẽ lấy ổ có dung lượng thấp

## 5, Cách tính dung lượng RAID
* RAID 0 bằng tổng dung lượng các ổ cộng lại.
* RAID 1 chỉ duy trì dung lượng 1 ổ.
* RAID 5 sẽ có dung lượng ít hơn 1 ổ (5 ổ dùng raid 5 sẽ có dung lượng 4 ổ).
* RAID 6 sẽ có dung lượng ít hơn 2 ổ (5 ổ dùng raid 6 sẽ có dung lượng 3 ổ).
* RAID 10 sẽ chỉ tạo được khi số ổ là chẵn, phải có tối thiểu từ 2 ổ trở lên. Dung lượng bằng tổng số ổ chia đôi (10 ổ thì dung lượng sử dụng là 5 ổ).

## 6, Phân loại RAID
### RAID 0
RAID 0 – dựa trên kỹ thuật striping. Mức RAID này không cung cấp khả năng chịu lỗi nhưng tăng hiệu năng hệ thống (tốc độ đọc và ghi cao). RAID 0 cần ít nhất 2 ổ đĩa (có thể sử dụng 1 ổ đĩa). Tổng quát ta có n đĩa (n>=2) và các đĩa là cùng loại. Dữ liệu sẽ được chia ra thành nhiều phần bằng nhau. Ví dụ có 2 ổ cứng 80GB thì hệ thống ổ đĩa sẽ là 160GB.

![](/Linux/image/raid0.png)

* **Ưu điểm**: Tốc độ đọc ghi nhanh (gấp đôi bình thường theo lý thuyết).

* **Nhược điểm**: tiềm ẩn rủi ro về dữ liệu. Lý do dữ liệu được chia đôi lưu trên 2 ổ đĩa.Trường hợp 1 trong 2 ổ đĩa bị hỏng thì nguy cơ mất dữ liệu rất cao. Về ổ cứng yêu cầu phải 2 ổ cùng dung lượng, nếu 2 ổ khác dung lượng thì lấy ổ thấp nhất.

* **Đối tượng sử dụng**: Thích hợp với những dịch vụ cần lưu trữ và truy xuất với tốc độ cao. Chẳng hạn như dịch vụ video streaming, chạy cơ sở dữ liệu… (đối với hình thức lưu trữ này khuyến cáo các bạn nên có hình thức sao lưu backup của mình.)

### RAID1
RAID 1 – sử dụng kỹ thuật mirroring, tăng tốc độ đọc trong một số trường hợp. Và cung cấp khả năng chịu lỗi khi mất không quá một đĩa thành viên. Đây là RAID cơ bản nhất có khả năng đảm bảo an toàn dữ liệu. Cũng giống như RAID 0, thì RAID 1 cũng yêu cầu 2 ổ đĩa cứng để làm việc. Dữ liệu sẽ được ghi vào 2 ổ đĩa giống nhau (Mirroring) và nếu một ổ đĩa gặp trục trặc thì ổ đĩa còn lại vẫn làm việc và hoạt động bình thường.

Người dùng có thể thay thế ổ đĩa bị hỏng mà không cần quá lo lắng đến vấn đề thông tin bị mất. Với RAID 1 thì hiệu năng không phải là yếu tố hàng đầu nên không có gì ngạc nhiên khi không phải là lựa chọn cho những người yêu thích về tốc độ. Tuy nhiên, đối với những người quản trị mạng hoặc người quản lý nhiều thông tin thì RAID 1 là thứ không thể thiếu. Dung lượng cuối cùng của hệ thống RAID 1 sẽ bằng dung lượng của ổ đơn.

Ví dụ: 2 ổ cứng 80GB chạy RAID 1 sẽ cho hệ thống nhìn thấy duy nhất một ổ RAID 80GB.

![](/Linux/image/raid1.png)

* **Ưu điểm**: An toàn về dữ liệu, trường hợp 1 trong 2 ổ đĩa bị hỏng thì dữ liệu vẫn có khả năng đáp ứng dịch vụ.

* **Nhược điểm**: Hiệu suất không cao, Nâng cao chi phí (giả sử khách hàng sử dụng 2 ổ cứng 500GB. Khi sử dụng Raid 1 thì dung lượng lưu trữ có thể sử dụng chỉ được 500GB). Về ổ cứng yêu cầu phải 2 ổ cùng dung lượng, nếu 2 ổ khác dung lượng thì lấy ổ thấp nhất.

* **Đối tượng sử dụng**: Các dịch vụ lưu trữ, các website vừa và nhỏ không yêu cầu quá cao về tốc độ đọc ghi (in/out) của ổ cứng. Các đối tượng yêu cầu sự an toàn về dữ liệu như các dịch vụ kế toán,lưu trữ thông tin khách hàng, bất động sản v.v…

### RAID 5
Phương pháp này sử dụng phân chia “parity” (chẵn lẻ) để duy trì dự phòng dữ liệu. Cần ít nhất 3 ổ cứng có năng xuất cao như nhau để áp dụng RAID 5.

“Parity” là là một phép toán nhị phân so sánh 2 khối dữ liệu với một khối dữ liệu thứ 3 dựa trên 2 khối đầu tiên. Cách giải thích đơn giản nhất là chẵn và lẻ. Nếu tổng của 2 khối dữ liệu là chẵn thì số bit là chẵn, nếu tổng của 2 khối dữ liệu là lẻ thì số bit là lẻ. Do đó phép toán 0+0 and 1+1 đều bằng 0 còn 0+1 or 1+0 sẽ bằng 1. Dựa trên phép toán nhị phân này, một ổ trong dãy bị trục trặc thì thì sẽ cho phép các bit “parity” khôi phục lại dữ liệu khi ổ đó được thay thế.

Sau đây là một ví dụ cho thấy dữ liệu được ghi vào RAID 5 như thế nào. Mỗi dòng trong biểu đồ biểu diễn một khối dữ liệu và mỗi cột biểu diễn một ổ cứng khác nhau. Những số trong bảng đại diện cho các khối dữ liệu. Các số giống nhau biểu thị một khối dữ liệu được lặp lại. “P” là các bit “parity” cho hai khối dữ liệu

![](/Linux/image/raid5.png)

Các bit “parity” luân chuyển giữa các ổ cứng sẽ làm tăng hiệu xuất và độ tin cậy cho dữ liệu. Dải ổ cứng vẫn sẽ tăng hiệu xuất thông qua một ổ riêng lẻ bởi vì nhiều ổ thì khả năng ghi dữ liệu sẽ nhanh hơn một ổ. Dữ liệu cũng được dự phòng toàn bộ nhờ các bit “parity”. Trường hợp ổ 2 bị lỗi thì dữ liệu có thể được phục hồi dựa trên dữ liệu và các bit trên hai ổ còn lại. Dung lượng dữ liệu giảm là do các khối dữ liệu chẵn lẻ. Trong thực tế nếu n là số lượng ổ và z là dung lượng thì ta có công thức sau:
```
(n-1)*z = Dung lượng
```
Trong trường hợp có 3 ổ cứng với dung lượng 500GB /ổ thì tổng dung lượng sẽ là (3-1)x500GB = 1000 GB

* **Ưu điểm**: Các giao dịch dữ liệu đọc rất nhanh trong khi các giao dịch dữ liệu ghi có phần chậm hơn (do parity phải được tính toán). Nếu một drive bị lỗi, bạn vẫn có quyền truy cập vào tất cả dữ liệu. Ngay cả khi drive bị lỗi đang được thay thế và bộ điều khiển lưu trữ rebuild dữ liệu trên ổ đĩa mới.
* **Nhược điểm**: Lỗi drive có ảnh hưởng đến thông lượng, mặc dù điều này vẫn có thể chấp nhận được. Đây là công nghệ phức tạp. Nếu một trong các đĩa trong mảng sử dụng đĩa 4TB bị lỗi và cần thay thế, việc khôi phục dữ liệu có thể mất một ngày hoặc lâu hơn. Việc này tùy thuộc vào load trên array và tốc độ của bộ điều khiển. Nếu một đĩa khác bị hỏng trong thời gian đó, dữ liệu sẽ bị mất vĩnh viễn.
* **Đối tượng sử dụng**: Tất cả những website, dịch vụ, ứng dụng có số lượng truy cập và yêu cầu tài nguyên từ nhỏ đến vừa và lớn.