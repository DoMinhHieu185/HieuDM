# co-processes
### Section 51.1: Hello World
```
# Tạo co-process
coproc bash
# gửi một lệnh đến nó (echo a)
echo 'echo Hello World' >&"${COPROC[1]}"
# đọc một dòng từ đầu ra của nó
read line <&"${COPROC[0]}"
# hiển thị dòng
echo "$line"
```
Output
```
Hello World
```
