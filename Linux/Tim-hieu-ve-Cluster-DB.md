# Tìm hiểu về MariaDB Cluster
### I, Tổng quan về Cluster
#### 1.1, Cluster là gì
Cluster là kiến trúc nâng cao khả năng sẵn sàng cho các hệ thống dịch vụ. Hệ thống Cluster cho phép nhiều máy chủ chạy kết hợp, đồng bộ với nhau. Hệ thống Cluster nâng cao khả năng chịu lỗi của hệ thống, tăng cấp độ tin cậy, tăng tính đảm bảo, nâng cao khả năng mở rộng cho hệ thống. Trong trường hợp có lỗi xảy ra, các dịch vụ bên trong Cluster sẽ tự động loại trừ lỗi, cố gắng khôi phục, duy trì tính ổn định, tính sẵn sàng của dịch vụ

#### 1.2, Tính chất quan trọng
* Cân bằng tải của cụm (Load Balancing): Các node bên trong cluster hoạt động song song, chia sẻ các tác vụ để năng cao hiệu năng.
* Tính sẵn sàng cao (High availability): Các tài nguyên bên trong cluster luôn sẵn sàng xử lý yêu cầu, ngay cả khi có vấn đề xảy ra với các thành phần bên trong (hardware, software).
* Khả năng mở rộng (scalability): Khi tài nguyên có thể sử dụng của hệ thống tới giới hạn, ta có thể dễ dàng bổ sung thêm tài nguyên vào cluster bằng các bổ sung thêm các node.
* Độ tin cậy (reliability): Hệ thống Cluster giảm thiểu tần số lỗi có thể xảy ra, giảm thiểu các vấn đề dẫn tới ngừng hoạt động của hệ thống.

#### 1.3, Các thuật ngữ quan trọng
* Cluster: Nhóm các server dành riêng để giải quyết 1 vấn đề, có khả năng kết nối, sản sẻ các tác vụ.
* Node: Server thuộc Cluster
* Failover: Khi 1 hoặc nhiều node trong Cluster xảy ra vấn đề, các tài nguyên (resource) tự động được chuyển tới các node sẵn sàng phục vụ
* Failback: Khi node lỗi phục hồi, sẵn sàng phục vụ, Cluster tự động trả lại tài nguyên cho node
* Fault-tolerant cluster: Để cập đến khả năng chịu lỗi của hệ thống trên các thành phần, cho phép dịch vụ hoạt động ngay cả khi một vài thành phần gặp sự cố
* Heartbeat: Tín hiệu xuất phát từ các node trong cụm với mục đích xác minh chùng còn sống và đang hoạt động. Nếu heartbeat tại 1 node ngừng hoạt động, cluster sẽ đánh dấu thành phần đó gặp sự cố và chuyển tài nguyên tại node lỗi sang node đang sẵn sàng phục vụ
* Interconnect: Kết nối giữa các node. Thường là các thông tin về trạng thái, heartbeat, dữ liệu chia sẻ.
* Primary server, secondary server: Trong cluster dạng Active/Passise, node đang đáp ứng giải quyết yêu cầu gọi là Primary server. Node đang chờ hay dự phòng cho node Primary server được gọi là secondary server
* Quorum: Trong Cluster chứa nhiều tài nguyên, nên dễ xảy ra sự phân mảnh (split-brain - Tức cluster lớn bị tách ra thành nhiều cluster nhỏ). Điều này sẽ dẫn đến sự mất đồng bộ giữa các tài nguyên, ảnh hướng tới sự toàn vẹn của hệ thống. Quorum được thiết kế để ngăn chặn hiện tượng phân mảnh.
* Resource: Tài nguyên của cụm, cũng có thể hiểu là tài nguyên mà dịch vụ cung cấp
* STONITH/ Fencing: STONITH là viết tắt của cụm từ Shoot Other Node In The Head đây là một kỹ thuật dành cho fencing. Fencing là kỹ thuật cô lập tài nguyên tại từng node trong Cluster. Mục tiêu STONITH là tắt hoặc khởi động lại node trong trường hợp Node trong trường hợp dịch vụ không thể khôi phục.

