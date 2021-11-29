# lsof (LiSt Open Files)
### 1. List open files
```
$ lsof
```
```
[root@localhost ~]# lsof
COMMAND    PID  TID    USER   FD      TYPE             DEVICE  SIZE/OFF       NODE NAME
systemd      1         root  cwd       DIR              253,0       267         64 /
systemd      1         root  rtd       DIR              253,0       267         64 /
systemd      1         root  txt       REG              253,0   1632744     293844 /usr/lib/systemd/systemd
systemd      1         root  mem       REG              253,0     20064      15944 /usr/lib64/libuuid.so.1.3.0
systemd      1         root  mem       REG              253,0    265576      22552 /usr/lib64/libblkid.so.1.1.0
systemd      1         root  mem       REG              253,0     90176      15942 /usr/lib64/libz.so.1.2.7
systemd      1         root  mem       REG              253,0    157424      22581 /usr/lib64/liblzma.so.5.2.2
systemd      1         root  mem       REG              253,0     23968      38683 /usr/lib64/libcap-ng.so.0.0.0
systemd      1         root  mem       REG              253,0     19896      38671 /usr/lib64/libattr.so.1.1.0
systemd      1         root  mem       REG              253,0     19248        797 /usr/lib64/libdl-2.17.so
systemd      1         root  mem       REG              253,0    402384      38575 /usr/lib64/libpcre.so.1.2.0
systemd      1         root  mem       REG              253,0   2156592        791 /usr/lib64/libc-2.17.so
systemd      1         root  mem       REG              253,0    142144        817 /usr/lib64/libpthread-2.17.so
```

### 2. List network connections
```
$ lsof -i
```
```
[root@localhost ~]# lsof -i
COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
dhclient  797 root    6u  IPv4  19117      0t0  UDP *:bootpc
sshd      980 root    3u  IPv4  19942      0t0  TCP *:ssh (LISTEN)
sshd      980 root    4u  IPv6  19955      0t0  TCP *:ssh (LISTEN)
master   1142 root   13u  IPv4  20606      0t0  TCP localhost:smtp (LISTEN)
master   1142 root   14u  IPv6  20608      0t0  TCP localhost:smtp (LISTEN)
sshd     1285 root    3u  IPv4  21167      0t0  TCP localhost.localdomain:ssh->192.168.1.1:62710 (ESTABLISHED)
sshd     1289 root    3u  IPv4  21237      0t0  TCP localhost.localdomain:ssh->192.168.1.1:62711 (ESTABLISHED)
sshd     1419 root    3u  IPv4  22213      0t0  TCP localhost.localdomain:ssh->192.168.1.1:58145 (ESTABLISHED)
sshd     1423 root    3u  IPv4  22283      0t0  TCP localhost.localdomain:ssh->192.168.1.1:58157 (ESTABLISHED)
```

### 3. List open files of a specific user
```
$ lsof -u root
```
```
[root@localhost ~]# lsof -u root
COMMAND    PID USER   FD      TYPE             DEVICE  SIZE/OFF       NODE NAME
systemd      1 root  cwd       DIR              253,0       267         64 /
systemd      1 root  rtd       DIR              253,0       267         64 /
systemd      1 root  txt       REG              253,0   1632744     293844 /usr/lib/systemd/systemd
systemd      1 root  mem       REG              253,0     20064      15944 /usr/lib64/libuuid.so.1.3.0
systemd      1 root  mem       REG              253,0    265576      22552 /usr/lib64/libblkid.so.1.1.0
systemd      1 root  mem       REG              253,0     90176      15942 /usr/lib64/libz.so.1.2.7
systemd      1 root  mem       REG              253,0    157424      22581 /usr/lib64/liblzma.so.5.2.2
systemd      1 root  mem       REG              253,0     23968      38683 /usr/lib64/libcap-ng.so.0.0.0
```

### 4. List open files of a specific process
```
$ lsof -p 896
```
```
[root@localhost ~]# lsof -p 7
COMMAND   PID USER   FD      TYPE DEVICE SIZE/OFF NODE NAME
migration   7 root  cwd       DIR  253,0      267   64 /
migration   7 root  rtd       DIR  253,0      267   64 /
migration   7 root  txt   unknown                      /proc/7/exe
```

### 5. List processes listening on specific port
```
lsof -i TCP:8080
```
```
[root@localhost ~]# lsof -i TCP:22
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
sshd     980 root    3u  IPv4  19942      0t0  TCP *:ssh (LISTEN)
sshd     980 root    4u  IPv6  19955      0t0  TCP *:ssh (LISTEN)
sshd    1285 root    3u  IPv4  21167      0t0  TCP localhost.localdomain:ssh->192.168.1.1:62710 (ESTABLISHED)
sshd    1289 root    3u  IPv4  21237      0t0  TCP localhost.localdomain:ssh->192.168.1.1:62711 (ESTABLISHED)
sshd    1419 root    3u  IPv4  22213      0t0  TCP localhost.localdomain:ssh->192.168.1.1:58145 (ESTABLISHED)
sshd    1423 root    3u  IPv4  22283      0t0  TCP localhost.localdomain:ssh->192.168.1.1:58157 (ESTABLISHED)
```
### 6. Kill processes of a specific user
```
$ kill -9 `lsof -t -u mtitek`
```
