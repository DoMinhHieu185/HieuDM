# Cấu hình IP tĩnh cho Centos 7
- liệt kê các thông tin card mạng trên CentOs7 bằng câu lệnh sau
  - ip a

![](/Linux/image/28.png)

  - Ở đây ta thấy card ens33 được sử dụng, còn **lo** là địa chỉ loopback
- Để cấu hình ta dùng lệnh
  - vi /etc/sysconfig/network-scripts/ifcfg-<tên card mạng> (ở đấy tên card mạng là ens33)
- Hiểu đơn giản IP tĩnh sẽ là 1 địa chỉ xác định và không thay đổi, chính vì vậy IP thường được đặt cho máy chủ với mục đích riêng(máy chủ web, mail, dữ liệu,...) để nhiều người có thể truy cập mà không bị gián đoạn đường truyền dữ liệu và biết được chính xác vị trí chí
![](/Linux/image/29.png)

- **Chú thích**
– Dưới đây là các option bạn nên lưu ý khi cấu hình, còn lại để mặc định cũng được:
  - DEVICE : tên card mạng, nên điền chính xác tên card mạng thì hệ thống mới nhận biết được card nào để cấu hình card mạng cho nó.
  - ONBOOT : phải để option "yes" thì khi reboot hệ thống, network mới tự động được bật lên với cấu hình card mạng tương ứng.
  - BOOTPROTO : cấu hình IP tĩnh hay DHCP. Nếu là DHCP thì để giá trị "dhcp", còn tĩnh thì là "static"
  - IPV6INIT : tắt/mở - yes/no chức năng hỗ trợ sử dụng IPv6 trên card mạng ens33.
  - IPADDR : địa chỉ IP tĩnh.
  - PREFIX : subnet mask của lớp mạng IP sử dụng.255.255.255.0 (24)
  - GATEWAY : địa chỉ IP cổng gateway.
  - DNS1 : thông tin DNS1 server.
  - DNS2: thông tin DNS2 server.

![](/Linux/image/30.png)

  - Ân Esc để thoát chế độ Insert
  - :wq! để lưu và thoát
- Sau khi đã hoàn tất cấu hình IP tĩnh như trên thì ta sẽ khởi động lại dịch vụ network trên CentOS 7.
  - systemctl restart network
- Kiểm tra thông tin IP tĩnh đã cấu hình cho card mạng ens33
  - ip a

![](/Linux/image/31.png)