
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


### **8. Ví dụ về `Queue` và `Deque` Interface**

**Mục tiêu:** Minh họa cách hoạt động của `Queue` (vào trước - ra trước, FIFO) và cách dùng `Deque` như một Ngăn xếp (vào sau - ra trước, LIFO).

```java
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.PriorityQueue;
import java.util.Queue;

public class QueueDemo {
    public static void main(String[] args) {
        // 1. PriorityQueue: Hàng đợi ưu tiên, các phần tử được sắp xếp tự động
        System.out.println("--- Ví dụ với PriorityQueue (Hàng đợi ưu tiên) ---");
        Queue<Integer> hangDoiUuTien = new PriorityQueue<>();
        hangDoiUuTien.offer(5); // offer() là phương thức thêm phần tử vào Queue
        hangDoiUuTien.offer(2);
        hangDoiUuTien.offer(8);

        System.out.println("Hàng đợi ban đầu: " + hangDoiUuTien);
        System.out.println("Phần tử được lấy ra (nhỏ nhất): " + hangDoiUuTien.poll()); // poll() lấy ra và xóa phần tử đầu hàng đợi
        System.out.println("Hàng đợi sau khi lấy ra: " + hangDoiUuTien);

        // 2. ArrayDeque: Dùng như một Ngăn xếp (Stack)
        System.out.println("\n--- Ví dụ dùng Deque như một Stack (Ngăn xếp) ---");
        Deque<String> nganXep = new ArrayDeque<>();
        nganXep.push("Đĩa 1"); // push() đẩy một phần tử vào đỉnh ngăn xếp
        nganXep.push("Đĩa 2");
        nganXep.push("Đĩa 3");

        System.out.println("Ngăn xếp hiện tại: " + nganXep);
        System.out.println("Lấy ra từ đỉnh ngăn xếp: " + nganXep.pop()); // pop() lấy ra và xóa phần tử trên cùng
        System.out.println("Ngăn xếp sau khi lấy ra: " + nganXep);
    }
}
```

**Kết quả mong đợi:**

```text
--- Ví dụ với PriorityQueue (Hàng đợi ưu tiên) ---
Hàng đợi ban đầu: [2, 5, 8]
Phần tử được lấy ra (nhỏ nhất): 2
Hàng đợi sau khi lấy ra: [5, 8]

--- Ví dụ dùng Deque như một Stack (Ngăn xếp) ---
Ngăn xếp hiện tại: [Đĩa 3, Đĩa 2, Đĩa 1]
Lấy ra từ đỉnh ngăn xếp: Đĩa 3
Ngăn xếp sau khi lấy ra: [Đĩa 2, Đĩa 1]
```

-----

### **9. Ví dụ về `ListIterator`**

**Mục tiêu:** Cho thấy khả năng duyệt danh sách theo hai chiều (tiến và lùi) và sửa đổi phần tử của `ListIterator`.

```java
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

public class ListIteratorDemo {
    public static void main(String[] args) {
        List<String> languages = new ArrayList<>();
        languages.add("Java");
        languages.add("Python");
        languages.add("C++");

        ListIterator<String> listIterator = languages.listIterator();

        System.out.println("--- Duyệt tiến ---");
        while (listIterator.hasNext()) {
            String lang = listIterator.next();
            System.out.println(lang);
            // Sửa phần tử "Python" thành "Python 3"
            if (lang.equals("Python")) {
                listIterator.set("Python 3");
            }
        }

        System.out.println("\n--- Duyệt lùi ---");
        while (listIterator.hasPrevious()) {
            String lang = listIterator.previous();
            System.out.println(lang);
        }
        
        System.out.println("\nDanh sách sau khi sửa: " + languages);
    }
}
```

**Kết quả mong đợi:**

```text
--- Duyệt tiến ---
Java
Python
C++

--- Duyệt lùi ---
C++
Python 3
Java

Danh sách sau khi sửa: [Java, Python 3, C++]
```

-----

### **10. Ví dụ về `SortedSet` và `SortedMap`**

**Mục tiêu:** Minh họa các phương thức đặc biệt của collection đã được sắp xếp, như lấy phần tử đầu/cuối hoặc lấy một tập hợp con.

