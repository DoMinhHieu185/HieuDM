# Cấu hình IP cho Switch
## I. Sơ đồ lab 

![](/VMware/image/1.png)

- Yêu cầu: đặt địa chỉ IP cho SW và PC để SW và PC có thể ping được với nhau

## II, Thiết lập địa chỉ IP cho Switch
- Chọn PC0 -> Desktop

![](/Vmware/image/2.png)

- Chọn IP Configuration

![](/Vmware/image/3.png)

- Làm tương tự với PC1

## III, Cấu hình IP Switch
```
Switch>enable
Switch#configure terminal
Switch(config)#int vlan1
Switch(config-vlan)#ip address 192.168.1.20 255.255.255.0
Switch(config-vlan)#no shutdown
Switch(config-vlan)#exit
```



