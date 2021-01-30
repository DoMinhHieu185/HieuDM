# Một số khái niệm cơ bản
## Truyền thông máy tính
Là quá trình truyền dữ liệu từ thiết bị này sang thiết bị khác.
## Khái niệm mạng
Là chỉ khái niệm kết nối các thiết bị lại với nhau nhằm mục đích chia sẻ thông tin.
## Giao thức truyền thông(protocol)
mô tả những nguyên tắc mà tất cả các thành phần mạng cần tuân thủ để có thể trao đổi được với nhau.
## Topo( mô hình ghép nối mạng / hình trạng mạng)
Mô tả Các cách thức nối các thiết bị với nhau
## Địa chỉ
Mô tả cách thức định vị một đối tượng trên mạng
## Định tuyến(routing)
Mô tả cách thức dữ liệu truyền từ thiết bị này sang thiết bị khác trên mạng.
## Tính tin cậy
giải quyết tính toàn vẹn dữ liệu, đảm bảo dữ liệu nhận được chính xác với dữ liệu gửi đi.
## Khả năng liên tác
Chỉ mức độ các sản phẩm phần mềm vầ phần cứng của các hãng sản xuất khác nhau có thể làm việc cùng nhau.
## An ninh
Đảm bảo an toàn hoặc bảo vệ tất cả các thành phần của mạng
## Chuẩn
Thiết lập các quy tắc và luật lệ cụ thể cần phải tuân theo.
# Mạng máy tính
Mạng gồm nhiều thành phần, các thành phần được nối với nhau theo một cách nào đó và cùng sử dụng chung một ngôn ngữ
1. Các thiết bị đầu cuối(end system) kết nối với nhau tạo thành mạng có thể là các máy tính hoặc các thiết bị khác.
2. Môi trường truyền: Thực hiện truyền dẫn các tín hiệu vật lí. Môi trường truyền dẫn có thể là các loại dây dẫn(cáp), sóng(đối với mạng không dây).
3. Giao thức:Quy tắc cách thức trao đổi dữ liệu giữa các thực thể.
## Khái niệm mạng máy tính
Là tập hợp các máy tính và các thiết bị phụ trợ khác sử dụng chung một nhóm giao thức đẻ chia sẻ tài nguyên thông qua các phương tiện truyền thông mạng.
## Các thành phần mạng: thiết bị, nút, máy tính
1. thiết bị ( device ): thuật ngữ divice chỉ bất cứ một thực thể phần cứng nào, chẳng hạn các thiết bị đầu cuối, ,máy in, máy tinh, hoặc 1 thiết bị phần cứng đặc biệt liên quan đến mạng, ví dụ máy chủ ( server ), repeater (bộ lặp), bridge (cầu), switch, router (bộ định tuyến), và rất nhiều các thiết bị khác.
2. có nhiều phương pháp gán cho thiết bị mạng một định danh duy nhất, thường thiết bị được chính hãng sản xuất gắn một số bộ nhận dạng duy nhất. việc này tương tự như việc in số seri trên tivi hoặc các đồ dùng điện tử
Ví dụ: card Ethernet được hãng sản xuất gán cho một địa chỉ duy nhât - địa chỉ này không trùng với bất kỳ card Ethernet nào khác.
3. Khi mô tả các thành phần mạng, cần phân biệt giữa khái niệm thiết bị (device) và máy tính (computer). Nếu xét ở khía cạnh thiết bị máy tính thường được gọi là host ( hoặc server ) hay trạm làm việc (workstation) (cũng còn được gọi là desktop hay client ). Thuật ngữ này thường dùng để chỉ những hệ thống máy tính có cài đặt hệ điều hành riêng của minh (ví dụ windows, Unix). Vì vậy workstation có thể là máy tính cá nhân như máy apple Macintosh, hoặc bất cứ máy tính họ Intel nào ( thường được gọi là IBM-PC); cũng có thể là 1 workstation đồ họa ( ví dụ các workstation đồ họa được sản xuất bởi Sun Microsystem, Silicon Graphics, IBM, Hewlett - parkard, compaq Computer Corpration), một supperminicomputer như Compaq's Vax hay một hệ thống IBM AS/400, một super-microcomputer như Compaq's Alpha; hoặc có thể là một máy tính lớn (mainframe) như IBM ES-9000.
## phương tiện và các giao thức truyền thông mạng
để share và sử dụng network sercive, các thành phần của mạng phải có khả năng truyền thông được với nhau. Để đáp ứng được yêu cầu này ta phải xét tới 2 tiêu chí cụ thể của mạng:
1. khả năng liên kết: chỉ đường truyền hoặc kết nối vật lý giữ các thành phần.
2. Ngôn ngữ: chỉ một bảng từ vựng cùng các quy tắc truyền thông mà các thành phần phải tuân thủ.
## Môi trường truyền thông 
1. Môi trường truyền thông sử dụng 2 loại cable
* cap (cable), có thể là cáp xoắn đôi (twisted-pair), cáp đồng trục (coaxial), và cáp sợi quan (fiber-optic cable)...
* không dây ( wireless ), có thể là sóng radio (gồm sóng cực ngắn hay chỉ truyền thông qua vệ tinh), bức xạ hồng ngoại
2. Giao thức (protocol). Ngôn ngữ được sử dụng bởi các thực thể mạng gọi là giao thức truyền thông mạng. Các bên "hiểu nhau" do giao thức định nghĩa 1 ngôn ngữ chung giữa các thành phần mạng. Từ ý nghĩa khái quát này có thể hiểu giao thức truyền thông mạng là các thủ tục, quy tắc hoặc các đặc tả chính thức đã được chấp nhận nhằm xác định hình vi và ngôn ngữ trao đổi giữa các bên. Nói chung trong cuộc sống hàng ngày, chúng ta cũng áp dụng những quy tắc nào đó.
3. Không có môi trường truyền thì không thể trao đổi giữa các thực thể mạng; không có ngôn ngữ chung, không thể hiểu được nhau. Vì vậy, đường truyền cần cung cấp môi trường để thực truyền thông, trong khi đó ngôn ngữ chung đảm bảo 2 bên truyền thông có thể hiểu được nhau

