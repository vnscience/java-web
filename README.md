# 🎓 JDK 21 Setup

Repo này giúp cài đặt **Java JDK 21** nhanh chóng cho sinh viên CNTT, chạy được trên **Windows, macOS, Linux**.

## 📌 Hướng dẫn nhanh

### 🔹 Windows
1. Tải file [setup-java.ps1](./setup-java.ps1).
2. Click chuột phải → **Run with PowerShell (Admin)**.
3. Sau khi chạy xong, mở PowerShell mới và gõ:
   ```powershell
   java -version
   javac -version
   ```

---

### 🔹 Mac/Linux

1. Tải file [setup-java.sh](./setup-java.sh).
2. Chạy:

   ```bash
   bash setup-java.sh
   ```
3. Sau đó mở terminal mới và kiểm tra:

   ```bash
   java -version
   javac -version
   ```

👉 Nếu thấy hiện `openjdk version "21..."`, nghĩa là đã cài đặt thành công.

## 📖 Tài liệu hướng dẫn chi tiết

Xem file PDF trong thư mục [JDK21_Setup_Guide.pdf](./JDK21_Setup_Guide.pdf).
