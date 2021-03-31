# VLAN
## Khái niệm 
- VLAN là viết tắt của Virtual Local Area Network hay còn gọi là mạng LAN ảo. Một VLAN được định nghĩa là một nhóm logic các thiết bị mạng và được thiết lập dựa trên các yếu tố như chức năng, bộ phận, ứng dụng… của công ty. Về mặt kỹ thuật, VLAN là một miền quảng bá được tạo bởi các switch. Bình thường thì router đóng vai trò tạo ra miền quảng bá. Đối với VLAN, switch có thể tạo ra miền quảng bá.
- chia 1 con SW vật lí thành nhiều cá SW ảo(Lớp 2)
## Collision domain(miền xung đột)
- Miền xung đột được định nghĩa là vùng mạng mà trong đó các khung phát ra có thể gây xung đột với nhau. Càng nhiều trạm trong cùng một miền xung đột thì sẽ làm tăng sự xung đột và làm giảm tốc độ truyền, vì thế mà miền xung đột có thể gọi là miền băng thông( các trạm trong cùng miền này sẽ chia sẻ băng thông của miền) một trong những nguyên nhân chính làm cho hoạt động của mạng không hiệu quả .Mỗi khi một đụng độ xảy ra trên một mạng, tất cả các hoạt động truyền dừng lại trong một khoảng thời gian.
- Các thiết bị như Hub hay các Repeater làm việc ở tầng vật lý nên không nhận ra địa chỉ MAC nên mỗi khi chúng nhận được một tín hiệu từ một cổng nó sẽ phát tin ra tất cả các cổng còn lại, vì vậy hình thành lên các vung xung đột .
## Broadcast domain(miền quảng bá)
- Miền quảng bá được định nghĩa là tập hợp các thiết bị mà trong đó khi một thiết bị phát đi một frame quảng bá ( khung broadcast) thì tất cả các thiết bị còn lại đều nhận được. Khi sử dụng các thiết bị nối khác nhau, ta sẽ phân chia mạng thành các miền xung đột và miền quảng bá khác nhau.Miền quảng bá là một nhóm các miền collision domain được kết nối bởi các thiết bị lớp 2, vì vậy các thiết bị lớp 2 không thể nhận diện các frame broadcast và việc tạo ra các miền quảng bá làm giảm hiệu năng của mạng, để hạn chế nó cần nối các miền quảng bá bởi các thiết bị lớp 3 (router).
- Switch là thiết bị Lớp 2. Khi Switch nhận được gói quảng bá thì nó sẽ gửi ra tất cả tất cả các cổng trừ cổng nhận gói vào. Mỗi thiết bị nhận được gói quảng bá đều phải xử lý thông tin nằm trong đó. Điều này làm giảm hiệu quả hoạt động của mạng vì tốn băng thông cho mục đích quảng bá.
- Khi hai Switch kết nối với nhau, kích thước miền quảng bá tăng lên. Hậu quả là lượng băng thông khả dụng giảm xuống vì các thiết bị trong cùng một miền quảng bá đều phải nhận và xử lý gói quảng bá.

![](/VMware/image/11.png)

**Cách xác địng**
  - Một port Router là 1 broadcast domain 
  - Các port Router được nối với nhau chỉ tính là 1 broadcast domain 
  - Một port của SW, router là một collision domain
  - Các port của SW, router nối lại với nhau chỉ tính là 1 collision domain 
  - Hub là một collision domain
## Lợi ích VLAN
- Tiết kiệm băng thông của hệ thống mạng:VLAN chia mạng LAN thành nhiều đoạn (segment) nhỏ, mỗi đoạn đó là một vùng quảng bá (broadcast domain). Khi có gói tin quảng bá (broadcast), nó sẽ được truyền duy nhất trong VLAN tương ứng. Do đó việc chia VLAN giúp tiết kiệm băng thông của hệ thống mạng.
- Tăng khả năng bảo mật: Do các thiết bị ở các VLAN khác nhau không thể truy nhập vào nhau (trừ khi ta sử dụng router nối giữa các VLAN). Như trong ví dụ trên, các máy tính trong VLAN kế toán (Accounting) chỉ có thể liên lạc được với nhau. Máy ở VLAN kế toán không thể kết nối được với máy tính ở VLAN kỹ sư (Engineering).
- Dễ dàng thêm hay bớt máy tính vào VLAN: Việc thêm một máy tính vào VLAN rất đơn giản, chỉ cần cấu hình cổng cho máy đó vào VLAN mong muốn.
- Giúp mạng có tính linh động cao: VLAN có thể dễ dàng di chuyển các thiết bị. Giả sử trong ví dụ trên, sau một thời gian sử dụng công ty quyết định để mỗi bộ phận ở một tầng riêng biệt. Với VLAN, ta chỉ cần cấu hình lại các cổng switch rồi đặt chúng vào các VLAN theo yêu cầu. VLAN có thể được cấu hình tĩnh hay động. Trong cấu hình tĩnh, người quản trị mạng phải cấu hình cho từng cổng của mỗi switch. Sau đó, gán cho nó vào một VLAN nào đó. Trong cấu hình động mỗi cổng của switch có thể tự cấu hình VLAN cho mình dựa vào địa chỉ MAC của thiết bị được kết nối vào.

## Khi nào bạn cần một VLAN?
- Bạn có hơn 200 máy tính trong mạng LAN
- Lưu lượng quảng bá (broadcast traffic) trong mạng LAN của bạn quá lớn
- Các nhóm làm việc cần gia tăng bảo mật hoặc bị làm chậm vì quá nhiều bản tin quảng bá.
- Các nhóm làm việc cần nằm trên cùng một miền quảng bá vì họ đang dùng chung các ứng dụng. Ví dụ như một công ty sử dụng điện thoại VoIP. Một số người muốn sử dụng điện thoại có thể thuộc một mạng VLAN khác, không cùng với người dùng thường xuyên
- Hoặc chỉ để chuyển đổi một switch đơn thành nhiều switch ảo.

## Tại sao không chia subnet?
-  VLAN có ưu điểm hơn subnet ở chỗ các máy tính tại những vị trí vật lý khác nhau (không quay lại cùng một router) có thể nằm trong cùng một mạng. Hạn chế của việc chia subnet với một router đó là tất cả máy tính trên subnet đó phải được kết nối tới cùng một switch và switch đó phải được kết nối tới một cổng trên router.
- Với VLAN, một máy tính có thể được kết nối tới switch này trong khi máy tính khác có thể kết nối tới switch kia mà tất cả các máy tính vẫn nằm trên VLAN chung (miền quảng bá).

## Tại sao phải dùng VLAN
1. An ninh mạng:

