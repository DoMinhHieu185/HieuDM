## Cấu hình IP tĩnh cho Ubuntu 20.04
- Ktra IP hiện tại của máy
  - networkctl status

![](/Linux/image/24.png)

- ta thấy card ens33 đang được sử dụng
- Truy cập và sửa file:
  - sudo vi /etc/netplan/00-installer-config.yaml

![](/Linux/image/25.png)

- Ta sẽ chỉ sửa file như sau
  - Ân i để bắt đầu chỉ sửa

![](/Linux/image/26.png)

  - Ấn Esc để thoát chế độ Insert
  - :wq! lưu và thoát file
- Sau đó ta thực hiện câu lệnh để cập nhận IP đã được cài đặt
  - sudo netplan apply
- Kiểm tra IP xem đã được nhận hay chưa 
  - networkctl status

![](/Linux/image/27.png)

- IP đã nhận và ngoài ra nếu lỗi bạn có thể chạy lệnh 
  - sudo netplan --delay apply
