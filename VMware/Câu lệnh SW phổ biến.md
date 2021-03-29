# Các câu lệnh cấu hình switch cơ bản
## 1. Lệnh Cisco truy cập vào các chế độ
- Chế độ user: Switch> 
- Vào chế độ đặc quyền: Switch>enable
- Chế độ đặc quyền: Switch#
- Vào chế độ cấu hình: Switch#configure terminal
- Chế độ cấu hình: Switch(config)#
- Vào Interface mode: 	
Switch(config)#interface fa0/1
- Interface mode: Switch(config-if)
- Trở về Global Config: Switch(config-if)exit
- Thoát Global Config: Switch(config)#exit
- Trở về user mode: Switch#disable
- Logout (Đăng xuất): Switch>exit

## 2. Lệnh cấu hình switch CISCO
- Cấu hình tên thiết bị: 	
Switch(config)#hostname sw1
- Thiết lập mật khẩu mã hóa: Switch(config)#enable secret < mật khẩu >
- Đặt mật khẩu không mã hóa: Switch(config)#enable password < mật khẩu >
- mã hóa tất cả các mật khẩu trong file cấu hình: Switch(config)#service password-encryption
- gán ip cho vlan:
  - Switch(config)#int vlan 1
  - Switch(config-if)#ip addr <địa chỉ IP> < subnet mask >
- Gán default gateway: Switch(config)#ip default-gateway 10.1.1.1
- Vào chế độ cấu hình của interface fa0/1: Switch(config)#int fa0/1
- chọn 1 dải interface: Switch(config)#int range fa0/1 – 12
-  Viết mô tả cho interface: Switch(config-if)#description
- thêm vlan sử dụng config mode: switch(config)#vlan 11
- Đtặ tên cho vlan: switch(config-vlan)#name test
- Cấu hình int fa0/1 tốc độ 100Mbps: Switch(config-if)#speed 100
- Cấu hình full duplex cho fa0/1: Switch(config-if)#duplex full
- gán int cho vlan: switch(config-if)#switchport access vlan 11
- tắt int: Switch(config-if)#shutdown
- cho phép int hoạt động: Switch(config-if#)no shutdown
- cho phép 5 phiên Telnet một lúc, mật khẩu là cisco: 
  - Switch(config)#line vty 0 4
  - Switch(config-line)#login
  - Switch(config-line)#password cisco
- Kích hoạt và đặt mật khẩu cho console là cisco: 
  - Switch(config)#line con 0
  - Switch(config-line)#login
  - Switch(config-line)#password cisco
- Đồng bộ thông báo console, giữ những gì bạn đã gõ trên màn hình: Switch(config-line)#logging synchronous
- Tạo vlan: Switch(config)#vlan 2 name HIEU
- Gán int cho vlan 2:	Switch(config-if)#switchport access vlan 2
- Buộc int là trunk vô điều kiện. Có thể chọn chế độ khác là access và dynamic: Switch(config-if)#switchport mode trunk
- Gán thủ công switch vào miền VTP. Switch tự động trở thành 1 phần của miền VTP nếu nó đang trong miền "null" và nhận VTP frame:  Switch(config)#vtp domain lab
- Thay đổi VTP mode từ chế độ mặc định là server sang client. Trong client mode thì không thay đổi được nữa: Switch(config)#vtp mode client