```java
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

public class SortedDemo {
    public static void main(String[] args) {
        // SortedSet được triển khai bởi TreeSet
        System.out.println("--- Ví dụ với SortedSet ---");
        SortedSet<Integer> sortedSet = new TreeSet<>();
        sortedSet.add(10);
        sortedSet.add(5);
        sortedSet.add(20);
        sortedSet.add(15);
        System.out.println("SortedSet: " + sortedSet);
        System.out.println("Phần tử đầu tiên: " + sortedSet.first());
        System.out.println("Phần tử cuối cùng: " + sortedSet.last());
        System.out.println("Các phần tử nhỏ hơn 15: " + sortedSet.headSet(15));

        // SortedMap được triển khai bởi TreeMap
        System.out.println("\n--- Ví dụ với SortedMap ---");
        SortedMap<Integer, String> sortedMap = new TreeMap<>();
        sortedMap.put(3, "Ba");
        sortedMap.put(1, "Một");
        sortedMap.put(4, "Bốn");
        sortedMap.put(2, "Hai");
        System.out.println("SortedMap: " + sortedMap);
        System.out.println("Key đầu tiên: " + sortedMap.firstKey());
        System.out.println("Map con từ key 2 đến 4: " + sortedMap.subMap(2, 4));
    }
}
```

**Kết quả mong đợi:**

```text
--- Ví dụ với SortedSet ---
SortedSet: [5, 10, 15, 20]
Phần tử đầu tiên: 5
Phần tử cuối cùng: 20
Các phần tử nhỏ hơn 15: [5, 10]

--- Ví dụ với SortedMap ---
SortedMap: {1=Một, 2=Hai, 3=Ba, 4=Bốn}
Key đầu tiên: 1
Map con từ key 2 đến 4: {2=Hai, 3=Ba}
```

-----

### **11. Ví dụ về Đọc/Ghi File Văn Bản**

**Mục tiêu:** Minh họa cách ghi một chuỗi ra file text và đọc lại nội dung.

```java
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class TextFileDemo {
    public static void main(String[] args) {
        String fileName = "data.txt";
        
        // Ghi file văn bản
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
            writer.write("Dòng đầu tiên.\n");
            writer.write("Dòng thứ hai.\n");
            System.out.println("Ghi file thành công!");
        } catch (IOException e) {
            System.err.println("Lỗi khi ghi file: " + e.getMessage());
        }

        // Đọc file văn bản
        System.out.println("\n--- Đọc nội dung từ file ---");
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            System.err.println("Lỗi khi đọc file: " + e.getMessage());
        }
    }
}
```

**Kết quả mong đợi:**

```text
Ghi file thành công!

--- Đọc nội dung từ file ---
Dòng đầu tiên.
Dòng thứ hai.
```

-----

### **12. Ví dụ về Object Serialization**

**Mục tiêu:** Minh họa cách lưu trạng thái của một đối tượng Java ra file và đọc lại.

```java
import java.io.*;

// Lớp Student phải implements Serializable để có thể được tuần tự hóa
class Student implements Serializable {
    private String name;
    private int age;

    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "Student{name='" + name + "', age=" + age + '}';
    }
}

public class SerializationDemo {
    public static void main(String[] args) {
        String fileName = "student.ser";
        Student originalStudent = new Student("Nguyễn Văn A", 20);

        // 1. Ghi đối tượng ra file (Serialization)
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(fileName))) {
            oos.writeObject(originalStudent);
            System.out.println("Đã ghi đối tượng Student vào file!");
            System.out.println("Đối tượng gốc: " + originalStudent);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // 2. Đọc đối tượng từ file (Deserialization)
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(fileName))) {
            Student deserializedStudent = (Student) ois.readObject();
            System.out.println("\nĐã đọc đối tượng Student từ file!");
            System.out.println("Đối tượng được phục hồi: " + deserializedStudent);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
```

**Kết quả mong đợi:**

```text
Đã ghi đối tượng Student vào file!
Đối tượng gốc: Student{name='Nguyễn Văn A', age=20}

Đã đọc đối tượng Student từ file!
Đối tượng được phục hồi: Student{name='Nguyễn Văn A', age=20}
```

-----

### **13. Ví dụ về "Mã Hóa" Đơn Giản (Base64 Encoding)**

**Mục tiêu:** Minh họa một kỹ thuật mã hóa dữ liệu đơn giản, chuyển đổi dữ liệu sang một định dạng an toàn để truyền tải.

```java
import java.util.Base64;

public class EncodingDemo {
    public static void main(String[] args) {
        String originalText = "Lập trình Web với Java 1";
        System.out.println("Văn bản gốc: " + originalText);

        // Mã hóa sang Base64
        String encodedText = Base64.getEncoder().encodeToString(originalText.getBytes());
        System.out.println("Văn bản sau khi mã hóa Base64: " + encodedText);

        // Giải mã từ Base64
        byte[] decodedBytes = Base64.getDecoder().decode(encodedText);
        String decodedText = new String(decodedBytes);
        System.out.println("Văn bản sau khi giải mã: " + decodedText);
    }
}
```

**Kết quả mong đợi:**

```text
Văn bản gốc: Lập trình Web với Java 1
Văn bản sau khi mã hóa Base64: TOG6rXAgdHLDrG5oIFdlYiB24bubaSBKYXZhIDE=
Văn bản sau khi giải mã: Lập trình Web với Java 1
```