#### 1.4, Các chế độ hoạt động
##### Active - Active
Active Active cluster được tạo ra từ ít nhất 2 node, cả 2 node chạy đồng thời xử lý cùng 1 loại dịch vụ. Mục đích chính của Active Active Cluster là tối ưu hóa cho hoạt động cân bằng tải (Load balancing). Hoạt động cân bằng tải (Load balancing) sẽ phân phối các tác vụ hệ thống tới tất cả các node bên trong cluster, tránh tình trạng các node xử lý tác vụ không cân bằng dẫn tới tình trạng quả tải. Bên cạnh đó, Active Active Cluster nâng cao thông lượng (thoughput) và thời gian phản hổi

Khuyển cáo cho chế độ Active Active Cluster là các node trong cụm cần được cấu hình giống nhau tránh tình trạng phân mảnh cụm.

![](/Linux/image/cluster.png)

##### Active - Passive
Giống cấu hình Active - Active, Active Passive Cluster cần ít nhất 2 node, tuy nhiên không phải tất cả các node đều sẵn sàng xử lý yêu cầu. VD: Nếu có 2 node thì 1 node sẽ chạy ở chế độ Active, node còn lại sẽ chạy ở chế độ passive hoặc standby.

Passive Node sẽ hoạt động như 1 bản backup của Active Node. Trong trường hợp Active Node xảy ra vấn đề, Passive Node sẽ chuyển trạng thái thành active, tiếp quản xử lý các yêu cầu

![](/Linux/image/cluster1.png)

### II, Tìm hiểu về MariaDB Galera Cluster
#### 2.1, MariaDB Galera là gì?
MariaDB Galera Cluster là giải pháp sao chép đồng bộ nâng cao tính sẵn sàng cho MariaDB. Galera hỗ trợ chế độ Active-Active tức có thể truy cập, ghi dữ liệu đồng thời trên tất các node MariaDB thuộc Galera Cluster. Một node có thể được thêm vào cluster cũng như gỡ ra khỏi cluster mà không có downtime dịch vụ

#### 2.2, Đặc trưng
* Synchronous replication(sao chép đồng bộ)
* Cấu trúc liên kết Active-active multi-master
* Đọc và ghi vào bất kỳ node server
* Kiểm soát các node tự động, các node lỗi sẽ được được gỡ khỏi cluster
* Thêm node tự động
* Nhân rộng song song, với kiểu row level
* Kết nối máy khách trực tiếp, giao diện MariaDB bản địa

#### 2.2, Lợi ích
* Không có độ trễ slave
* Không có transactions bị mất
* Đáp ứng cả 2 khẳng năng là mở rộng và read & write
* Độ trễ client nhỏ hơn

#### 2.4, Hướng dẫn cài đặt MariaDB Galera Cluster
##### 2.4.1, Chuẩn bị
**Mô hình**

![](/Linux/image/cluster2.png)

**Bảng phân giải IP**
|Hostname|OS|Interface|
|-|-|-|
|Node1|Centos 7|ens33:192.168.1.135 - ens37:10.0.0.128|
|Node2|Centos 7|ens33:192.168.1.136 - ens37:10.0.0.129|
|Node3|Centos 7|ens33:192.168.1.137 - ens37:10.0.0.130|

