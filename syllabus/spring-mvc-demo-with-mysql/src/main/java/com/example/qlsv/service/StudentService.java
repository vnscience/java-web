package com.example.qlsv.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.qlsv.model.Student;
import com.example.qlsv.repository.StudentRepository;

@Service
public class StudentService {
    @Autowired
    private StudentRepository repo;

    public List<Student> getAllStudents() { return repo.findAll(); }
    public void addStudent(Student student) { repo.save(student); }
    public Student getStudentById(Long id) { return repo.findById(id).orElse(null); }
    public void updateStudent(Student student) { repo.save(student); }
    public void deleteStudent(Long id) { repo.deleteById(id); }
}