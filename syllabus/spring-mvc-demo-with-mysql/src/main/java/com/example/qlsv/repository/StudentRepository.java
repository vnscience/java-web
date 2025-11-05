package com.example.qlsv.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.qlsv.model.Student;
import java.util.List;

// Repository (thay DAO thủ công)
public interface StudentRepository extends JpaRepository<Student, Long> {}