**Tại Node 1**
Cấu hình Hostname
```
hostnamectl set-hostname node1
```
Cấu hình network
```
# Cấu hình IP cho ens33
nmcli c modify ens33 ipv4.addresses 192.168.1.135/24
nmcli c modify ens33 ipv4.gateway 192.168.1.2
nmcli c modify ens33 ipv4.dns 8.8.8.8
nmcli c modify ens33 ipv4.method manual
nmcli con mod ens33 connection.autoconnect yes

# Cấu hình IP cho ens37
nmcli c modify ens37 ipv4.addresses 10.0.0.128/24
nmcli c modify ens37 ipv4.method manual
nmcli con mod ens37 connection.autoconnect yes
```
Tắt Firewall, SELinux, Khởi động lại
```
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
systemctl stop firewalld
systemctl disable firewalld
init 6
```
Cấu hình host
```
echo "192.168.1.135 node1" >> /etc/hosts
echo "192.168.1.136 node2" >> /etc/hosts
echo "192.168.1.137 node3" >> /etc/hosts
```

**Tại Node 2**
Cấu hình Hostname
```
hostnamectl set-hostname node2
```
Cấu hình network
```
# Cấu hình IP cho ens33
nmcli c modify ens33 ipv4.addresses 192.168.1.136/24
nmcli c modify ens33 ipv4.gateway 192.168.1.2
nmcli c modify ens33 ipv4.dns 8.8.8.8
nmcli c modify ens33 ipv4.method manual
nmcli con mod ens33 connection.autoconnect yes

# Cấu hình IP cho ens37
nmcli c modify ens37 ipv4.addresses 10.0.0.129/24
nmcli c modify ens37 ipv4.method manual
nmcli con mod ens37 connection.autoconnect yes
```
Tắt Firewall, SELinux, Khởi động lại
```
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
systemctl stop firewalld
systemctl disable firewalld
init 6
```
Cấu hình host
```
echo "192.168.1.135 node1" >> /etc/hosts
echo "192.168.1.136 node2" >> /etc/hosts
echo "192.168.1.137 node3" >> /etc/hosts
```

**Tại Node 3**
Cấu hình Hostname
```
hostnamectl set-hostname node3
```
Cấu hình network
```
# Cấu hình IP cho ens33
nmcli c modify ens33 ipv4.addresses 192.168.1.137/24
nmcli c modify ens33 ipv4.gateway 192.168.1.2
nmcli c modify ens33 ipv4.dns 8.8.8.8
nmcli c modify ens33 ipv4.method manual
nmcli con mod ens33 connection.autoconnect yes

# Cấu hình IP cho ens37
nmcli c modify ens37 ipv4.addresses 10.0.0.130/24
nmcli c modify ens37 ipv4.method manual
nmcli con mod ens37 connection.autoconnect yes
```
Tắt Firewall, SELinux, Khởi động lại
```
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
systemctl stop firewalld
systemctl disable firewalld
init 6
```
Cấu hình host
```
echo "192.168.1.135 node1" >> /etc/hosts
echo "192.168.1.136 node2" >> /etc/hosts
echo "192.168.1.137 node3" >> /etc/hosts
```
##### 2.4.2, Cài đặt MariaDB
**Thực hiện trên tất cả các node**

Khai báo repo
```
echo '[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.2/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1' >> /etc/yum.repos.d/MariaDB.repo
yum -y update
```
Cài đặt MariaDB
```
yum install -y mariadb mariadb-server
```
Cài đặt galera và gói hỗ trợ
```
yum install -y galera rsync
```
Tắt Mariadb
```
systemctl stop mariadb
```
Lưu ý:

  * Không khởi động dịch vụ mariadb sau khi cài (Liên quan tới cấu hình Galera Mariadb)

##### 2.4.3, Cấu hình Galera Cluster
**Tại node1**

