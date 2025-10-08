### **BÀI THỰC HÀNH 03: XỬ LÝ NÂNG CAO TRONG JAVA**

**Mục tiêu:** Tái cấu trúc (refactor) và bổ sung các tính năng nâng cao vào dự án Quản lý Sinh viên & Giảng viên đã làm ở Chương 2, bao gồm xử lý ngoại lệ, lưu trữ dữ liệu xuống file và sử dụng các cấu trúc dữ liệu hiệu quả hơn.


#### **Task 1: Tái cấu trúc Lưu trữ Dữ liệu với `Map`**

* **Yêu cầu:** Sửa đổi lớp `QuanLyNhanSu`. Thay vì dùng `List<Nguoi>`, hãy sử dụng `Map<String, Nguoi>` để lưu trữ danh sách.
    * **Key** của Map là mã định danh (`maSV` hoặc `maGV`).
    * **Value** là đối tượng `SinhVien` hoặc `GiangVien` tương ứng.
* **Tác động:**
    * Viết lại phương thức `themNguoi` để kiểm tra xem mã định danh đã tồn tại trong Map hay chưa trước khi thêm. Nếu đã tồn tại, không cho phép thêm.
    * Viết lại phương thức `xoaNguoi` để xóa theo mã định danh (key) thay vì theo tên.
    * Viết lại phương thức `timKiemTheoTen` để duyệt qua các `values()` của Map.
    * Tạo một phương thức mới `timKiemTheoMa(String ma)` để tận dụng sức mạnh tra cứu nhanh của Map.


#### **Task 2: Xây dựng Hệ thống Xử lý Ngoại lệ (Exception Handling)**

* **Yêu cầu:** Làm cho ứng dụng trở nên "bền bỉ" hơn, không bị dừng đột ngột và cung cấp thông báo lỗi thân thiện.
    1.  Tạo một lớp Exception tùy chỉnh có tên `DuplicateIdentifierException` kế thừa từ `Exception`.
    2.  Trong phương thức `themNguoi` của lớp `QuanLyNhanSu`, nếu phát hiện mã định danh đã tồn tại, hãy `throw new DuplicateIdentifierException("Lỗi: Mã định danh đã tồn tại trong hệ thống!");`.
    3.  Trong lớp `Main`, tại chức năng thêm người, hãy đặt lời gọi phương thức `themNguoi` trong một khối `try-catch` để bắt `DuplicateIdentifierException` và in ra thông báo lỗi cho người dùng.
    4.  Cũng trong lớp `Main`, bọc các đoạn code đọc số liệu từ người dùng (`scanner.nextInt()`, `scanner.nextDouble()`) trong khối `try-catch` để xử lý `InputMismatchException` khi người dùng nhập sai định dạng dữ liệu.


#### **Task 3: Lưu và Tải Dữ liệu (Object Serialization)**

* **Yêu cầu:** Thêm chức năng lưu toàn bộ trạng thái của ứng dụng ra file và đọc lại khi cần.
    1.  Cho các lớp `Nguoi`, `SinhVien`, `GiangVien` triển khai (implements) interface `Serializable`.
    2.  Trong lớp `QuanLyNhanSu`, tạo 2 phương thức mới:
        * `luuDuLieuVaoFile(String tenFile)`: Sử dụng `ObjectOutputStream` để ghi đối tượng `Map` hiện tại vào một file nhị phân. Phương thức này cần `throws IOException`.
        * `docDuLieuTuFile(String tenFile)`: Sử dụng `ObjectInputStream` để đọc đối tượng `Map` từ file và gán lại cho danh sách của lớp quản lý. Phương thức này cần xử lý các ngoại lệ như `FileNotFoundException`, `IOException`, `ClassNotFoundException`.
    3.  Trong lớp `Main`, thêm các lựa chọn trong menu để người dùng có thể gọi chức năng "Lưu dữ liệu" và "Tải dữ liệu".


#### **Task 4: Sử dụng Lambda Expression và `Set`**

* **Yêu cầu:** Áp dụng các cú pháp và cấu trúc dữ liệu hiện đại.
    1.  Trong lớp `QuanLyNhanSu`, viết một phương thức `hienThiDanhSachKhoa()` để in ra danh sách các khoa của giảng viên mà không bị trùng lặp. (Sử dụng `Set<String>` để lưu trữ).
    2.  Viết lại phương thức `hienThiToanBoDanhSach` bằng cách sử dụng phương thức `forEach` của `Map` kết hợp với biểu thức Lambda.
    3.  Thêm chức năng "Sắp xếp danh sách sinh viên theo điểm trung bình". Sử dụng biểu thức Lambda để định nghĩa `Comparator` và sắp xếp.

---

### **BÀI TẬP VỀ NHÀ**

**Mục tiêu:** Xây dựng một ứng dụng console hoàn chỉnh từ đầu, áp dụng các kiến thức về Collections, Exception Handling và Đọc/Ghi file văn bản.


#### **Task 1: Thiết kế Lớp `TuDien`**

* **Yêu cầu:** Tạo lớp `TuDien` để chứa và quản lý dữ liệu từ điển.
* **Cấu trúc dữ liệu:**
    * Sử dụng một `TreeMap<String, String>` để lưu trữ các cặp từ vựng. Key là từ tiếng Anh, Value là nghĩa tiếng Việt. Việc dùng `TreeMap` sẽ giúp từ điển luôn được tự động sắp xếp theo thứ tự ABC.
* **Phương thức:**
    * `themMoiTu(String tuKhoa, String yNghia)`: Thêm một cặp từ mới.
    * `xoaTu(String tuKhoa)`: Xóa một từ dựa vào từ khóa.
    * `traTu(String tuKhoa)`: Trả về ý nghĩa của từ khóa.
    * `inTatCaTuVung()`: In ra toàn bộ danh sách từ vựng.
    * `laySoLuongTu()`: Trả về số lượng từ vựng hiện có.

#### **Task 2: Tích hợp Đọc/Ghi File Text**

* **Yêu cầu:** Cho phép từ điển được nạp từ một file `dictionary.txt` khi khởi động và lưu lại khi thoát.
* **Định dạng file `dictionary.txt`:** Mỗi dòng chứa một cặp từ theo định dạng: `từ khóa:ý nghĩa`.
    * Ví dụ: `hello:xin chào`
* **Phương thức trong lớp `TuDien`:**
    * `napDuLieuTuFile(String tenFile)`: Đọc file `dictionary.txt`, phân tách từng dòng để đưa dữ liệu vào `TreeMap`. Cần xử lý `FileNotFoundException`.
    * `luuDuLieuRaFile(String tenFile)`: Ghi toàn bộ dữ liệu từ `TreeMap` vào file `dictionary.txt` theo đúng định dạng.


#### **Task 3: Xây dựng Giao diện Console trong `Main`**

* **Yêu cầu:** Tạo một lớp `Main` với menu chức năng cho phép người dùng:
    1.  Thêm một từ mới (kiểm tra từ khóa đã tồn tại chưa).
    2.  Tra từ (cho phép tìm kiếm gần đúng, ví dụ người dùng gõ "he" thì gợi ý "hello").
    3.  Xóa một từ.
    4.  In ra toàn bộ từ điển.
    5.  Thoát (khi thoát phải tự động gọi phương thức lưu dữ liệu ra file).
* **Yêu cầu khác:**
    * Áp dụng `try-catch` để xử lý các lỗi nhập liệu.
    * Chương trình phải tự động nạp dữ liệu từ file khi khởi động.
