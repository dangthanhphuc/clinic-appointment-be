# Đề tài: **Đặt hẹn phòng khám**

Ứng dụng hỗ trợ người dùng đặt lịch hẹn tại phòng khám, giúp quản lý lịch hẹn dễ dàng và tiện lợi.

---

## Mục tiêu của dự án

Mục tiêu của ứng dụng là cung cấp nền tảng trực tuyến để bệnh nhân có thể dễ dàng đặt lịch hẹn khám bệnh tại phòng khám. Dự án giúp cải thiện quá trình quản lý lịch hẹn, tiết kiệm thời gian và tăng hiệu quả làm việc cho phòng khám.

## Các tính năng chính

- **Đặt lịch hẹn**: Cho phép bệnh nhân xem lịch trống và đặt hẹn theo thời gian có sẵn.
- **Quản lý thông tin lịch hẹn**: Cho phép phòng khám quản lý các lịch hẹn đã đặt, xác nhận, hoặc hủy lịch khi cần.
- **Thông báo nhắc lịch**: Gửi thông báo nhắc nhở cho bệnh nhân về lịch hẹn đã đặt.
- **Tìm kiếm và xem thông tin bác sĩ**: Bệnh nhân có thể tìm kiếm và xem thông tin chi tiết về các bác sĩ tại phòng khám.

---

## Kiến trúc & Công nghệ sử dụng

Dự án được xây dựng dựa trên kiến trúc MVC để phân tách rõ ràng giữa các phần giao diện người dùng (View), xử lý nghiệp vụ (Controller), và dữ liệu (Model), đảm bảo tính mở rộng và dễ bảo trì.

### Công nghệ sử dụng

- ![Angular](https://img.shields.io/badge/Angular-DD0031?style=for-the-badge&logo=angular&logoColor=white): Xây dựng giao diện người dùng và quản lý các component, service.
- ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white): Xử lý logic backend và các RESTful API.
- ![Java](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white): Ngôn ngữ lập trình chính của backend.
- ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white): Lưu trữ và quản lý dữ liệu người dùng, lịch hẹn và thông tin bác sĩ.

---

## Hướng dẫn cài đặt và chạy ứng dụng

### Yêu cầu hệ thống

- **Node.js** >= 14.x
- **Angular CLI** >= 12.x
- **Java** >= 11
- **MySQL** >= 8.x

### Cài đặt

1. **Backend (Spring Boot)**
   - Clone repository backend: `git clone <backend-repo-url>`
   - Cấu hình kết nối MySQL trong `application.properties`.
   - Khởi động ứng dụng backend: `mvn spring-boot:run`.

2. **Frontend (Angular)**
   - Clone repository frontend: `git clone <frontend-repo-url>`
   - Cài đặt các dependency: `npm install`.
   - Khởi động ứng dụng frontend: `ng serve`.

---

## Hướng dẫn sử dụng

1. **Đăng nhập/Đăng ký**: Người dùng mới có thể đăng ký tài khoản hoặc đăng nhập để đặt lịch hẹn.
2. **Đặt lịch hẹn**: Chọn ngày và giờ phù hợp từ các khung giờ có sẵn.
3. **Quản lý lịch hẹn**: Người dùng có thể xem lại hoặc hủy lịch hẹn trong phần quản lý.
4. **Thông báo**: Ứng dụng sẽ gửi thông báo qua email hoặc ứng dụng khi lịch hẹn sắp đến.

---

## Đóng góp

Chúng tôi luôn chào đón những đóng góp từ cộng đồng. Nếu bạn muốn tham gia, vui lòng liên hệ với chúng tôi qua email hoặc gửi pull request trên GitHub.

---

## Liên hệ

- **Email**: 
- **Website**:

---

