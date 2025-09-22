### **BÀI TẬP THỰC HÀNH BUỔI 1: LÀM QUEN VỚI JAVA**

#### **Bài 1: Máy tính đơn giản**

  * **Mục tiêu:** Luyện tập sử dụng biến, toán tử số học và lớp `Scanner` để nhập liệu.
  * **Đề bài:** Viết một chương trình cho phép người dùng nhập vào hai số nguyên `a` và `b`. Sau đó, in ra màn hình kết quả của các phép toán: tổng, hiệu, tích, thương, và chia lấy dư của hai số đó.
  * **Gợi ý thực hiện:**
    1.  Import lớp `java.util.Scanner`.
    2.  Tạo một đối tượng `Scanner` để đọc dữ liệu từ bàn phím.
    3.  Yêu cầu người dùng nhập số thứ nhất và lưu vào biến `int a`.
    4.  Yêu cầu người dùng nhập số thứ hai và lưu vào biến `int b`.
    5.  Tính toán và in kết quả từng phép toán ra màn hình kèm theo chú thích rõ ràng.
    6.  Lưu ý xử lý phép chia cho 0 để tránh lỗi (dùng `if`).
  * **Kết quả mong đợi (Ví dụ):**
    ```text
    Nhập vào số nguyên a: 10
    Nhập vào số nguyên b: 3
    --- KẾT QUẢ ---
    Tổng: 10 + 3 = 13
    Hiệu: 10 - 3 = 7
    Tích: 10 * 3 = 30
    Thương: 10 / 3 = 3
    Chia lấy dư: 10 % 3 = 1
    ```

-----

#### **Bài 2: Xếp loại học lực**

  * **Mục tiêu:** Vận dụng thành thạo cấu trúc điều kiện `if-else if-else`.
  * **Đề bài:** Viết chương trình cho phép người dùng nhập vào điểm trung bình (GPA) của một sinh viên (kiểu số thực). Dựa vào điểm số, chương trình sẽ xếp loại học lực theo quy tắc sau:
      * GPA \>= 8.5: Giỏi
      * 8.5 \> GPA \>= 6.5: Khá
      * 6.5 \> GPA \>= 5.0: Trung bình
      * GPA \< 5.0: Yếu
  * **Gợi ý thực hiện:**
    1.  Sử dụng `Scanner` để đọc một số `double` từ người dùng.
    2.  Dùng một chuỗi các câu lệnh `if-else if-else` để kiểm tra điểm và in ra xếp loại tương ứng.
    3.  Đảm bảo kiểm tra các điều kiện từ cao xuống thấp (hoặc ngược lại) để logic được chính xác.
  * **Kết quả mong đợi (Ví dụ):**
    ```text
    Nhập điểm trung bình của bạn: 7.8
    Xếp loại học lực: Khá
    ```

-----

#### **Bài 3: Bảng cửu chương**

  * **Mục tiêu:** Nắm vững cách sử dụng vòng lặp `for`.
  * **Đề bài:** Viết chương trình in ra màn hình bảng cửu chương của một số nguyên `n` (từ 1 đến 10), với `n` được nhập từ bàn phím.
  * **Gợi ý thực hiện:**
    1.  Yêu cầu người dùng nhập vào một số nguyên `n`.
    2.  Sử dụng vòng lặp `for` cho biến `i` chạy từ 1 đến 10.
    3.  Bên trong vòng lặp, in ra kết quả của `n * i` theo định dạng "n x i = ket\_qua".
  * **Kết quả mong đợi (Ví dụ):**
    ```text
    Nhập vào bảng cửu chương bạn muốn xem: 8
    --- BẢNG CỬU CHƯƠNG 8 ---
    8 x 1 = 8
    8 x 2 = 16
    8 x 3 = 24
    8 x 4 = 32
    8 x 5 = 40
    8 x 6 = 48
    8 x 7 = 56
    8 x 8 = 64
    8 x 9 = 72
    8 x 10 = 80
    ```
    
-----

#### **Bài 4: Lọc số chẵn**

  * **Mục tiêu:** Luyện tập sử dụng vòng lặp `for` kết hợp với lệnh `continue` để điều khiển luồng.
  * **Đề bài:** Viết chương trình yêu cầu người dùng nhập vào một số nguyên dương `n`. Sau đó, in ra tất cả các số lẻ từ 1 đến `n`. **Yêu cầu:** Sử dụng vòng lặp `for` và câu lệnh `if` với `continue` để bỏ qua các số chẵn.
  * **Gợi ý thực hiện:**
    1.  Dùng `Scanner` để nhập số `n`.
    2.  Tạo một vòng lặp `for` cho biến `i` chạy từ 1 đến `n`.
    3.  Bên trong vòng lặp, dùng lệnh `if (i % 2 == 0)` để kiểm tra xem `i` có phải là số chẵn không.
    4.  Nếu `i` là số chẵn, gọi lệnh `continue` để bỏ qua các lệnh còn lại trong lần lặp đó và chuyển sang lần lặp tiếp theo.
    5.  Nếu `i` không phải số chẵn, in giá trị của `i` ra màn hình.
  * **Kết quả mong đợi (Ví dụ):**
    ```text
    Nhập vào một số nguyên dương n: 10
    Các số lẻ từ 1 đến 10 là:
    1 3 5 7 9
    ```

