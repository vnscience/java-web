## Yêu Cầu Chung & Quy Định Nộp Bài

* **Hình thức:** Làm việc theo nhóm.
* **Mỗi nhóm:** **2 sinh viên / nhóm**.
* **Công nghệ bắt buộc:**
    * **Backend:** Spring Boot, Spring Data JPA.
    * **Frontend:** Thymeleaf + HTML/CSS.
    * **Database:** MySQL (hoặc CSDL quan hệ tương đương).
* **Yêu cầu chức năng tối thiểu:**
    * Phải có **ít nhất 2 Model (Entity)** có mối quan hệ **One-to-Many** (ví dụ: Lớp học và Sinh viên).
    * Phải hoàn thành đầy đủ chức năng **CRUD (Thêm, Đọc, Sửa, Xóa)** cho cả hai model.
    * Tổ chức code theo kiến trúc 3 lớp rõ ràng (`Controller`, `Service`, `Repository`).
* **Sản phẩm nộp:**
    1.  **Mã nguồn (Source Code):** Toàn bộ dự án Spring Boot (nén dưới dạng `.zip`).
    2.  **File SQL:** File `.sql` chứa CSDL và dữ liệu mẫu (nếu có).
* **Hình thức nộp:** Nộp qua Google Form do giảng viên cung cấp. Chỉ cần 1 thành viên đại diện nhóm nộp bài.

---

## Thời Gian Thực Hiện

* **Thời gian làm bài:** **2 tuần**.
* **Deadline nộp bài:** **23:59, Thứ Bảy, ngày 16 tháng 11 năm 2025**.
* **Hình thức báo cáo:** Các nhóm sẽ demo trực tiếp (chạy localhost) và trình bày vào buổi học tiếp theo (sẽ được thông báo cụ thể).

---

#### 1. Hệ thống Quản lý Kho hàng (E-commerce Mini)

* **Mô tả nghiệp vụ:** Xây dựng một trang admin cho phép chủ cửa hàng quản lý các danh mục và các sản phẩm thuộc danh mục đó.
* **Các Model chính:**
    1.  `DanhMuc` (Category):
        * `id` (Long), `tenDanhMuc` (String)
    2.  `SanPham` (Product):
        * `id` (Long), `tenSanPham` (String), `giaBan` (double), `moTa` (String)
* **Mối quan hệ:** Một `DanhMuc` có thể có nhiều `SanPham` (One-to-Many). Một `SanPham` chỉ thuộc về một `DanhMuc` (Many-to-One).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `DanhMuc`**. Lên ý tưởng và thực hiện CSS cho toàn bộ trang web.
    * **SV 2:** Phụ trách **CRUD cho `SanPham`**. Xử lý logic nghiệp vụ phức tạp hơn.
* **Yêu cầu tích hợp (Teamwork):**
    * Form "Thêm/Sửa Sản Phẩm" phải có một **dropdown (thẻ `<select>`)** cho phép người dùng chọn `DanhMuc` (danh sách `DanhMuc` này được SV 1 tạo ra).
    * Trang "Danh sách Sản Phẩm" phải hiển thị được **tên của danh mục** chứ không phải ID của danh mục.

---

#### 2. Nền tảng Blog/Tin tức Cá nhân

* **Mô tả nghiệp vụ:** Xây dựng một hệ thống cho phép admin tạo ra các "Tác giả" và các "Bài viết". Mỗi bài viết phải được gán cho một tác giả cụ thể.
* **Các Model chính:**
    1.  `TacGia` (Author):
        * `id` (Long), `hoTen` (String), `email` (String)
    2.  `BaiViet` (Post):
        * `id` (Long), `tieuDe` (String), `noiDung` (String, dùng `textarea`), `ngayViet` (LocalDate)
* **Mối quan hệ:** Một `TacGia` có thể viết nhiều `BaiViet` (One-to-Many).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `TacGia`**. Thiết kế CSDL và giao diện chính.
    * **SV 2:** Phụ trách **CRUD cho `BaiViet`**. Xử lý logic form và hiển thị nội dung.
* **Yêu cầu tích hợp (Teamwork):**
    * Form "Tạo Bài Viết" phải có **dropdown để chọn `TacGia`**.
    * Trang "Danh sách Bài Viết" phải hiển thị được tên tác giả.
    * **Nâng cao:** Tạo một trang "Chi tiết Tác Giả" (ví dụ `/tacgia/1`) hiển thị thông tin của tác giả đó và **liệt kê tất cả các bài viết** mà tác giả đó đã viết.

---

#### 3. Ứng dụng Quản lý Công việc (Project Tracker)

