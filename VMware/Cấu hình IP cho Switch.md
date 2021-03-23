# Cấu hình IP cho Switch
## I. Sơ đồ lab 

![](/VMware/image/1.png)

- Yêu cầu: đặt địa chỉ IP cho SW và PC để SW và PC có thể ping được với nhau

## II, Thiết lập địa chỉ IP cho Switch
- Chọn PC0 -> Desktop

![](/VMware/image/2.png)

- Chọn IP Configuration

![](/VMware/image/3.png)

- Làm tương tự với PC1

## III, Cấu hình IP Switch
```
Switch>enable  // vào chế độ đặc quyền
Switch#configure terminal // vào chế độ cấu hình 
Switch(config)#int vlan1 // chọn vlan 1
Switch(config-vlan)#ip address 192.168.1.20 255.255.255.0  /// gán IP, subnetmask cho Vlan 1
Switch(config-vlan)#no shutdown   // cho phép int hoạt động 
Switch(config-vlan)#exit //thoát
```
## IV, Kết quả
1. ping PC0 cho SW

![](/VMware/image/4.png)

2. Ping SW cho PC1

![](/VMware/image/5.png)

3. Ping PC0 cho PC1

![](/VMware/image/6.png)