-----

#### **Bài 5: Thao tác trên mảng một chiều**

  * **Mục tiêu:** Nắm vững cách khai báo, khởi tạo, nhập/xuất và xử lý dữ liệu trong mảng một chiều.
  * **Đề bài:** Viết chương trình cho phép người dùng nhập vào 5 phần tử là số nguyên cho một mảng. Sau đó, chương trình sẽ tìm và in ra:
      * Giá trị lớn nhất trong mảng.
      * Giá trị nhỏ nhất trong mảng.
      * Tổng của tất cả các phần tử trong mảng.
  * **Gợi ý thực hiện:**
    1.  Khai báo một mảng số nguyên với kích thước là 5: `int[] numbers = new int[5];`.
    2.  Dùng vòng lặp `for` để yêu cầu người dùng nhập giá trị cho từng phần tử của mảng.
    3.  Khởi tạo biến `max` và `min` bằng giá trị của phần tử đầu tiên (`numbers[0]`).
    4.  Khởi tạo biến `sum = 0`.
    5.  Dùng một vòng lặp `for` khác để duyệt qua mảng từ phần tử thứ hai (`i = 1`):
          * So sánh `numbers[i]` với `max` và `min` để cập nhật nếu cần.
          * Cộng `numbers[i]` vào `sum`.
    6.  Đừng quên cộng cả phần tử đầu tiên vào `sum`.
  * **Kết quả mong đợi (Ví dụ):**
    ```text
    Nhập phần tử thứ 1: 15
    Nhập phần tử thứ 2: -2
    Nhập phần tử thứ 3: 100
    Nhập phần tử thứ 4: 0
    Nhập phần tử thứ 5: 33
    --- KẾT QUẢ ---
    Giá trị lớn nhất: 100
    Giá trị nhỏ nhất: -2
    Tổng các phần tử: 146
    ```

-----

#### **Bài 6: Xây dựng và sử dụng hàm (Phương thức)**

  * **Mục tiêu:** Hiểu rõ khái niệm hàm, cách định nghĩa và gọi hàm để tái sử dụng code.

  * **Đề bài:** Viết chương trình có các hàm (phương thức) sau:

    1.  Hàm `isPrime(int n)`: Nhận vào một số nguyên `n` và trả về `true` nếu `n` là số nguyên tố, ngược lại trả về `false`.
    2.  Hàm `calculateFactorial(int n)`: Nhận vào một số nguyên `n` và trả về giai thừa của `n`.
        Trong hàm `main`, yêu cầu người dùng nhập một số nguyên và sau đó gọi hai hàm trên để kiểm tra và in kết quả ra màn hình.

  * **Gợi ý thực hiện:**

      * **Đối với hàm `isPrime`**:
          * Số nguyên tố là số lớn hơn 1 và chỉ chia hết cho 1 và chính nó.
          * Nếu `n <= 1` thì không phải là số nguyên tố.
          * Dùng vòng lặp `for` chạy từ 2 đến căn bậc hai của `n`. Nếu `n` chia hết cho bất kỳ số nào trong khoảng này, nó không phải là số nguyên tố.
      * **Đối với hàm `calculateFactorial`**:
          * Dùng vòng lặp `for` để tính tích từ 1 đến `n`.
      * **Trong hàm `main`**:
          * Gọi hàm và nhận kết quả trả về để in ra. Ví dụ: `boolean check = isPrime(number);`.

  * **Kết quả mong đợi (Ví dụ):**

    ```text
    Nhập vào một số nguyên: 7
    Số 7 có phải là số nguyên tố không? true
    Giai thừa của 7 là: 5040
    ```

-----

