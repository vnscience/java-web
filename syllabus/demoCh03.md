
### **1. Ví dụ về `List` Interface (`ArrayList` và `LinkedList`)**

**Mục tiêu:** Minh họa cách khai báo, sử dụng `ArrayList`, `LinkedList` và thấy rõ đặc điểm "có thứ tự, cho phép trùng lặp".

```java
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ListDemo {
    public static void main(String[] args) {
        // 1. Sử dụng ArrayList: Tốt cho việc truy cập ngẫu nhiên
        System.out.println("--- Ví dụ với ArrayList ---");
        List<String> arrayList = new ArrayList<>();
        arrayList.add("Táo");
        arrayList.add("Cam");
        arrayList.add("Xoài");
        arrayList.add("Táo"); // Thêm phần tử trùng lặp

        System.out.println("Danh sách ban đầu: " + arrayList);
        System.out.println("Phần tử tại vị trí 1: " + arrayList.get(1)); // Truy cập nhanh

        // 2. Sử dụng LinkedList: Tốt cho việc thêm/xóa nhiều
        System.out.println("\n--- Ví dụ với LinkedList ---");
        List<String> linkedList = new LinkedList<>();
        linkedList.add("Java");
        linkedList.add("Python");
        linkedList.add("C++");

        System.out.println("Danh sách LinkedList: " + linkedList);
        // Thêm vào đầu danh sách rất hiệu quả
        ((LinkedList<String>) linkedList).addFirst("JavaScript");
        System.out.println("Danh sách sau khi thêm vào đầu: " + linkedList);
    }
}
```

**Kết quả mong đợi:**

```text
--- Ví dụ với ArrayList ---
Danh sách ban đầu: [Táo, Cam, Xoài, Táo]
Phần tử tại vị trí 1: Cam

--- Ví dụ với LinkedList ---
Danh sách LinkedList: [Java, Python, C++]
Danh sách sau khi thêm vào đầu: [JavaScript, Java, Python, C++]
```

-----

### **2. Ví dụ về `Iterator` để Xóa Phần Tử An Toàn**

**Mục tiêu:** Minh họa tại sao phải dùng `Iterator` để xóa phần tử khi đang duyệt và lỗi `ConcurrentModificationException` nếu xóa sai cách.

```java
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class IteratorDemo {
    public static void main(String[] args) {
        List<String> fruits = new ArrayList<>();
        fruits.add("Apple");
        fruits.add("Banana");
        fruits.add("Strawberry"); // Phần tử cần xóa
        fruits.add("Mango");

        System.out.println("Danh sách ban đầu: " + fruits);

        // Xóa phần tử "Strawberry" một cách an toàn bằng Iterator
        Iterator<String> iterator = fruits.iterator();
        while (iterator.hasNext()) {
            String fruit = iterator.next();
            if (fruit.equals("Strawberry")) {
                iterator.remove(); // Cách xóa đúng và an toàn
            }
        }
        
        System.out.println("Danh sách sau khi xóa: " + fruits);

        /*
        // CÁCH LÀM SAI - SẼ GÂY LỖI ConcurrentModificationException
        for (String fruit : fruits) {
            if (fruit.equals("Banana")) {
                fruits.remove(fruit); // Dòng này sẽ gây lỗi!
            }
        }
        */
    }
}
```

**Kết quả mong đợi:**

```text
Danh sách ban đầu: [Apple, Banana, Strawberry, Mango]
Danh sách sau khi xóa: [Apple, Banana, Mango]
```

-----

### **3. Ví dụ về `Set` Interface (`HashSet` và `TreeSet`)**

**Mục tiêu:** Cho thấy đặc điểm "không trùng lặp" của `Set` và khả năng "tự sắp xếp" của `TreeSet`.

```java
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class SetDemo {
    public static void main(String[] args) {
        // 1. HashSet: Không đảm bảo thứ tự, không trùng lặp
        System.out.println("--- Ví dụ với HashSet ---");
        Set<String> hashSet = new HashSet<>();
        hashSet.add("Chó");
        hashSet.add("Mèo");
        hashSet.add("Gà");
        hashSet.add("Mèo"); // Thêm phần tử trùng lặp -> sẽ bị bỏ qua

        System.out.println("Các phần tử trong HashSet: " + hashSet);

        // 2. TreeSet: Tự động sắp xếp, không trùng lặp
        System.out.println("\n--- Ví dụ với TreeSet ---");
        Set<String> treeSet = new TreeSet<>();
        treeSet.add("Java");
        treeSet.add("Python");
        treeSet.add("C++");
        treeSet.add("Assembly");

        System.out.println("Các phần tử trong TreeSet (đã sắp xếp): " + treeSet);
    }
}
```

**Kết quả mong đợi:**

```text
--- Ví dụ với HashSet ---
Các phần tử trong HashSet: [Gà, Chó, Mèo]
--- Ví dụ với TreeSet ---
Các phần tử trong TreeSet (đã sắp xếp): [Assembly, C++, Java, Python]
```

-----

### **4. Ví dụ về `Map` Interface (`HashMap`)**

**Mục tiêu:** Minh họa cách lưu trữ và truy xuất dữ liệu theo cặp `key-value`.