* **Mô tả nghiệp vụ:** Xây dựng một công cụ nội bộ để quản lý các dự án và các công việc (task) con bên trong mỗi dự án.
* **Các Model chính:**
    1.  `DuAn` (Project):
        * `id` (Long), `tenDuAn` (String), `nguoiQuanLy` (String)
    2.  `CongViec` (Task):
        * `id` (Long), `tenCongViec` (String), `trangThai` (String - ví dụ: "Mới", "Đang làm", "Hoàn thành"), `hanChot` (LocalDate)
* **Mối quan hệ:** Một `DuAn` có nhiều `CongViec` (One-to-Many).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `DuAn`**. Lên bố cục (layout) chung cho toàn trang web (dùng Thymeleaf Fragments).
    * **SV 2:** Phụ trách **CRUD cho `CongViec`**.
* **Yêu cầu tích hợp (Teamwork):**
    * Không thể tạo `CongViec` nếu không chọn một `DuAn` để gán vào.
    * Trang "Chi tiết Dự Án" (ví dụ `/duan/1`) phải hiển thị thông tin dự án và **liệt kê tất cả các công việc** thuộc dự án đó (chức năng này do SV 2 làm, nhưng hiển thị trên trang của SV 1).
    * **Nâng cao:** Thêm chức năng cho phép "Cập nhật nhanh trạng thái" của `CongViec` ngay trên trang danh sách mà không cần vào form Sửa.

---

#### 4. Hệ thống Đặt lịch Hẹn Bác sĩ (Mini)

* **Mô tả nghiệp vụ:** Xây dựng một hệ thống cho phép lễ tân của phòng khám quản lý hồ sơ bệnh nhân và các lịch hẹn khám của họ.
* **Các Model chính:**
    1.  `BenhNhan` (Patient):
        * `id` (Long), `hoTen` (String), `soDienThoai` (String), `namSinh` (int)
    2.  `LichHen` (Appointment):
        * `id` (Long), `ngayHen` (LocalDateTime), `lyDoKham` (String), `tenBacSi` (String)
* **Mối quan hệ:** Một `BenhNhan` có thể có nhiều `LichHen` (One-to-Many).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `BenhNhan`**. Xử lý CSS để trang web trông thân thiện.
    * **SV 2:** Phụ trách **CRUD cho `LichHen`**. Xử lý logic về thời gian (`LocalDateTime`).
* **Yêu cầu tích hợp (Teamwork):**
    * Khi tạo `LichHen` mới, phải chọn một `BenhNhan` từ danh sách (do SV 1 tạo).
    * Trang "Chi tiết Bệnh Nhân" (ví dụ `/benhnhan/1`) phải hiển thị thông tin bệnh nhân và **toàn bộ lịch sử các `LichHen`** của bệnh nhân đó.
    * **Nâng cao:** Thêm một trang "Lịch làm việc hôm nay" hiển thị tất cả các lịch hẹn có `ngayHen` là ngày hiện tại.
 

#### 5. Hệ thống Quản lý Lớp học và Sinh viên

* **Mô tả nghiệp vụ:** Xây dựng một công cụ cho phòng giáo vụ để quản lý danh sách các lớp học và sinh viên trong từng lớp.
* **Các Model chính:**
    1.  `LopHoc` (Class):
        * `id` (Long), `maLop` (String, ví dụ: "21T1"), `tenLop` (String, ví dụ: "Cao đẳng Tin học Ứng dụng K21"), `giaoVienChuNhiem` (String).
    2.  `SinhVien` (Student):
        * `id` (Long), `hoTen` (String), `email` (String), `diaChi` (String).
* **Mối quan hệ:** Một `LopHoc` có nhiều `SinhVien` (One-to-Many).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `LopHoc`**. Thiết kế layout chung (menu, footer) cho toàn bộ trang web.
    * **SV 2:** Phụ trách **CRUD cho `SinhVien`**. Xử lý CSS chi tiết cho các form và bảng.
* **Yêu cầu tích hợp (Teamwork):**
    * Khi thêm mới hoặc cập nhật một `SinhVien`, form phải có một **dropdown (thẻ `<select>`)** để chọn `LopHoc` mà sinh viên đó thuộc về.
    * Trang "Chi tiết Lớp học" (ví dụ: `/lophoc/1`) phải hiển thị thông tin của lớp và **liệt kê tất cả các sinh viên** đang có trong lớp đó.

---

#### 6. HR Hệ thống Quản lý Nhân sự Phòng ban

