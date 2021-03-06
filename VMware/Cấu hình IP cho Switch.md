# Cấu hình IP cho Switch
## I. Sơ đồ lab 1

![](/VMware/image/1.png)

- Yêu cầu: đặt địa chỉ IP cho SW và PC để SW và PC có thể ping được với nhau

## Thiết lập địa chỉ IP cho Switch
- Chọn PC0 -> Desktop

![](/VMware/image/2.png)

- Chọn IP Configuration

![](/VMware/image/3.png)

- Làm tương tự với PC1

## Cấu hình IP Switch
```
Switch>enable  // vào chế độ đặc quyền
Switch#configure terminal // vào chế độ cấu hình 
Switch(config)#int vlan1 // Nhập chế độ cấu hình giao diện cho vlan 1
Switch(config-vlan)#ip address 192.168.1.20 255.255.255.0  /// gán IP, subnetmask cho Vlan 1
Switch(config-vlan)#no shutdown   // cho phép int hoạt động 
Switch(config-vlan)#exit //thoát
```
## Kết quả
1. ping PC0 cho SW

![](/VMware/image/4.png)

2. Ping SW cho PC1

![](/VMware/image/5.png)

3. Ping PC0 cho PC1

![](/VMware/image/6.png)

## II, Sơ đồ lab 2
![](/VMware/image/7.png)

- Thiết lập địa chỉ cho PC
  - Chọn PC0 -> Desktop
![](/VMware/image/8.png)
  - Chọn IP Configuration
![](/VMware/image/9.png)
  - Làm tương tự với các PC khác

- Tạo vlan 2 va vlan 3 trên Switch0

Trên Switch 0

```
Switch>enable  // vào chế độ đặc quyền
Switch#configure terminal // vào chế độ cấu hình 
Switch(config)#vlan 2
Switch(config-vlan)#name VLAN2
Switch(config-vlan)#exit
Switch(config)#vlan 3
Switch(config-vlan)#name VLAN3
Switch(config-vlan)#exit
```
Trên Switch 1

```
Switch>enable  // vào chế độ đặc quyền
Switch#configure terminal // vào chế độ cấu hình 
Switch(config)#vlan 2
Switch(config-vlan)#name VLAN2
Switch(config-vlan)#exit
Switch(config)#vlan 3
Switch(config-vlan)#name VLAN3
Switch(config-vlan)#exit
```

- Gán các port vào các VLAN