```java
import java.util.HashMap;
import java.util.Map;

public class MapDemo {
    public static void main(String[] args) {
        // Map<Key, Value>
        Map<String, String> danhBa = new HashMap<>();

        // 1. Thêm các cặp key-value vào Map
        danhBa.put("0987654321", "Nguyễn Văn A");
        danhBa.put("0123456789", "Trần Thị B");
        danhBa.put("0912345678", "Lê Văn C");

        System.out.println("Toàn bộ danh bạ: " + danhBa);

        // 2. Lấy giá trị theo key
        String ten = danhBa.get("0123456789");
        System.out.println("Chủ nhân của SĐT 0123456789 là: " + ten);

        // 3. Duyệt qua Map
        System.out.println("\n--- Duyệt danh bạ ---");
        for (Map.Entry<String, String> entry : danhBa.entrySet()) {
            System.out.println("SĐT: " + entry.getKey() + " - Tên: " + entry.getValue());
        }
    }
}
```

**Kết quả mong đợi:**

```text
Toàn bộ danh bạ: {0912345678=Lê Văn C, 0123456789=Trần Thị B, 0987654321=Nguyễn Văn A}
Chủ nhân của SĐT 0123456789 là: Trần Thị B

--- Duyệt danh bạ ---
SĐT: 0912345678 - Tên: Lê Văn C
SĐT: 0123456789 - Tên: Trần Thị B
SĐT: 0987654321 - Tên: Nguyễn Văn A
```

-----

### **5. Ví dụ về Biểu Thức Lambda**

**Mục tiêu:** Giới thiệu cú pháp ngắn gọn của Lambda khi duyệt và sắp xếp Collection.

```java
import java.util.ArrayList;
import java.util.List;

public class LambdaDemo {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        names.add("An");
        names.add("Bình");
        names.add("Cường");
        names.add("Dũng");

        // 1. Dùng Lambda để duyệt danh sách (thay cho for-each)
        System.out.println("--- In danh sách bằng Lambda ---");
        names.forEach(name -> System.out.println(name));

        // 2. Dùng Lambda để sắp xếp danh sách theo thứ tự ngược lại
        System.out.println("\n--- Sắp xếp ngược lại bằng Lambda ---");
        names.sort((name1, name2) -> name2.compareTo(name1));
        
        System.out.println("Danh sách sau khi sắp xếp: " + names);
    }
}
```

**Kết quả mong đợi:**

```text
--- In danh sách bằng Lambda ---
An
Bình
Cường
Dũng

--- Sắp xếp ngược lại bằng Lambda ---
Danh sách sau khi sắp xếp: [Dũng, Cường, Bình, An]
```

-----

### **6. Ví dụ về Xử Lý Ngoại Lệ (`try-catch-finally`)**

**Mục tiêu:** Minh họa cách bắt lỗi `InputMismatchException` để chương trình không bị crash khi người dùng nhập sai.

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class ExceptionDemo {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        try {
            System.out.print("Vui lòng nhập một số nguyên: ");
            int number = scanner.nextInt();
            System.out.println("Số bạn vừa nhập là: " + number);
        } catch (InputMismatchException e) {
            // Khối này sẽ chạy nếu người dùng nhập chữ thay vì số
            System.out.println("Lỗi: Dữ liệu nhập vào không phải là số nguyên!");
        } finally {
            // Khối này LUÔN LUÔN chạy, dù có lỗi hay không
            System.out.println("Kết thúc khối xử lý ngoại lệ.");
            scanner.close();
        }
    }
}
```

**Kết quả mong đợi (Khi nhập sai):**

```text
Vui lòng nhập một số nguyên: abc
Lỗi: Dữ liệu nhập vào không phải là số nguyên!
Kết thúc khối xử lý ngoại lệ.
```

-----

### **7. Ví dụ về `throw`, `throws` và Custom Exception**

**Mục tiêu:** Minh họa cách một phương thức có thể "thông báo" về một lỗi tiềm tàng (`throws`) và chủ động "ném" ra lỗi đó (`throw`).

```java
// Bước 1: Tạo một lớp Exception của riêng mình
class NegativeNumberException extends Exception {
    public NegativeNumberException(String message) {
        super(message);
    }
}

public class ThrowsDemo {

    // Bước 2: Phương thức này khai báo rằng nó CÓ THỂ ném ra một NegativeNumberException
    public static void checkAge(int age) throws NegativeNumberException {
        if (age < 0) {
            // Chủ động ném ra một ngoại lệ nếu điều kiện sai
            throw new NegativeNumberException("Tuổi không thể là số âm!");
        }
        System.out.println("Tuổi hợp lệ: " + age);
    }

    public static void main(String[] args) {
        // Bước 3: Vì checkAge có thể ném lỗi, ta phải gọi nó trong try-catch
        try {
            checkAge(25);  // Trường hợp hợp lệ
            checkAge(-10); // Trường hợp này sẽ ném ra exception
        } catch (NegativeNumberException e) {
            System.out.println("Bắt được ngoại lệ: " + e.getMessage());
        }
    }
}
```

**Kết quả mong đợi:**

```text
Tuổi hợp lệ: 25
Bắt được ngoại lệ: Tuổi không thể là số âm!
```
