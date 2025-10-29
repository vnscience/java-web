Dưới đây là **hướng dẫn chi tiết từng bước** để **cài đặt và tạo ứng dụng CRUD MVC trong NetBeans 17**

---

## 1. Cài đặt môi trường lập trình

### **Bước 1. Cài JDK 21 (hoặc 17)**

* Truy cập: [https://www.oracle.com/java/technologies/downloads/](https://www.oracle.com/java/technologies/downloads/)
* Tải bản phù hợp.
* Cài đặt bình thường, sau đó kiểm tra:

  ```bash
  java -version
  javac -version
  ```
* Nếu báo lỗi, thiết lập biến môi trường trong `.zshrc` hoặc `.bash_profile`:

  ```bash
  export JAVA_HOME=$(/usr/libexec/java_home -v 21)
  export PATH=$JAVA_HOME/bin:$PATH
  ```

---

### **Bước 2. Cài Apache NetBeans 17**

* Tải từ: [https://netbeans.apache.org/download/index.html](https://netbeans.apache.org/download/index.html)
* Cài đặt và mở NetBeans.
* Vào **Tools → Java Platforms** để kiểm tra JDK đã được nhận diện.

---

### **Bước 3. Cài đặt và cấu hình Apache Tomcat**

* Tải Tomcat 10 (Java EE 10) từ: [https://tomcat.apache.org/download-10.cgi](https://tomcat.apache.org/download-10.cgi)
* Giải nén vào thư mục (ví dụ: `/Users/baynv/ApacheTomcat10`).
* Trong NetBeans:

  * Mở tab **Services → Servers → Add Server**.
  * Chọn **Apache Tomcat**, trỏ đến thư mục cài đặt.
  * Đặt user/password cho Tomcat Manager (tùy chọn).

---

## 2. Tạo ứng dụng CRUD MVC (JSP/Servlet)

### **Bước 1. Tạo Project Web**

* Vào **File → New Project → Java with Ant → Web Application**.
* Đặt tên: `StudentManagementMVC`.
* Chọn server: **Apache Tomcat 10**.
* Chọn Java EE version: **Jakarta EE 10 / Servlet 5.0 / JSP 3.0**.

---

### **Bước 2. Tạo cấu trúc thư mục MVC**

```
src/
 ├── model/
 │    └── Student.java
 ├── dao/
 │    ├── StudentDAO.java
 │    └── StudentDAOImpl.java
 ├── controller/
 │    └── StudentServlet.java
 └── util/
      └── DBUtil.java
web/
 ├── index.jsp
 ├── student-list.jsp
 ├── student-form.jsp
 └── WEB-INF/
      └── web.xml
```

---

## 3. Cài đặt các lớp Model–DAO–Controller

### **Model – Student.java**

```java
package model;

public class Student {
    private int id;
    private String name;
    private double gpa;

    public Student() {}

    public Student(int id, String name, double gpa) {
        this.id = id;
        this.name = name;
        this.gpa = gpa;
    }

    // Getter và Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public double getGpa() { return gpa; }
    public void setGpa(double gpa) { this.gpa = gpa; }
}
```

---

### **DAO Interface – StudentDAO.java**

```java
package dao;

import java.util.List;
import model.Student;

public interface StudentDAO {
    List<Student> findAll();
    Student findById(int id);
    void insert(Student s);
    void update(Student s);
    void delete(int id);
}
```

---

### **DAO Implementation – StudentDAOImpl.java (sử dụng JDBC)**

```java
package dao;

import java.sql.*;
import java.util.*;
import model.Student;
import util.DBUtil;

public class StudentDAOImpl implements StudentDAO {
    private Connection conn = DBUtil.getConnection();

    @Override
    public List<Student> findAll() {
        List<Student> list = new ArrayList<>();
        try (Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM student")) {
            while (rs.next()) {
                list.add(new Student(rs.getInt("id"), rs.getString("name"), rs.getDouble("gpa")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public void insert(Student s) {
        try (PreparedStatement ps = conn.prepareStatement("INSERT INTO student(name,gpa) VALUES(?,?)")) {
            ps.setString(1, s.getName());
            ps.setDouble(2, s.getGpa());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void update(Student s) {
        try (PreparedStatement ps = conn.prepareStatement("UPDATE student SET name=?, gpa=? WHERE id=?")) {
            ps.setString(1, s.getName());
            ps.setDouble(2, s.getGpa());
            ps.setInt(3, s.getId());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void delete(int id) {
        try (PreparedStatement ps = conn.prepareStatement("DELETE FROM student WHERE id=?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public Student findById(int id) {
        try (PreparedStatement ps = conn.prepareStatement("SELECT * FROM student WHERE id=?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next())
                return new Student(rs.getInt("id"), rs.getString("name"), rs.getDouble("gpa"));
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}
```

---

### **Controller – StudentServlet.java**

```java
package controller;

import dao.*;
import model.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class StudentServlet extends HttpServlet {
    private StudentDAO dao = new StudentDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Student> students = dao.findAll();
        req.setAttribute("students", students);
        RequestDispatcher rd = req.getRequestDispatcher("student-list.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            String name = req.getParameter("name");
            double gpa = Double.parseDouble(req.getParameter("gpa"));
            dao.insert(new Student(0, name, gpa));
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.delete(id);
        }
        resp.sendRedirect("StudentServlet");
    }
}
```

---

### **DBUtil.java (kết nối MySQL)**

```java
package util;
import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/studentdb";
    private static final String USER = "root";
    private static final String PASS = "123456";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
```

---

## 4. Tạo giao diện JSP

### **student-list.jsp**

```jsp
<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<html>
<head><title>Student List</title></head>
<body>
<h2>Student List</h2>
<a href="student-form.jsp">Add New Student</a>
<table border="1">
<tr><th>ID</th><th>Name</th><th>GPA</th><th>Action</th></tr>
<%
    List<Student> list = (List<Student>)request.getAttribute("students");
    for (Student s : list) {
%>
<tr>
<td><%=s.getId()%></td>
<td><%=s.getName()%></td>
<td><%=s.getGpa()%></td>
<td>
<form action="StudentServlet" method="post">
<input type="hidden" name="action" value="delete"/>
<input type="hidden" name="id" value="<%=s.getId()%>"/>
<input type="submit" value="Delete"/>
</form>
</td>
</tr>
<% } %>
</table>
</body>
</html>
```

---

### **student-form.jsp**

```jsp
<html>
<head><title>Add Student</title></head>
<body>
<h2>Add Student</h2>
<form action="StudentServlet" method="post">
    <input type="hidden" name="action" value="add"/>
    Name: <input type="text" name="name"/><br/>
    GPA: <input type="text" name="gpa"/><br/>
    <input type="submit" value="Save"/>
</form>
</body>
</html>
```

---

## 5. Triển khai và chạy ứng dụng

1. Tạo database MySQL:

   ```sql
   CREATE DATABASE studentdb;
   USE studentdb;
   CREATE TABLE student (
       id INT AUTO_INCREMENT PRIMARY KEY,
       name VARCHAR(100),
       gpa DOUBLE
   );
   ```
2. Trong NetBeans, **Clean and Build → Run Project**.
3. Truy cập: [http://localhost:8080/StudentManagementMVC/StudentServlet](http://localhost:8080/StudentManagementMVC/StudentServlet)

---

## 6. Mở rộng & nâng cao

* **Pagination**: thêm `LIMIT` và `OFFSET` trong DAO.
* **Validation**: xử lý lỗi form bằng JSTL hoặc Servlet.
* **Bootstrap**: thêm vào JSP để làm giao diện hiện đại.
* **DAO + MySQL Connection Pooling**: dùng `javax.sql.DataSource`.
