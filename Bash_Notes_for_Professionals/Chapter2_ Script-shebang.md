# Section 2.1: Env shebang
Để thực thi một script với tệp thực thi bash được tìm thấy trong biến môi trường PATH bằng cách sử dụng tệp thực thi env, Dòng đầu tiên của script phải chỉ ra đường dẫn tuyệt đối đến tệp thực thi env với đối số là bash:
```
#!/usr/bin/env bash
```
Đường dẫn env trong shebang được giải quyết và chỉ được sử dụng nếu một tập lệnh được khởi chạy trực tiếp như thế này:
```
script.sh
```
Tệp lệnh phải có quyền thực thi

Shebang bị bỏ qua khi một trình thông dịch bash được chỉ định rõ ràng để thực thi một script:

```
bash script.sh
```

# Section 2.2: Direct shebang(Shebang trực tiếp)
Để thực thi tệp script với trình thông dịch bash, dòng đầu tiên của tệp tập lệnh phải chỉ ra đường dẫn tuyệt đối đến tệp thực thi bash để sử dụng:
```
#!/bin/bash
```
Đường dẫn `bash` trong shebang được giải quyết và chỉ được sử dụng khi một tập lệnh được khởi chạy trực tiếp như thế này:
```
./script.sh
```
Script phải được cấp quyền thực thi.

Shebang bị bỏ qua khi một trình thông dịch bash được chỉ định rõ ràng để thực thi một tệp lệnh:

```
bash script.sh
```

# Section 2.3: Other shebangs
* Có hai loại chương trình mà hạt nhân biết. Một chương trình nhị phân được xác định bằng tiêu đề ELF (ExtenableLoadableFormat - Định dạng có thể tái mở rộng), thường được tạo bởi trình biên dịch. Cái thứ hai là các kịch bản của bất kỳ loại nào.
* Nếu một tệp bắt đầu với dòng đầu tiên bằng chuỗi #! thì tiếp theo phải là tên đường dẫn của trình thông dịch.
* Nếu kernel đọc được dòng này, nó sẽ gọi trình thông dịch được đặt tên theo tên đường dẫn này và đưa các từ trong dòng làm đối số thông dịch.
```
#!/bin/bash something wrong
echo "This line never gets printed"
```
Sẽ không thực thi được câu lệnh vì trong /usr/bin/evn không có trình thông dịch something wrong, something wrong không thể xử lý được lệnh.