* **Mô tả nghiệp vụ:** Một ứng dụng HR cơ bản cho phép công ty quản lý các phòng ban và danh sách nhân viên thuộc các phòng ban đó.
* **Các Model chính:**
    1.  `PhongBan` (Department):
        * `id` (Long), `tenPhongBan` (String, ví dụ: "Phòng Kế toán", "Phòng IT").
    2.  `NhanVien` (Employee):
        * `id` (Long), `hoTen` (String), `email` (String), `chucVu` (String, ví dụ: "Trưởng phòng", "Lập trình viên").
* **Mối quan hệ:** Một `PhongBan` có nhiều `NhanVien` (One-to-Many).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `PhongBan`**. Thiết kế CSDL và giải thích được các mối quan hệ.
    * **SV 2:** Phụ trách **CRUD cho `NhanVien`**. Tối ưu hóa giao diện người dùng (CSS/HTML).
* **Yêu cầu tích hợp (Teamwork):**
    * Form thêm `NhanVien` mới phải cho phép chọn `PhongBan` từ một danh sách.
    * Khi xóa một `PhongBan`, phải xử lý logic cho các `NhanVien` thuộc phòng ban đó (ví dụ: không cho xóa nếu phòng ban còn nhân viên, hoặc set `phongBan` của nhân viên về `null`).
    * **Nâng cao:** Thêm một trang thống kê đơn giản (ví dụ: "Phòng IT: 5 nhân viên", "Phòng Kế toán: 2 nhân viên").

---

#### 7. Ứng dụng Quản lý Khách hàng và Giao dịch

* **Mô tả nghiệp vụ:** Một hệ thống CRM (Quản lý quan hệ khách hàng) mini, cho phép theo dõi thông tin khách hàng và lịch sử giao dịch của họ.
* **Các Model chính:**
    1.  `KhachHang` (Customer):
        * `id` (Long), `hoTen` (String), `soDienThoai` (String), `email` (String).
    2.  `GiaoDich` (Transaction):
        * `id` (Long), `soTien` (double), `noiDung` (String, ví dụ: "Mua sản phẩm A"), `ngayGiaoDich` (LocalDateTime).
* **Mối quan hệ:** Một `KhachHang` có thể có nhiều `GiaoDich` (One-to-Many).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `KhachHang`**. Tập trung vào việc làm cho giao diện (frontend) mượt mà.
    * **SV 2:** Phụ trách **CRUD cho `GiaoDich`**. Xử lý logic nghiệp vụ (backend) và CSDL.
* **Yêu cầu tích hợp (Teamwork):**
    * Trang "Chi tiết Khách hàng" (ví dụ: `/khachhang/1`) phải hiển thị thông tin của khách và **liệt kê toàn bộ lịch sử `GiaoDich`** của họ.
    * Khi thêm một `GiaoDich` mới, phải có chức năng tìm kiếm/chọn `KhachHang` để gán giao dịch đó vào.
    * **Nâng cao:** Trên trang chi tiết khách hàng, tính và hiển thị "Tổng số tiền đã giao dịch".

---

#### 8. Hệ thống Quản lý Hãng hàng không và Chuyến bay

* **Mô tả nghiệp vụ:** Xây dựng một trang nội bộ để quản lý các hãng hàng không và các chuyến bay mà hãng đó khai thác.
* **Các Model chính:**
    1.  `HangHangKhong` (Airline):
        * `id` (Long), `tenHang` (String, ví dụ: "Vietnam Airlines", "Vietjet Air"), `maHang` (String, ví dụ: "VN", "VJ").
    2.  `ChuyenBay` (Flight):
        * `id` (Long), `soHieuChuyenBay` (String, ví dụ: "VN123"), `diemDi` (String), `diemDen` (String), `gioBay` (LocalDateTime).
* **Mối quan hệ:** Một `HangHangKhong` có nhiều `ChuyenBay` (One-to-Many).
* **Phân chia công việc (Gợi ý):**
    * **SV 1:** Phụ trách **CRUD cho `HangHangKhong`**. Chịu trách nhiệm demo và trình bày nghiệp vụ.
    * **SV 2:** Phụ trách **CRUD cho `ChuyenBay`**. Chịu trách nhiệm demo và trình bày code.
* **Yêu cầu tích hợp (Teamwork):**
    * Form thêm `ChuyenBay` phải cho phép chọn `HangHangKhong` từ dropdown.
    * Trang "Danh sách Chuyến bay" phải hiển thị được tên `HangHangKhong` (chứ không phải ID).
    * **Nâng cao:** Thêm một trang tìm kiếm, cho phép người dùng nhập "Điểm đi" và "Điểm đến" và hệ thống sẽ hiển thị các chuyến bay phù hợp từ tất cả các hãng.
