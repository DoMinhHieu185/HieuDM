# File Transfer using scp(Truyền tệp bằng scp)
### Section 42.1: scp transferring file(scp chuyển tệp)
Để chuyển tệp một cách an toàn sang máy khác - hãy nhập
```
scp file1.txt tom@server2:$HOME
```
chuyển file1.txt từ máy chủ của mình đến thư mục chính của user tom của server2 

### Section 42.2: scp transferring multiple files(scp chuyển nhiều tệp)
scp cũng có thể được sử dụng để chuyển nhiều tệp từ máy chủ này sang máy chủ khác
```
scp /my_folder/*.txt tom@server2:$HOME
```

### Section 42.3: Downloading file using scp(Tải xuống tệp bằng scp)
Để tải tệp từ máy chủ từ xa xuống máy cục bộ - hãy nhập
```
scp tom@server2:$HOME/file.txt /local/machine/path/
```
tải xuống tệp có tên file.txt từ thư mục chính của user tom vào thư mục cục bộ của mình
