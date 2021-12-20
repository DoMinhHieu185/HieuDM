# Tách tệp tin
Đôi khi, rất hữu ích khi chia tệp thành nhiều tệp riêng biệt. Nếu bạn có các tệp lớn, có thể chia nó thành nhiều phần nhỏ.
### Section 41.1: Split a file
Chạy một lệnh split mà không có bất kỳ tùy chọn nào sẽ chia tệp thành 1 hoặc nhiều tệp riêng biệt có chứa tối đa 1000 dòng
```
split file
```
Thao tác này sẽ tạo các tệp có tên xâ, xab, xac, vv, mỗi tẹp đều chứa tối đa 1000 dòng. Như bạn có thể thấy, tất cả chúng đều là tiền tố chữ x theo mặc định. Nếu tệp ban đầu ít hơn 1000 dòng, chỉ một tệp được tạo.

Để thay đổi tiền tố, hãy thêm tiền tố bạn muốn vào cuối dòng lệnh 
```
split file customprefix
```

Bây giờ các tệp có tên customprefixaa, customprefixab, customprefixac, v.v. sẽ được tạo.

Để chỉ định số dòng cần xuất hiện trên mỗi tệp hãy sử dụng tùy chọn -l. Phần sau sẽ chia một tệp thành tối đa là 5000 dòng.
```
split -l5000 file
```
Hoặc 
```
split --lines=5000 file

```

Ngoài ra, bạn có thể chỉ định số byte tối đa thay vì đầu dòng. Điều này được thực hiện bằng các sử dụng tùy chọn -b hoặc --byte. Ví dụ, Để cho phép tối đa 1MB
```
split --lines=5000 file
```