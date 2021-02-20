# Các dạng bài tập chiwa subnet
## Dạng 1: Cho một mạng lớn và số bit mượn. Xác định 
- Số subnet 
- Số host/subnet 
- Địa chỉ mạng của mỗi subnet
- Địa chỉ host đầu của mỗi subnet. 
- Địa chỉ host cuối của mỗi subnet. 
- Địa chỉ broadcast của mỗi subnet
- Subnet mask được sử dụng. 
** Cách tính **
 Gọi n là số bit mượn và m là số bit host còn lại. Ta có: 
- Số subnet có thể chia được:
-  2^n       nếu có hỗ trợ subnet – zero. 
-  2^n – 2   nếu không hỗ trợ subnet – zero.
- Số host có thể có trên mỗi subnet: 2^m – 2 (host/subnet).
- Địa chỉ mạng có octet bị chia cắt là bội số của bước nhảy (Octet bị chia  cắt là octet vừa có các bit thuộc phần mạng vừa có các bit thuộc phần host). Bước nhảy tương ứng với số bit mượn có thể được tra trong bảng dưới.

![](https://image.prntscr.com/image/Ecjhgf4aRd_qy92S3ZqFTg.png)

- Địa chỉ host đầu = địa chỉ mạng + 1 (cần hiểu cộng 1 ở đây là lùi về sau một địa chỉ)
- Địa chỉ broadcast = địa chỉ mạng kế tiếp – 1 (cần hiểu trừ 1 ở đây là lùi về phía trước một địa chỉ). 
- Địa chỉ host cuối = địa chỉ broadcast – 1 (cần hiểu trừ 1 ở đây là lùi về phía trước một địa chỉ). 
- Để tính ra subnet mask được sử dụng, ta sử dụng cách nhớ: phần mạng của địa chỉ chạy đến đâu, các bit 1 của subnet mask chạy đến đó.

![](https://image.prntscr.com/image/smpKKkbbTJuTy7N58lhpVA.png)

## Dạng 2: Cho một địa chỉ host. Xác định xem host thuộc mạng nào
 VD1:   Cho địa chỉ host 192.168.1.158/28. Hãy cho biết, host này thuộc về subnet nào? 
 ** cách làm **
- Bước 1: Ta để ý vào số prefix (ở ví dụ này là 28). 
- Bước 2: Từ số prefix ta xác định được số bit mạng (= 28)(số bit mạng = số prefix)
- Bước 3: xác định octet bị chia cắt của địa chỉ host là octet bao nhiêu ( Octet bị chia cắt là octet chưa cả bit mạng lẫn bit host)(Ở ví dụ này octet bị chia cắt là octet thứ 4).
- bước 4: xác định được số bit mượn của octet này (số bit mạng trong octet bị chia cắt) (Ở ví dụ này số bit mượn bằng 4)
- Bước 5: xác định bước nhảy( xem bảng dưới)( bước nhảy = 2^m (m là số bit host còn lại))

![](https://image.prntscr.com/image/KAXayHYGQNitzHhO7Nv6bQ.png)

- Bước 6: lấy octet bị chia cắt chia cho bước nhảy lấy phần nguyên ( ở vi dụ này 158 chia cho 16 được 9)
- Bước 7: Lấy kết quả vừa tính được bước trên nhân với bước nhảy ta sẽ tìm được địa chỉ mạng mà địa chỉ host này thuộc ( 9 nhân 16 bằng 144. Vậy địa chỉ host này thuộc mạng 192.168.1.144).

## Dạng 3: Tóm tắt địa chỉ (summary) 
Ví dụ:
 172.16.16.0/24      
 172.16.20.0.24      
 172.16.24.0/24       
 172.16.28.0/24 
** Cách làm **
* Nguyên tắc khi tóm tắt là xem xét các octet từ trái qua phải và bắt đầu phân tích từ octet có sự khác nhau đầu tiên
* Trong trường hợp của ví dụ trên, octet thứ ba là octet khác nhau đầu tiên. Ta xét chi tiết octet này:
- 172.16.00010000.0
- 172.16.00010100.0
- 172.16.00011000.0
- 172.16.00011100.0
* Ta thấy octet thứ ba còn có thêm 3 bit giống nhau.Với nguyên tắc trong số 4 lớp mạng trên có đặc điểm là 19 bit đầu tiên giống nhau và 19 bit này sẽ đóng vai trò là Network ID, 13 bit còn lại ngầm định sẽ đóng vai trò là host-id Vậy ta có mạng tóm tắt là 172.16.0.0/19. Chú ý: subnet mask bây giờ là 255.255.224.0 với prefix là 19. 

