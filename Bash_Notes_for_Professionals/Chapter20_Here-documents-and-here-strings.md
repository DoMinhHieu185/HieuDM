# Here documents and here strings
### Section 20.1: Execute command with here document(Thực thi lệnh với Here documents)
```
[root@localhost ~]# ssh -p 22 root@192.168.1.134 <<EOF
>  echo 'printing pwd'
> echo "\$(pwd)"
>  ls
>  find '*.txt'
> EOF
```
Cách khác:
```
[root@localhost ~]# ssh -p 22 root@192.168.1.134 <<'EOF'
>  echo 'printing pwd'
> echo "\$(pwd)"
>  ls
>  find '*.txt'
> EOF
```
output:
```
root@192.168.1.134's password:
printing pwd
/root
anaconda-ks.cfg
configwp.sh
find: ‘*.txt’: No such file or directory
```
Lệnh được thực thi trên shell từ xa. Và hiện thị tại output shell hiện tại

  > Lưu ý: EOF đóng ở đầu dòng(không có khoảng trắng trước). Nếu cần thụt lè, các tab có thể được sử dụng nếu bạn bắt đầu heredocs của mình bằng <<-

### Section 20.2: Indenting here documents(Thụt lề)
Bạn có thể thụt lề văn bản bên trong tài liệu ở đây và các tab, cần sử dụng toán tử redirection `<<-` thay vì `<<`:
```
cat <<- EOF
Nội dung văn bản line1
    Nội dung văn bản line2
        Nội dung văn bản line3
EOF
```
Output:
```
[root@localhost ~]# ./text.sh 
Nội dung văn bản line1
    Nội dung văn bản line2
        Nội dung văn bản line3
```

### Section 20.3: Create a file(Tạo file)
Cách sử dụng của các tài liệu ở đây là tạo tệp bằng cách nhập nội dung của nó:
```
cat > fruits.txt << EOF
apple
orange
lemon
EOF
```
Output
```
[root@localhost ~]# cat fruits.txt
apple
orange
lemon
```
Here-document là các dòng giữa `<< EOF` và `EOF`

Here-document ở đây trở thành đầu vào và sử dụng chuyển hướng đầu ra `>` đến tệp `fruit.txt`. Nếu `fruit.txt` không tồn tại, nó sẽ được tạo. Nếu nó tồn tại, nó sẽ bị loại bỏ và thêm here-document. Còn nếu nối tiếp vào file hiện có sử dụng chuyển hướng đầu vào `>>`.

### Section 20.4: Here strings
Bạn có thể cung cấp lệnh bằng các sử dụng here strings như thế này:
```
[root@localhost ~]# awk '{print $2}' <<< "hello world - how are you?"
world
[root@localhost ~]# awk '{print $3}' <<< "hello world - how are you?"
-
[root@localhost ~]# awk '{print $1}' <<< "hello how are you
> One two three four"
hello
One
[root@localhost ~]# awk '{print $4}' <<< "hello how are you
> One two three four"
you
four
```
Lệnh trên dùng để in ra các chuỗi ở vị trí trị định nhất định.

### Section 20.5: Limit Strings
Heredoc sử dụng một chuỗi giới hạn để xác định thời điểm ngừng sử dụng đầu vào. Chuỗi giới hạn kết thúc phải có điều kiện sau:

* Ở đầu dòng
* Là văn bản duy nhất trên dòng. Lưu ý: nếu bạn sử dụng <<- Limitstring có thể được bắt đầu bằng tabs \t
```
cat <<limitstring
line 1
line 2
limitstring
```
Output
```
[root@localhost ~]# ./test.sh
line 1
line 2
```
Đây là một cách sử dụng sai:
```
cat <<limitstring
line 1
line 2
 limitstring
```
`limitstring` không đứng ở đầu dòng, nên shell sẽ tiếp tục đợi nhập thêm, đợi cho đến khi limitstring xuất hiện ở đầu dòng thì lệnh cat mới thực hiện





