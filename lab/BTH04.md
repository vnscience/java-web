### **BÀI TẬP THỰC HÀNH 04**

**Dự án: Xây dựng Giao diện Trang Quản lý Sinh viên** 👨‍🎓

**Mục tiêu:**
* Sử dụng thành thạo các thẻ HTML để dựng khung sườn cho một trang ứng dụng web.
* Áp dụng CSS từ file bên ngoài để định dạng và làm đẹp giao diện.
* Viết mã JavaScript cơ bản để thêm tính tương tác và kiểm tra dữ liệu form.

#### **Nhiệm vụ 1: Dựng Khung Sườn Bằng HTML**

Tạo một file tên `quanlysinhvien.html` và xây dựng cấu trúc cơ bản cho trang web, bao gồm 3 khu vực chính:

1.  **Tiêu đề trang:**
    * Sử dụng thẻ `<h1>` với nội dung "Hệ thống Quản lý Sinh viên".

2.  **Khu vực Form Thêm mới Sinh viên:**
    * Sử dụng thẻ `<form>` để bao bọc.
    * Tạo các trường nhập liệu (`<input>`) cho: **Mã SV**, **Họ tên**, và **Điểm trung bình**.
    * Sử dụng thẻ `<label>` để tạo nhãn tương ứng cho mỗi trường.
    * Thêm một nút bấm (`<button>`) với nội dung "Thêm mới".

3.  **Khu vực Bảng Danh sách Sinh viên:**
    * Sử dụng thẻ `<table>` để tạo bảng.
    * Tạo phần tiêu đề của bảng (`<thead>`) với các cột: **Mã SV**, **Họ tên**, **Điểm TB**, và **Hành động**.
    * Tạo phần thân bảng (`<tbody>`) và thêm vào 2-3 hàng (`<tr>`) dữ liệu sinh viên mẫu để giao diện có nội dung ban đầu. Cột "Hành động" có thể chứa các nút "Sửa", "Xóa".


#### **Nhiệm vụ 2: "Mặc áo" Cho Giao Diện Bằng CSS**

Tạo một file tên `styles.css` và liên kết nó với file `quanlysinhvien.html`. Viết mã CSS để làm đẹp giao diện:

1.  **Toàn trang (`body`):**
    * Thiết lập `font-family` chung (ví dụ: `Arial, sans-serif`).
    * Đặt `background-color` màu xám nhạt (`#f4f4f4`).

2.  **Vùng chứa chính:**
    * Tạo một thẻ `<div>` trong HTML để bao bọc toàn bộ nội dung và đặt `class="container"`.
    * Trong CSS, định dạng cho `.container`: đặt `width` khoảng 800px, `margin: auto;` để căn giữa trang, thêm `padding` và `background-color: white;`.

3.  **Định dạng Form:**
    * Làm cho các `<input>` có `width: 100%`, thêm `padding` và `margin-bottom` để tạo khoảng cách.
    * Định dạng cho `<button>` có màu nền, màu chữ, và thay đổi giao diện khi di chuột vào (`:hover`).

4.  **Định dạng Bảng:**
    * Thiết lập `width: 100%` cho `<table>`.
    * Thêm `border` cho bảng và các ô.
    * Định dạng cho `<th>` (tiêu đề bảng) có màu nền và chữ đậm.
    * Sử dụng `nth-child(even)` để tạo hiệu ứng các hàng chẵn có màu nền khác nhau, giúp dễ đọc hơn.


#### **Nhiệm vụ 3: Thêm "Sự sống" Bằng JavaScript**

Tạo một file tên `app.js` và liên kết nó với file `quanlysinhvien.html` (đặt thẻ `<script>` trước khi đóng thẻ `</body>`).

1.  **Kiểm tra dữ liệu Form (Validation):**
    * Viết một hàm tên là `validateForm()`.
    * Trong hàm này, lấy giá trị từ các ô input (Mã SV, Họ tên).
    * Dùng câu lệnh `if` để kiểm tra xem các giá trị đó có bị bỏ trống hay không.
    * Nếu trống, sử dụng `alert()` để hiển thị thông báo lỗi (ví dụ: "Vui lòng nhập đầy đủ thông tin!").
    * Gán sự kiện `onclick` của nút "Thêm mới" trong HTML để gọi hàm `validateForm()`.

2.  **Tương tác với DOM:**
    * Thêm một nút bấm khác vào file HTML với nội dung "Thay đổi Tiêu đề".
    * Viết một hàm JS tên là `changeTitle()`.
    * Trong hàm, dùng `document.getElementById()` để lấy thẻ `<h1>` (bạn cần đặt `id` cho nó trước).
    * Thay đổi nội dung của tiêu đề bằng thuộc tính `.innerHTML` (ví dụ: "Chào mừng đến với Bảng điều khiển").
    * Thay đổi màu sắc của tiêu đề bằng thuộc tính `.style.color`.
    * Gán sự kiện `onclick` của nút mới để gọi hàm `changeTitle()`.

<img width="849" height="887" alt="image" src="https://github.com/user-attachments/assets/5b01863f-4adf-4f51-80f9-6c61bf6fbb62" />


---

### **BÀI TẬP VỀ NHÀ**

**Dự án: Xây dựng Trang Portfolio Cá nhân** 💼

**Mục tiêu:** Tự mình áp dụng tổng hợp các kiến thức HTML, CSS, và JS để xây dựng một trang web tĩnh hoàn chỉnh, thể hiện thông tin cá nhân.

#### **Yêu cầu về HTML:**

Trang web cần có các phần sau:
* **Header:** Chứa tên của bạn trong thẻ `<h1>`.
* **Ảnh đại diện:** Sử dụng thẻ `<img>`.
* **Phần Giới thiệu:** Một tiêu đề `<h2>` và một vài đoạn văn `<p>` mô tả về bản thân.
* **Phần Kỹ năng:** Một tiêu đề `<h2>` và một danh sách không có thứ tự (`<ul>`, `<li>`) liệt kê các kỹ năng của bạn (ví dụ: Java, HTML, English...).
* **Phần Liên hệ:** Một tiêu đề `<h2>` và một form đơn giản cho phép người khác gửi tin nhắn, bao gồm các trường: Họ tên, Email, Nội dung tin nhắn và nút "Gửi".

#### **Yêu cầu về CSS:**

* **Bắt buộc** sử dụng file CSS bên ngoài.
* Trang trí cho trang web có một tông màu chủ đạo.
* Sử dụng Box Model (`padding`, `margin`, `border`) để tạo các khối nội dung rõ ràng, sạch sẽ.
* Căn giữa các nội dung chính của trang.

#### **Yêu cầu về JavaScript:**

* **Bắt buộc** sử dụng file JS bên ngoài.
* Thêm một nút bấm "Hiển thị/Ẩn thông tin liên hệ".
* Viết một hàm JS, khi người dùng bấm vào nút này, sẽ kiểm tra xem form liên hệ đang hiển thị hay đang ẩn. Nếu đang hiển thị thì ẩn đi, và ngược lại (`element.style.display = 'none'` hoặc `'block'`).

Chúc các bạn có một buổi thực hành hiệu quả và làm bài tập về nhà thật tốt!
