🔥 **Thử thách 60 phút: Khởi động cùng Java\!**

**Nội dung:**
Chào cả lớp,

Chúng ta sẽ có một bài tập nhỏ trong 60 phút để làm quen với Java và môi trường lập trình IntelliJ IDEA.

**Luật chơi:**

  * **Thời gian:** 60 phút, tính từ bây giờ.
  * **Phần thưởng:** 5 bạn nộp bài đúng và nhanh nhất sẽ được một điểm cộng vào điểm quá trình.
  * **Cách nộp bài:** Nén 5 file `.java` của 5 bài tập thành một file `.zip` duy nhất có tên là `MSSV_HoTen.zip` và nộp vào bài tập này.

-----

### **Yêu cầu chống lạm dụng AI (Quan trọng\!)**

Để đảm bảo các bạn thực sự hiểu bài, mỗi bài nộp cần tuân thủ:

1.  **Thêm "Header Comment":** Mỗi file `.java` phải bắt đầu bằng một comment ghi rõ thông tin của bạn.
    ```java
    // Họ và tên: Nguyễn Văn A
    // MSSV: 25001234
    // Bài tập 1: Lời chào cá nhân hóa
    ```
2.  **Giải thích bằng Comment:** Với các bài tập **Tư duy (4 và 5)**, bạn **bắt buộc** phải thêm comment giải thích cho dòng code then chốt.
3.  **Sẵn sàng giải thích:** Nếu nằm trong top 5, giảng viên có thể hỏi nhanh về cách bạn giải quyết một bài bất kỳ. Hãy đảm bảo bạn hiểu rõ code mình đã viết\!

-----

### **Đề bài: 5 Bài tập làm quen**

#### **Bài 1: Lời Chào Cá Nhân Hóa (Làm quen `String` và `Scanner`)**

  * **Yêu cầu:** Viết chương trình yêu cầu người dùng nhập vào **Họ và tên** và **MSSV**, sau đó in ra một lời chào chứa cả hai thông tin đó.
  * **Mục tiêu:** Quen với việc nhập/xuất dữ liệu kiểu chuỗi (`String`).
  * **Ví dụ Output:**
    ```text
    Nhập họ và tên của bạn: Nguyễn Văn A
    Nhập MSSV của bạn: 25001234
    Chào mừng sinh viên Nguyễn Văn A - MSSV: 25001234 đến với Java!
    ```

-----

#### **Bài 2: Máy Tính Tiền Tip (Làm quen toán tử số học)**

  * **Yêu cầu:** Viết chương trình tính tiền tip cho một bữa ăn. Người dùng sẽ nhập vào **tổng số tiền hóa đơn** và **tỷ lệ % tip** mong muốn (ví dụ: 15 cho 15%). Chương trình sẽ tính và in ra số tiền tip và tổng số tiền phải trả.
  * **Mục tiêu:** Luyện tập tính toán với số thực (`double`) và định dạng output.
  * **Ví dụ Output:**
    ```text
    Nhập tổng tiền hóa đơn: 500000
    Bạn muốn tip bao nhiêu %? 15
    Số tiền tip: 75000.0
    Tổng tiền cần thanh toán: 575000.0
    ```

-----

#### **Bài 3: Tìm và Sửa Lỗi (Làm quen Debug)**

  * **Yêu cầu:** Chép lại đoạn code dưới đây vào IntelliJ. Nó đang bị sai logic và cho ra kết quả không đúng. Hãy tìm lỗi, sửa lại cho đúng và **thêm comment giải thích** tại sao code cũ lại sai.
    ```java
    // Code gốc bị lỗi
    int a = 10;
    int b = 4;
    double ketQua = a / b;
    System.out.println("Kết quả của a / b là: " + ketQua); // Kết quả mong đợi là 2.5 nhưng lại ra 2.0
    ```
  * **Mục tiêu:** Tập quan sát, phân tích lỗi logic cơ bản và làm quen với việc ép kiểu dữ liệu.
  * **Gợi ý:** Phép chia hai số nguyên sẽ cho ra kết quả là gì?

-----

#### **Bài 4: Tách Số và Tính Tổng (Bài tập tư duy 🧠)**

  * **Yêu cầu:** Viết chương trình cho phép người dùng nhập vào một **số nguyên có 3 chữ số** (ví dụ: 123, 456, 987). Chương trình phải tách số này thành từng chữ số riêng lẻ và tính tổng của chúng.
  * **Mục tiêu:** Rèn luyện tư duy logic, vận dụng sáng tạo các toán tử số học (`/` và `%`) để giải quyết bài toán.
  * **Yêu cầu đặc biệt:** Thêm comment giải thích logic bạn đã sử dụng để tách được từng chữ số. **Không được** chuyển số thành chuỗi (`String`) để xử lý.
  * **Gợi ý:**
      * Làm thế nào để lấy được chữ số hàng đơn vị của một số? (Ví dụ: 987 -\> 7)
      * Sau khi lấy được hàng đơn vị, làm thế nào để "loại bỏ" nó khỏi số ban đầu? (Ví dụ: 987 -\> 98)
  * **Ví dụ Output:**
    ```text
    Nhập một số nguyên có 3 chữ số: 987
    Chữ số hàng trăm: 9
    Chữ số hàng chục: 8
    Chữ số hàng đơn vị: 7
    Tổng các chữ số là: 24
    ```

-----

#### **Bài 5: Tam Giác Hợp Lệ? (Bài tập tư duy 🧠)**

  * **Yêu cầu:** Viết chương trình cho người dùng nhập vào độ dài 3 cạnh `a`, `b`, `c` của một tam giác. Chương trình sẽ kiểm tra xem 3 cạnh này có thể tạo thành một tam giác hợp lệ hay không.
  * **Mục tiêu:** Rèn luyện khả năng phân tích điều kiện và sử dụng toán tử logic (`&&`).
  * **Yêu cầu đặc biệt:** Thêm comment giải thích điều kiện để 3 cạnh tạo thành một tam giác.
  * **Gợi ý:** Theo **bất đẳng thức tam giác**, tổng độ dài hai cạnh bất kỳ phải **lớn hơn** độ dài cạnh còn lại. Bạn cần kiểm tra đồng thời cả 3 trường hợp.
  * **Ví dụ Output 1:**
    ```text
    Nhập độ dài cạnh a: 3
    Nhập độ dài cạnh b: 4
    Nhập độ dài cạnh c: 5
    Ba cạnh 3.0, 4.0, 5.0 có thể tạo thành một tam giác.
    ```
  * **Ví dụ Output 2:**
    ```text
    Nhập độ dài cạnh a: 1
    Nhập độ dài cạnh b: 2
    Nhập độ dài cạnh c: 4
    Ba cạnh 1.0, 2.0, 4.0 KHÔNG thể tạo thành một tam giác.
    ```
