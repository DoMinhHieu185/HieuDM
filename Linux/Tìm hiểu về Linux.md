# Linux
## Linux là gì?
- Linux là tên gọi của một hệ điều hành máy tính và cũng như tên hạt nhân của hệ điều hành 
- Thuật ngữ Linux được sử dụng để chỉ nhân Linux 
- Linux đồng thời được sử dụng rộng rãi để miêu tả tổng thể một hệ điều hành tương tự Unix(còn được viết dưới tên GNU/Linux) được tạo ta bởi việc đống gói các nhân Linux cùng với các công cụ GNU, cũng như các bản phân phối Linux.
- Ngày nay Linux được phân ra nhiều nhánh như: ubuntu, linux mint, centos, kali linux,....
## Cấu trúc file trong Linux

![](/Linux/image/32.png)

- Cấu trúc cơ sở của Linux khác hoàn toàn so với Windows. Nó được phát triển trên một mã gốc riêng với các nhà phát triển riêng rẽ. Bạn sẽ không tìm thấy thư mục My Documents trên Ubuntu hay Program Files trên Fedora. Cũng không có các ổ đĩa C: hay D: xuất hiện.
- Thay vào đó, có một cây dữ liệu và các ổ đĩa được bung vào cây đó. Tương tự, thư mục home và desktop đều là một phần trong cây dữ liệu. Về mặt kỹ thuật, bạn sẽ cần tìm hiểu một hệ thống và kiến trúc file mới hoàn toàn. Thực tế thì việc này không quá khó nhưng sự khác biệt vẫn là rõ rệt

  - /etc: Chứa các tập tin cấu hình
  - /dev: chứa các file thiết bị
  - /home: Thư mục này chứa tất cả các file cá nhân của từng người dùng
  - /usr: Chứa các thư viện, file thực thi, tài liệu hướng dẫn và mã nguồn cho chương trình chạy ở level 2 của hệ thống
  - /var: Thông tin về các biến của hệ thống được lưu trong thư mục này 
  - /lib: Chứa cá thư viện hỗ trợ cho các file thực thi trong /bin và /sbin

## ưu và nhược điểm của hệ điều hành Linux
### Ưu điểm
- Hoàn toàn miễn phí
- Bảo mật cao: Linux, các mã độc, virus hay phần mềm độc hại đều bị ngăn chặn do tính bảo mật của hệ điều hành này cực kỳ cao
- Tính linh hoạt:người dùng còn có thể chỉnh sửa hệ điều hành theo nhu cầu sử dụng của mình. Đây chính cơ hội lý tưởng cho các lập trình viên cũng như các nhà phát triển.
- Hoạt động “mượt” trên các máy tính có cấu hình yếu: Với Linux, khi nâng cấp lên phiên bản mới, các máy tính có cấu hình yếu vẫn sẽ được nâng cấp và hỗ trợ thường xuyên – tức chất lượng hoạt động vẫn trơn tru và ổn định
### Nhược điểm
- Số lượng ứng dụng hỗ trợ trên Linux chưa phong phú, còn khá ít sự lựa chọn cho người dùng
- Một số nhà sản xuất không phát triển driver hỗ trợ nền tảng Linux.
- Bạn sẽ mất một khoảng thời gian để “thích nghi” nếu chuyển từ Windows sang Linux vì thực sự khá khó để làm quen với Linux.
- Tuỳ vào tính chất, nhu cầu sử dụng mà bạn cần tìm một hệ điều hành thích hợp với mình.
## Công dụng Linux
- Quản lý và điều phối các tài nguyên của hệ thống.
- Giúp người dùng có thể nhìn thấy hầu như mọi dòng code trong Linux. Hỗ trợ tốt nhất cho việc chỉnh sửa và phát triển hệ điều hành dựa trên nhu cầu riêng của khách hàng
- Miễn phí mọi tính năng và không cần mua bản quyền.
- Giao diện đa dạng, tính bảo mật cao, thường xuyên được nâng cấp lên phiên bản mới.
Đặc biệt, hệ điều hành Linux tương đối nhẹ. Do đó, các máy có cấu hình yếu vẫn có thể hoạt động ổn định trên hệ điều hành này.
## Điểm khác biệt giữa Windows và Linux
- Cấu trúc file: 
  - Với Linux, các thư mục như My Documents, ổ đĩa C, ổ đĩa D sẽ được thay bằng cây dữ liệu. Các ổ đĩa sẽ được đặt vào đó, kể cả thư mục Home và Desktop.
- Không sử dụng Registry:
  - Registry là một cơ sở dữ liệu chủ cho toàn bộ các thiết lập nằm trên máy tính với chức năng nắm giữ thông tin ứng dụng, mật khẩu người dùng, thông tin thiết bị…
  - Tuy nhiên, Linux không sử dụng registry, mà các dữ liệu được sắp xếp dưới dạng mô đun. Để lưu dữ liệu của người dùng, Linux lưu thiết lập của mình trên cơ sở chương trình phân cấp người dùng.
- Trình quản lý gói
  - Với Linux, các chương trình được cài đặt trong máy không ở dưới dạng *.exe như Windows mà được tập hợp trong một chương trình quản lý gói (package manager).
- Giao diện 
  - Trong quá trình nâng cấp và phát triển, giao diện của Windows không có quá nhiều thay đổi. Trong khi với Linux, vì giao diện hoàn toàn tách rời với hệ thống lõi nên người dùng có thể tùy thời đổi giao diện mà không cần cài lại win.
- Lệnh đầu cuối
  - Linux là hệ điều hành mở với các dòng code hiển thi công khai được trình bày dưới dạng một hộp đen với các dòng chữ xanh.
- Tài khoản và quyền user

Linux có 3 loại user: Regular, Administrator (Root), Service. Trong đó:
  - Regular: Là tài khoản user thông thường được tạo khi cài đặt Ubuntu trên máy tính. Tất cả các file, thư mục được lưu trữ trong /home/ là thư mục chính của tài khoản này. User này không có quyền truy cập vào thưc mục của những user khác.
  - Root: Tài khoản này được tạo ra tại thời điểm cài đặt Linux. Root là một superuser, có thể truy cập vào những file bị giới hạn quyền, cài đặt phần mềm và có quyền quản trị. Bất cứ khi nào bạn muốn cài đặt phần mềm, thay đổi file hệ thống hoặc thực hiện các tác vụ cần quyền quản trị khác trên Linux thì phải đăng nhập bằng tài khoản Root. Những hoạt động như nghe nhạc, duyệt web thì có thể sử dụng tài khoản bình thường cũng được.
  - Service: Hẳn bạn cũng biết Linux là bá chủ trong hệ điều hành máy chủ. Các dịch vụ như Apache, Squid, email,... đều có những tài khoản dịch vụ cá nhân riêng. Những tài khoản này giúp tăng tính bảo mật cho máy tính. Linux cũng cho phép hoặc từ chối truy cập vào những nguồn lực khác nhau tùy thuộc vào dịch vụ.
- Các thiết lập điều khiển khác
  - Linux thích hợp dùng để lướt web, chat và email hơn là sử dụng để chơi game.



