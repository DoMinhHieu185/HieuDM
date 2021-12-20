# Trình tự thực thi tệp
.bash_profile, .bash_login, .bashrc, and .profile Đều làm khá giống nhau: thiết lập và xác định các hàm, biến và các loại

Sự khác biệt chính là .bashrc được gọi khi mở một của sổ không đăng nhập nhưng tương tác, .bash_profile và những cái khác được gọi cho một trình shell đăng nhập. Nhiều người có .bash_profile của họ hoặc các gọi tương tự .bashrc
### Section 40.1: .profile vs .bash_profile (and .bash_login)
.profile được đọc hầu hết bởi các shell khi khởi động, bao gồm cả bash. Tuy nhiên, .bash_profile được sử dụng cho các cấu hình cụ thể cho bash. Đối với mã khởi tạo chung, hãy đặt nó vào .profile. Nếu nó dành riêng cho bash, sử dụng .bash_profile

.profile không thực sự được thiết kế dành riêng cho bash, thay vào đó .bash_profile. bash sẽ trở lại .profile nếu không tìm thấy .bash_profile.

.bash_login là một dự phòng cho .bash_profile, nếu nó không được tìm thấy. Nói chung, tốt nhất nên sử dụng .bash_bash_profile hoặc .profile để thay thế.