# Lab 2
## Mô hình lab

![](/VMware/image/10.png)

## Cấu hình IP cho PC
- Thiết lập địa chỉ cho PC
  - Chọn PC0 -> Desktop
![](/VMware/image/8.png)
  - Chọn IP Configuration
![](/VMware/image/9.png)
  - Làm tương tự với các PC khác

- Tạo vlan 2 va vlan 3 trên Switch

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
  - trên SW0:
```
Switch>enable  // vào chế độ đặc quyền
Switch#configure terminal // vào chế độ cấu hình 
Switch(config)#int f0/1
Switch(config-if)#switchport access vlan 2
Switch(config-if)#exit
Switch(config)#int f0/2
Switch(config-if)#switchport access vlan 2
Switch(config-if)#exit
Switch(config)#int f0/3
Switch(config-if)#switchport access vlan 3
Switch(config-if)#exit
```
  - Trên SW1:
```
Switch>enable  // vào chế độ đặc quyền
Switch#configure terminal // vào chế độ cấu hình 
Switch(config)#int f0/2
Switch(config-if)#switchport access vlan 2
Switch(config-if)#exit
Switch(config)#int f0/3
Switch(config-if)#switchport access vlan 3
Switch(config-if)#exit
Switch(config)#int f0/4
Switch(config-if)#switchport access vlan 3
Switch(config-if)#exit
```
- Tạo đường Trunk từ Switch0 đến Switch1
  - Trên SW0
```
Switch>enable
Switch#configure terminal
Switch(config)#int f0/4
Switch(config-if)#switchport mode trunk
Switch(config-if)#end
```
  - Trên SW1
```
Switch>enable
Switch#configure terminal
Switch(config)#int f0/1
Switch(config-if)#switchport mode trunk
Switch(config-if)#end
```
**Một đường Trunk là kết nối vật lý và logic giữa 2 switch.Trunking là đường dây nối giữa 2 switch để các vlan đi qua, để 2 switch nhận ra vlan nào đi qua bằng cách gắn số vào gói tin đi qua**
