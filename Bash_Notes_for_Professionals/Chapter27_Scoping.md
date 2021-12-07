# Chapter 27: Scoping
### Section 27.1: Dynamic scoping in action(Phạm vi động trong hoạt động)
Phạm vi động có nghĩa là việc tra cứu biến xảy ra trong phạm vi nơi một hàm được gọi , không phải ở nơi nó được xác định
```
$ x=3
$ func1 () { echo "in func1: $x"; }
$ func2 () { local x=9; func1; }
$ func2
in func1: 9
$ func1
in func1: 3
```
Trong một ngôn ngữ có phạm vi từ vựng, func1 sẽ luôn xem xét trong phạm vi toàn cục cho giá trị của x , bởi vì func1 là được xác định trong phạm vi địa phương

Trong một ngôn ngữ có phạm vi động, func1 tìm trong phạm vi mà nó được gọi . Khi nó được gọi từ bên trong func2 , nótrước tiên, tìm giá trị x trong phần thân của func2 . Nếu nó không được xác định ở đó, nó sẽ nằm trong phạm vi toàn cầu, nơi func2 đã được gọi
