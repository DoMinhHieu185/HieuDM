# Troubleshooting galera mariadb


## Galera Cluster Recovery
Nếu tất cả các máy chủ ngoại tuyến cùng một lúc (chẳng hạn như trong thời gian mất điện), thì cụm sẽ cần được tạo lại sau quy trình sự cố.

1. Kiểm tra từng nút và xem liệu tất cả chúng đều có số 0 trong giá trị "safe_to_bootstrap" hay không. Nếu bất kỳ có giá trị nào là 1, đó là máy chủ mà bạn khởi động đầu tiên.
```
cat /var/lib/mysql/grastate.dat
```

```
# GALERA saved state
version: 2.1
uuid:    d89c79f4-b308-11e9-9931-8f96b3cc57b2
seqno:   -1
safe_to_bootstrap: 0
```

2. Nếu tất cả chúng đều có seqno không hợp lệ là -1 và không có seqno nào có giá trị là 1 trong "safe_to_bootstrap" thì chọn 1 node1 để sửa đổi grastate.dat và thay đổi "safe_to_bootstrap" thành 1.
```
sed -i 's/safe_to_bootstrap: 0/safe_to_bootstrap: 1/' /var/lib/mysql/grastate.dat
```
3. Bây giờ bạn có thể làm theo quy trình bình thường để bắt đầu một cụm Galera mới bằng cách sử dụng máy chủ này làm nút bắt đầu.
```
galera_new_cluster
```
Khởi động dịch vụ trên các node khác:
```
systemctl start mariadb
```
## Galera Cluster Recovery: Khởi động một cụm mới
Trong trường hợp 1 node không đồng bộ được với 2 node còn lại. Sử dụng lệnh trên node đó để khởi động cụm mới
```
mysqld --wsrep-new-cluster
```
Sau đó tạo cụm mới trên node đó:
```
galera_new_cluster
```
Khởi động 2 node còn lại:
```
systemctl start mariadb
```

# Tài liệu tham khảo

1. https://mariadb.com/kb/en/galera-cluster-recovery/
2. https://mariadb.com/kb/en/getting-started-with-mariadb-galera-cluster/