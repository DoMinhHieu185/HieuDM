# Định tuyến
- Trong ngành mạng máy tính, định tuyến(routing) là quá trình chọn lựa các đường đi trên một mạng máy tính để gửi gói dữ liệu qua đó. Việc định tuyến được thực hiện cho nhiều loại mạng, trong đó có mạng điện thoại, liên mạng, internet, mạng giao thông. Thiết bị phần cứng chuyên dùng được gọi là router(bộ định tuyến)
- Có 2 kiểu định tuyến chính: Định tuyến tĩnh và định tuyến động
## 1. Định tuyến tĩnh(static)
- là 1 quá trình định tuyến, mà để thực hiện ta phải cấu hình bằng tay, từng đường đi nước bước, địa chỉ cụ thể cho Router.
- Một dạng mặc định của định tuyến tĩnh là Default Route. Định tuyến này được sử dụng khi ta chưa cấu hình định tuyến đường đi cụ thể nào.
  - Đặc điểm của default route là:
    - Độ ưu tiên thấp nhất, nằm chót bảng định tuyến(tức là  khi có  1 định tuyến mới được config vào nó sẽ ưu tiên định tuyến mới luôn.)
    - Không cần biết mạng đích nằm ở đâu và subnet mask là gì.
  - Default Route khi router nhận được bất kì gói tin nào có đích đến là mạng ngoài không nằm trong bảng định tuyến thì theo mặc định nó sẽ forward gói tin đó  tới một router đã được cấu hình sẵn, Router mặc định  đã cấu hình đó chính là ISP.
## 2. Định tuyến động(Dymanic)
- là một dạng định tuyến mà khi cấu hình ở dạng này, Router sẽ thực hiện định tuyến 1 cách tự động mà ta không cần phải chỉ ra từng đường đi như định tuyến tĩnh nữa.
