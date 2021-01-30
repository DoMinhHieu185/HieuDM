# So sánh 2 mô hình OSI và TCP/IP
![](https://image.prntscr.com/image/_KBixUMTSJi78m9d7i_TpA.png)
![](https://image.prntscr.com/image/fM-a9MMCSFWjoUEs_hSQdQ.png)
# Điểm giống và khác nhau của 2 mô hình OSI và TCP/IP
## Giống 
* Đều có cấu trúc phân tầng
* Đều có lớp ứng dụng, lớp vận chuyển và lớp mạng
## Khác
1. Cấu trúc:
* Mô hình OSI có 7 tầng còn mô hình TCP/IP chỉ có 4.
* Mô hình OSI 3 tầng ứng dụng, trình diễn, phiên được tách ra riêng biệt và được phân rõ chức năng từng tầng. Còn mô hình TCP/IP thì gộm 3 tầng ứng dụng, trình diễn, phiên thành tầng ứng dụng.
2. Kết nối tin cậy
* OSI không có bất kì cơ chế đặc biệt nào để cung cấp kết nối đáng tin cậy và an toàn truyền dữ liệu. Còn mô hình TCP có cơ chế bắt tay 3 bước.
3. Về mặt khái niệm
* Mô hình OSI phân biệt rõ 3 khái niệm cơ bản: Dịch vụ, giao diện, giao thức.
* Mô hình TCP/IP thì không phân biệt được ranh giới 3 khái niệm này.
4. Sự phát triển
* Mô hình OSI phát triển như một mô hình logic và khái niệm. Nó ghi lại chức năng của mỗi lớp được chỉ định. sau đó các giao thức của mỗi lớp được xác định. Mặt khác, mô hình TCP/IP được thực hiện đầu tiên với các giao thức được chỉ định và sau đó được lập thành văn bản. Do đó mô hình OSI được phát triển như một mô hình lí thuyết trong khi TCP/IP là một mô hình thực tế. Vì vậy, nếu ai đó cần khía cạnh lí thuyết mô hình, họ nên sử dụng mô hình OSI, nhứng nếu ai đó muốn triển khai thực tế mô hình, họ nên sử dụng mô hình TCP/IP