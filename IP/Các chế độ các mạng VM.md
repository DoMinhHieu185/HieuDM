# Các chế độ card mạng trong VMware
## Các network mặc định 
- Một card bridge(VMNet0), card này sử dụng chính card mạng thật của chúng ta để kết nối ra ngoài internet(ethenet hoặc wireless). Do đó khi dùng card mạng này IP máy ảo sẽ cùng  với dài IP máy thật. 
  - Ưu điểm: Đơn giản, kết nối được internet, cùng dải máy thật nên cấu hình dễ dàng
  - Nhược điểm: Nhiều trường hợp dùng card bridge cấu hình bình thường và đến khi nơi nào không có mạng thì sẽ ko kết nối được. Mất mạng là mất hết.
- Một card NAT(VMNet8), card này sẽ NAT địa chỉ IP máy thật ra một địa chỉ khác cho máy ảo sử dụng. Card này cũng có thể kết nối ra ngoài internet
- Để xem các card mạng đã có VMware ta chọn edit => Virtual Network Editor
- Một lưu ý quan trọng đó là việc chọn card mạng trên máy ảo. Khi cài đặt, VMware tạo ra ở máy thật 2 card mạng ảo:
  - VMWare Virtual Ethernet Adapter for VMnet1
  - VMWare Virtual Ethernet Adapter for Vmnet8

![](https://image.prntscr.com/image/48qElxtDSCeB31gqNOIf_Q.png)

- Hai card mạng này có thể được sử dụng để máy thật giao tiếp với các máy tính ảo. Khi gắn một card mạng vào một máy ảo, card mạng này có thể được chọn 1 trong 3 loại sau:

  - **Bridge**: ở chế độ này, card mạng trên máy ảo được gắn vào VMnet0, VMnet0 này liên kết trực tiếp với card mạng vật lí trên máy thật, máy ảo lúc này sẽ kết nối internet thông qua card mạng vật lí và có chung lớp mạng với card mạng vật lí.

  ![](https://image.prntscr.com/image/2eouExktRCabz7nef2FL9Q.png)

    - Card bridge trên máy ảo chỉ có thể giao tiếp với card mạng thật trên máy thật 
    - Card mạng bridge này có thể giao tiếp với mạng vật lí mà máy tính thật đang kết nối.

  - **Host-only**: máy ảo được kết nối với VMnet có tính năng host-only trong trường hợp này là VMnet1. VNnet host-only kết nối với một card mạng ảo tương ứng ngoài máy thật. Ở chế độ này, các máy ảo không có kết nối vào mạng vật lí bên ngoài hay internet thông qua máy thật, có nghĩa là mạng VMnet host-only và mạng vật lí hoàn toàn tách biệt. IP của máy ảo được cấp bởi DHCP của VMnet tương ứng. Trong nhiều trường hợp cần cấu hình riêng, ta có thể tắt DHCP trên VMnet và cấu hình IP bằng tay cho máy ảo

  ![](https://image.prntscr.com/image/Ubn4mx5hQ0GScjjFetqhMA.png)

    - Card host-only chỉ có thể giao tiếp với card mạng ảo VMnet1 trên máy thật.
    - Card host-only chỉ có thể giao tiếp với các card host-only trên máy ảo khác.
    - Card host-only không thể giao tiếp với mạng vật lí mà máy tính thật đang kết nối

  - **NAT**:ở chế độ này, card mạng của máy ảo kết nối với VMnet8, VMnet 8 cho phép máy ảo đi ra mạng vật lí bên ngoài internet thông qua cơ chế NAT(NAT divice). Lúc này lớp mạng bên trong máy ảo khác hoàn toàn với lớp mạng của card vật lí bên ngoài, hai mạng hoàn toàn tách biệt. IP của card mạng máy ảo sẽ được cấp bởi DHCP của VMnet8, trong trường hợp bạn muốn thiết lập IP tĩnh cho card mạng máy ảo bạn phải đảm bảo cấu hình chung lớp mạng với VMnet8 thì máy ảo có thể đi internet.

  ![](https://image.prntscr.com/image/XPgcVehrSNqJAVGfR9LBVg.png) 

    - Card NAT chỉ có thể giao tiếp với card mạng ảo VMnet8 trên máy thật
    - Card NAT chỉ có thể giao tiếp với các card NAT trên máy ảo khác 
    - Card NAT không thể giao tiếp với mạng vật lí mà máy tính thật đang kết nối. Tuy nhiên nhờ cơ chế NAT được tích hợp trong VMware, máy tính ảo có thể gián tiếp liên lạc với mạng vật lí bên ngoài.
    
  ![](https://image.prntscr.com/image/2rPdqu_5QVCijbgeggvZMQ.png)