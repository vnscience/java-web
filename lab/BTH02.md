## BÀI THỰC HÀNH CHƯƠNG 2: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG - JAVA

### **BÀI THỰC HÀNH TẠI LỚP**

**Dự án: Xây dựng ứng dụng quản lý sinh viên và giảng viên**

**Mục tiêu:** Vận dụng các kiến thức về Lập trình Hướng đối tượng (Trừu tượng, Kế thừa, Đa hình, Đóng gói) để xây dựng một phần mềm quản lý nhân sự đơn giản trong trường học.

#### **Nhiệm vụ 1: Xây dựng Lớp Trừu Tượng `Nguoi`**

Thiết kế lớp `Nguoi` làm lớp cha chung, bao gồm các thành phần sau:

* **Thuộc tính (private):**
    * `hoTen` (String)
    * `namSinh` (int)
* **Phương thức:**
    * Constructors phù hợp.
    * Getters và Setters cho tất cả thuộc tính.
    * Một phương thức trừu tượng `hienThiThongTin()`: Dùng để in thông tin chi tiết.

#### **Nhiệm vụ 2: Xây dựng các Lớp Con**

Từ lớp `Nguoi`, xây dựng 2 lớp con:

1.  **Lớp `SinhVien` kế thừa `Nguoi`:**
    * **Thuộc tính riêng (private):**
        * `maSV` (String)
        * `diemTrungBinh` (double)
    * **Phương thức:**
        * Constructors phù hợp.
        * Getters và Setters cho các thuộc tính riêng.
        * Ghi đè (Override) phương thức `hienThiThongTin()` để hiển thị đầy đủ thông tin của sinh viên.

2.  **Lớp `GiangVien` kế thừa `Nguoi`:**
    * **Thuộc tính riêng (private):**
        * `maGV` (String)
        * `khoa` (String): Khoa mà giảng viên đang công tác.
    * **Phương thức:**
        * Constructors phù hợp.
        * Getters và Setters cho các thuộc tính riêng.
        * Ghi đè phương thức `hienThiThongTin()` để hiển thị đầy đủ thông tin của giảng viên.

#### **Nhiệm vụ 3: Xây dựng Lớp `QuanLyNhanSu`**

Tạo lớp `QuanLyNhanSu` để quản lý các đối tượng người trong trường.

* **Thuộc tính (private):**
    * Một danh sách (ví dụ: `ArrayList`) để lưu trữ các đối tượng `Nguoi`.
* **Phương thức (public):**
    * `themNguoi(Nguoi nguoi)`: Thêm một người mới vào danh sách.
    * `xoaNguoi(String ten)`: Xóa một người khỏi danh sách dựa vào họ tên.
    * `hienThiToanBoDanhSach()`: In thông tin của tất cả mọi người có trong danh sách.
    * `timKiemTheoTen(String ten)`: Tìm kiếm và hiển thị tất cả những người có tên chứa chuỗi tìm kiếm.

#### **Nhiệm vụ 4: Tạo Lớp `Main` để Chạy Chương Trình**

Tạo một lớp `Main` có hàm `main` để xây dựng một menu chức năng cho phép người dùng tương tác với hệ thống. Menu cần có các lựa chọn tương ứng với các phương thức của lớp `QuanLyNhanSu`, bao gồm việc cho người dùng chọn thêm mới Sinh Viên hay Giảng Viên.

---

### **BÀI TẬP VỀ NHÀ **

**Dự án: Xây dựng hệ thống quản lý phương tiện giao thông**

**Mục tiêu:** Củng cố và áp dụng các kiến thức OOP vào một bài toán khác để xây dựng một ứng dụng quản lý kho phương tiện hoàn chỉnh có tương tác với người dùng.

#### **Nhiệm vụ 1: Xây dựng các Lớp Đối Tượng**

1.  **Lớp cha `PhuongTien`:**
    * **Thuộc tính (private):** `id` (String), `hangSanXuat` (String), `namSanXuat` (int), `giaBan` (double), `mauXe` (String).
    * **Phương thức:** Constructors, Getters/Setters, và một phương thức `hienThiThongTin()`.

2.  **Lớp con `Oto` kế thừa `PhuongTien`:**
    * **Thuộc tính riêng (private):** `soChoNgoi` (int), `kieuDongCo` (String).
    * **Phương thức:** Ghi đè `hienThiThongTin()` để hiển thị đầy đủ thông tin, bao gồm cả các thuộc tính riêng của ô tô.

3.  **Lớp con `XeMay` kế thừa `PhuongTien`:**
    * **Thuộc tính riêng (private):** `congSuat` (int, đơn vị cc).
    * **Phương thức:** Ghi đè `hienThiThongTin()` để hiển thị đầy đủ thông tin, bao gồm cả công suất.

4.  **Lớp con `XeTai` kế thừa `PhuongTien`:**
    * **Thuộc tính riêng (private):** `trongTai` (double, đơn vị tấn).
    * **Phương thức:** Ghi đè `hienThiThongTin()` để hiển thị đầy đủ thông tin, bao gồm cả trọng tải.

#### **Nhiệm vụ 2: Xây dựng Lớp `QuanLyPhuongTien`**

Lớp này có các chức năng để quản lý một danh sách các `PhuongTien`.

* **Phương thức (public):**
    * `themPhuongTien(PhuongTien pt)`: Thêm một phương tiện mới.
    * `xoaPhuongTien(String id)`: Xóa một phương tiện theo ID.
    * `timKiemTheoHang(String hangSanXuat)`: Tìm kiếm và hiển thị các phương tiện theo hãng sản xuất.
    * `timKiemTheoMau(String mauXe)`: Tìm kiếm và hiển thị các phương tiện theo màu xe.
    * `hienThiToanBoDanhSach()`: Hiển thị thông tin của tất cả phương tiện trong danh sách.

#### **Nhiệm vụ 3: Xây dựng Giao Diện Console trong Lớp `Main`**

Tạo một menu điều khiển bằng console cho phép người dùng thực hiện các chức năng sau:

1.  **Thêm mới phương tiện:** Chương trình cần hỏi người dùng muốn thêm loại nào (Ô tô, Xe máy, hay Xe tải), sau đó yêu cầu nhập các thông tin tương ứng.
2.  **Hiển thị danh sách phương tiện.**
3.  **Xóa phương tiện theo ID.**
4.  **Tìm kiếm phương tiện theo hãng sản xuất.**
5.  **Tìm kiếm phương tiện theo màu xe.**
6.  **Thoát khỏi chương trình.**

Chương trình phải chạy liên tục cho đến khi người dùng chọn chức năng "Thoát".