Chỉnh sửa cấu hình
```
cp /etc/my.cnf.d/server.cnf /etc/my.cnf.d/server.cnf.bak

echo '[server]
[mysqld]
bind-address=10.0.0.128

[galera]
wsrep_on=ON
wsrep_provider=/usr/lib64/galera/libgalera_smm.so
#add your node ips here
wsrep_cluster_address="gcomm://10.0.0.128,10.0.0.129,10.0.0.130"
binlog_format=row
default_storage_engine=InnoDB
innodb_autoinc_lock_mode=2
#Cluster name
wsrep_cluster_name="portal_cluster"
# Allow server to accept connections on all interfaces.
bind-address=10.0.0.128
# this server ip, change for each server
wsrep_node_address="10.0.0.128"
# this server name, change for each server
wsrep_node_name="node1"
wsrep_sst_method=rsync
[embedded]
[mariadb]
[mariadb-10.2]
' > /etc/my.cnf.d/server.cnf
```
Trong đó:
  * wsrep_cluster_address: Danh sách các node thuộc Cluster, sử dụng địa chỉ IP internal
  * wsrep_cluster_name: Tên của cluster
  * wsrep_node_address: Địa chỉ IP của node đang thực hiện
  * wsrep_node_name: Tên node (Giống với hostname)
  * Không được bật mariadb (Quan trọng, nếu không sẽ dẫn tới lỗi khi khởi tạo Cluster)

**Tại node2**
```
cp /etc/my.cnf.d/server.cnf /etc/my.cnf.d/server.cnf.bak

echo '[server]
[mysqld]
bind-address=10.0.0.129

[galera]
wsrep_on=ON
wsrep_provider=/usr/lib64/galera/libgalera_smm.so
#add your node ips here
wsrep_cluster_address="gcomm://10.0.0.128,10.0.0.129,10.0.0.130"
binlog_format=row
default_storage_engine=InnoDB
innodb_autoinc_lock_mode=2
#Cluster name
wsrep_cluster_name="portal_cluster"
# Allow server to accept connections on all interfaces.
bind-address=10.0.0.129
# this server ip, change for each server
wsrep_node_address="10.0.0.129"
# this server name, change for each server
wsrep_node_name="node1"
wsrep_sst_method=rsync
[embedded]
[mariadb]
[mariadb-10.2]
' > /etc/my.cnf.d/server.cnf
```

**Tại node3**
```
cp /etc/my.cnf.d/server.cnf /etc/my.cnf.d/server.cnf.bak

echo '[server]
[mysqld]
bind-address=10.0.0.130

[galera]
wsrep_on=ON
wsrep_provider=/usr/lib64/galera/libgalera_smm.so
#add your node ips here
wsrep_cluster_address="gcomm://10.0.0.128,10.0.0.129,10.0.0.130"
binlog_format=row
default_storage_engine=InnoDB
innodb_autoinc_lock_mode=2
#Cluster name
wsrep_cluster_name="portal_cluster"
# Allow server to accept connections on all interfaces.
bind-address=10.0.0.130
# this server ip, change for each server
wsrep_node_address="10.0.0.130"
# this server name, change for each server
wsrep_node_name="node1"
wsrep_sst_method=rsync
[embedded]
[mariadb]
[mariadb-10.2]
' > /etc/my.cnf.d/server.cnf
```

**Khởi động dịch vụ**

Tại node1, khởi tạo cluster
```
galera_new_cluster
systemctl start mariadb
systemctl enable mariadb
```
Tại node2, node3, chạy dịch vụ mariadb
```
systemctl start mariadb
systemctl enable mariadb
```
**Kiểm tra**
Trên node1 tạo 1 database tên testlab
```
MariaDB [(none)]> create database testlab;
Query OK, 1 row affected (0.01 sec)

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| dominhhieu         |
| information_schema |
| mysql              |
| performance_schema |
| test               |
| testlab            |
+--------------------+
6 rows in set (0.00 sec)
```
Kiểm tra trên node2 và node3 đã được đồng bộ chưa

- trên node2
```
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| dominhhieu         |
| information_schema |
| mysql              |
| performance_schema |
| test               |
| testlab            |
+--------------------+
6 rows in set (0.00 sec)
```
- Trên node3
```
MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| dominhhieu         |
| information_schema |
| mysql              |
| performance_schema |
| test               |
| testlab            |
+--------------------+
6 rows in set (0.00 sec)
```