#### **Bài 7 (Nâng cao): Làm việc với mảng hai chiều (Ma trận)**

  * **Mục tiêu:** Làm quen với cách khai báo và xử lý mảng hai chiều. Luyện tập sử dụng vòng lặp lồng nhau.
  * **Đề bài:** Viết chương trình cho phép người dùng nhập vào số dòng và số cột của một ma trận số nguyên. Sau đó:
    1.  Cho phép người dùng nhập các giá trị cho từng phần tử của ma trận.
    2.  In ma trận đó ra màn hình theo đúng định dạng dòng, cột.
    3.  Tìm và in ra phần tử lớn nhất trong ma trận cùng với vị trí (chỉ số dòng, cột) của nó.
  * **Gợi ý thực hiện:**
    1.  Dùng `Scanner` để nhập số dòng (`rows`) và số cột (`cols`).
    2.  Khai báo mảng hai chiều: `int[][] matrix = new int[rows][cols];`.
    3.  Dùng hai vòng lặp `for` lồng nhau để duyệt qua từng phần tử và cho phép người dùng nhập giá trị.
    4.  Dùng hai vòng lặp `for` lồng nhau khác để in ma trận ra màn hình.
    5.  Để tìm giá trị lớn nhất, khởi tạo `max = matrix[0][0]` và các biến lưu vị trí. Dùng hai vòng lặp lồng nhau để duyệt qua ma trận và cập nhật `max` nếu tìm thấy phần tử lớn hơn.
  * **Kết quả mong đợi (Ví dụ):**
    ```text
    Nhập số dòng của ma trận: 2
    Nhập số cột của ma trận: 3
    Nhập phần tử [0][0]: 5
    Nhập phần tử [0][1]: 12
    Nhập phần tử [0][2]: -1
    Nhập phần tử [1][0]: 7
    Nhập phần tử [1][1]: 100
    Nhập phần tử [1][2]: 9
    --- Ma trận bạn đã nhập ---
    5    12   -1
    7    100  9
    ---
    Phần tử lớn nhất trong ma trận là 100 tại vị trí [1][1]
    ```
-----

### **BÀI TẬP VỀ NHÀ**

#### **Bài 1 (Bắt buộc): Tính chỉ số BMI và đưa ra lời khuyên**

  * **Mục tiêu:** Kết hợp toán tử, `Scanner`, và cấu trúc `if-else if-else` vào một bài toán thực tế.
  * **Đề bài:** Viết chương trình cho phép người dùng nhập cân nặng (kg) và chiều cao (m). Chương trình sẽ tính chỉ số khối cơ thể (BMI) theo công thức: **$BMI = \\frac{cân nặng}{chiều cao^2}$**.
    Sau đó, dựa vào chỉ số BMI để đưa ra thông báo:
      * BMI \< 18.5: "Thiếu cân"
      * 18.5 \<= BMI \< 25.0: "Bình thường"
      * 25.0 \<= BMI \< 30.0: "Thừa cân"
      * BMI \>= 30.0: "Béo phì"
  * **Lưu ý:** Cân nặng và chiều cao là số thực (`double`).

-----

#### **Bài 2 (Bắt buộc): Mô phỏng đăng nhập**

  * **Mục tiêu:** Luyện tập vòng lặp `while`, so sánh chuỗi (`String`), và toán tử logic.
  * **Đề bài:** Viết chương trình yêu cầu người dùng nhập tên đăng nhập và mật khẩu.
      * Tên đăng nhập và mật khẩu đúng được "hard-code" (gán cứng) trong code (ví dụ: `admin` và `123456`).
      * Chương trình sẽ lặp đi lặp lại việc yêu cầu nhập cho đến khi người dùng nhập đúng cả tên đăng nhập VÀ mật khẩu.
      * Khi nhập đúng, in ra thông báo "Đăng nhập thành công\!" và kết thúc chương trình.
  * **Gợi ý:** Để so sánh hai chuỗi `String` trong Java, hãy dùng phương thức `.equals()`. Ví dụ: `username.equals("admin")`.

-----

#### **Bài 3 (Nâng cao): Xây dựng Menu chức năng**

  * **Mục tiêu:** Thử thách với vòng lặp `do-while` và cấu trúc `switch-case`.
  * **Đề bài:** Viết một chương trình hiển thị menu các chức năng như sau:
    1.  Giải phương trình bậc nhất ($ax + b = 0$)
    2.  Giải phương trình bậc hai ($ax^2 + bx + c = 0$)
    3.  Thoát
        Chương trình sẽ cho phép người dùng chọn một chức năng. Sau khi thực hiện xong chức năng, menu sẽ được hiển thị lại. Vòng lặp chỉ kết thúc khi người dùng chọn "3. Thoát".
  * **Gợi ý:**
      * Dùng vòng lặp `do-while` để đảm bảo menu được hiển thị ít nhất một lần.
      * Bên trong vòng lặp, dùng `switch-case` để xử lý lựa chọn của người dùng.

Chúc các bạn hoàn thành tốt bài thực hành\!
