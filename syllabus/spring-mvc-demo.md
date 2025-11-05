## 🧭 Mục tiêu

Xây dựng và chạy ứng dụng quản lý sinh viên (CRUD: Create, Read, Update, Delete) với **Spring Boot + Spring MVC + Thymeleaf** trên **NetBeans**.

---
Trước tiên, cần cài Plugin NB SpringBoot cho Netbeans tại: [https://plugins.netbeans.apache.org/catalogue/?id=4](https://plugins.netbeans.apache.org/catalogue/?id=4)

## ⚙️ 1. Tạo Project Spring Boot trong NetBeans

### 🔹 Bước 1: Mở NetBeans

* Chọn: **File → New Project → Spring Boot → Spring Initializr Project**.

### 🔹 Bước 2: Khai báo thông tin dự án

* **Group**: `com.example`
* **Artifact**: `student-management`
* **Package name**: `com.example.qlsv`
* **Packaging**: `Jar`
* **Java version**: 17 (hoặc 21 nếu có sẵn).

### 🔹 Bước 3: Chọn dependencies

Tick chọn các gói:

* **Spring Web**
* **Thymeleaf**
* (Tuỳ chọn) **Spring Boot DevTools** để auto-reload khi code thay đổi.

Sau đó nhấn **Finish** → NetBeans sẽ tự động tải về project mẫu và cấu hình `pom.xml`.

---

## 🧩 2. Cấu trúc thư mục project

```
student-management/
 ├── src/main/java/com/example/qlsv/
 │     ├── controller/
 │     │      └── StudentController.java
 │     ├── model/
 │     │      └── Student.java
 │     ├── service/
 │     │      ├── StudentService.java
 │     │      └── StudentDAOImpl.java
 │     └── qlsvApplication.java
 ├── src/main/resources/
 │     ├── templates/
 │     │      ├── students.html
 │     │      └── edit-student.html
 │     ├── static/css/
 │     │      └── styles.css
 │     └── application.properties
 └── pom.xml
```

---

## 🧱 3. Viết mã nguồn theo mô hình MVC

### 🔸 Model – `Student.java`

```java
package com.example.qlsv.model;

public class Student {
    private Long id;
    private String name;
    private String email;

    public Student() {}
    public Student(Long id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    public Long getId() { return id; }
    public void setId(Long id) {
        if (id != null && id > 0) this.id = id;
    }

    public String getName() { return name; }
    public void setName(String name) {
        if (name != null && !name.trim().isEmpty()) this.name = name;
    }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
```

---

### 🔸 DAO & Service – `StudentDAOImpl.java`, `StudentService.java`

**StudentDAOImpl.java**

```java
package com.example.qlsv.service;
import java.util.*;
import org.springframework.stereotype.Repository;
import com.example.qlsv.model.Student;

@Repository
public class StudentDAOImpl {
    private final List<Student> students = new ArrayList<>();

    public List<Student> getAllStudents() {
        return students;
    }

    public void addStudent(Student student) {
        students.add(student);
    }

    public Student getStudentById(Long id) {
        return students.stream()
                .filter(s -> s.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    public void updateStudent(Student student) {
        int index = -1;
        for (int i = 0; i < students.size(); i++) {
            if (students.get(i).getId().equals(student.getId())) {
                index = i;
                break;
            }
        }
        if (index != -1) students.set(index, student);
    }

    public void deleteStudent(Long id) {
        students.removeIf(s -> s.getId().equals(id));
    }
}
```

**StudentService.java**

```java
package com.example.qlsv.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.qlsv.model.Student;

@Service
public class StudentService {
    @Autowired
    private StudentDAOImpl studentDAO;

    public List<Student> getAllStudents() { return studentDAO.getAllStudents(); }
    public void addStudent(Student student) { studentDAO.addStudent(student); }
    public Student getStudentById(Long id) { return studentDAO.getStudentById(id); }
    public void updateStudent(Student student) { studentDAO.updateStudent(student); }
    public void deleteStudent(Long id) { studentDAO.deleteStudent(id); }
}
```

---

### 🔸 Controller – `StudentController.java`

```java
package com.example.qlsv.controller;
import com.example.qlsv.model.Student;
import com.example.qlsv.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        model.addAttribute("student", new Student());
        return "students";
    }

    @PostMapping
    public String addStudent(@ModelAttribute Student student) {
        studentService.addStudent(student);
        return "redirect:/students";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("student", studentService.getStudentById(id));
        return "edit-student";
    }

    @PostMapping("/update")
    public String updateStudent(@ModelAttribute Student student) {
        studentService.updateStudent(student);
        return "redirect:/students";
    }

    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(id);
        return "redirect:/students";
    }
}
```

---

## 🎨 4. Giao diện Thymeleaf

### 🔹 `students.html`

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Student Management</title>
    <link rel="stylesheet" th:href="@{/css/styles.css}">
</head>
<body>
<h2>Student Management</h2>

<form th:action="@{/students}" th:object="${student}" method="post">
    <input type="number" th:field="*{id}" placeholder="ID" required>
    <input type="text" th:field="*{name}" placeholder="Name" required>
    <input type="email" th:field="*{email}" placeholder="Email" required>
    <button type="submit">Add</button>
</form>

<table>
    <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr></thead>
    <tbody>
        <tr th:each="student : ${students}">
            <td th:text="${student.id}"></td>
            <td th:text="${student.name}"></td>
            <td th:text="${student.email}"></td>
            <td>
                <a th:href="@{/students/edit/{id}(id=${student.id})}">Edit</a> |
                <a th:href="@{/students/delete/{id}(id=${student.id})}">Delete</a>
            </td>
        </tr>
    </tbody>
</table>
</body>
</html>
```

### 🔹 `edit-student.html`

```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Edit Student</title>
    <link rel="stylesheet" th:href="@{/css/styles.css}">
</head>
<body>
<h2>Edit Student</h2>

<form th:action="@{/students/update}" th:object="${student}" method="post">
    <input type="hidden" th:field="*{id}">
    <label>Name:</label>
    <input type="text" th:field="*{name}" required>
    <label>Email:</label>
    <input type="email" th:field="*{email}" required>
    <button type="submit">Save</button>
</form>

<a th:href="@{/students}">Back</a>
</body>
</html>
```

---

## 🪶 5. CSS – `styles.css`

```css
body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  padding: 20px;
}
h2 { color: #2e7d32; margin-bottom: 20px; }
table { width: 100%; border-collapse: collapse; margin-top: 15px; }
th, td { padding: 8px; border-bottom: 1px solid #ccc; }
a { color: #1565c0; text-decoration: none; margin: 0 5px; }
button { background-color: #2e7d32; color: white; border: none; padding: 6px 10px; cursor: pointer; }
```

---

## 🚀 6. Chạy ứng dụng

### 🔹 Cách 1 – Trong NetBeans:

* Nhấn **Run Project (Shift + F6)**.
* Spring Boot khởi động Tomcat nội bộ tại `http://localhost:8080/students`.

### 🔹 Cách 2 – Command line:

```bash
cd student-management
mvn spring-boot:run
```

Mở trình duyệt → truy cập:
👉 `http://localhost:8080/students`

---

## 🧾 7. Kiểm thử chức năng

* **Thêm sinh viên** → nhập ID, Name, Email → Save
* **Sửa sinh viên** → nhấn Edit → cập nhật thông tin → Save
* **Xoá sinh viên** → nhấn Delete
* **Quan sát dữ liệu** được hiển thị trong bảng Thymeleaf.

---
