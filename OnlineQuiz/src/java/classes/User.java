package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class User {
    private int id;
    private String fullname;
    private String email;
    private String password;
    private String phone;
    private String role;

    public User() {}

    public User(int id, String fullname, String email, String password, String phone, String role) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.role = role;
    }
    
    

    public User(String fullname, String email, String password, String phone) {
        this.fullname = fullname;
        this.email = email;
        this.password = MD5.getMd5(password);
        this.phone = phone;
        this.role = "user";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

 

    public int register(Connection conn) throws SQLException {
        String checkSql = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setString(1, email);
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    return -1; 
                }
            }
        }

        String sql = "INSERT INTO users (fullname, email, password, phone, role) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.setString(4, phone);
            pstmt.setString(5, role);

            int rowsAffected = pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    this.id = generatedKeys.getInt(1);
                }
            }

            return rowsAffected;
        }
    }

    public static User authenticate(String email, String password, Connection conn) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, MD5.getMd5(password));

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setFullname(rs.getString("fullname"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }
        }
        return null;
    }
    
    public int remove(Connection conn) throws SQLException {
        String sql = "DELETE FROM users WHERE id = ? AND role = 'teacher'";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, this.id);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected;
        }
    }

    public String getFullName() {
        return this.fullname;
    }

    public List<User> getAllTeachers(Connection conn) throws SQLException {
        List<User> teachers = new ArrayList<>();
        String sql = "SELECT id, fullname, email, phone FROM users WHERE role = 'teacher'";
        try (PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                User teacher = new User();
                teacher.setId(rs.getInt("id"));
                teacher.setFullname(rs.getString("fullname"));
                teacher.setEmail(rs.getString("email"));
                teacher.setPhone(rs.getString("phone"));
                teachers.add(teacher);
            }
        }
        return teachers;
    }
    public List<User> getAllStudents(Connection conn) throws SQLException {
    List<User> students = new ArrayList<>();
    String sql = "SELECT id, fullname, email FROM users WHERE role = 'user'";
    try (PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
            User student = new User();
            student.setId(rs.getInt("id"));
            student.setFullname(rs.getString("fullname"));
            student.setEmail(rs.getString("email"));
            students.add(student);
        }
    }
    return students;
}

public int removeStudent(Connection conn) throws SQLException {
    String sql = "DELETE FROM users WHERE id = ? AND role = 'user'";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, this.id);
        return pstmt.executeUpdate();
    }
}
public int updateTeacher(Connection conn) throws SQLException {
    String sql = "UPDATE users SET fullname = ?, email = ?, phone = ? WHERE id = ? AND role = 'teacher'";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, this.fullname);
        pstmt.setString(2, this.email);
        pstmt.setString(3, this.phone);
        pstmt.setInt(4, this.id);

        return pstmt.executeUpdate();
    }
}

public User getTeacherById(Connection conn, int id) throws SQLException {
    String sql = "SELECT id, fullname, email, phone FROM users WHERE id = ? AND role = 'teacher'";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, id);

        try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                User teacher = new User();
                teacher.setId(rs.getInt("id"));
                teacher.setFullname(rs.getString("fullname"));
                teacher.setEmail(rs.getString("email"));
                teacher.setPhone(rs.getString("phone"));
                return teacher;
            }
        }
    }
    return null;
}

public User getStudentById(Connection conn, int id) throws SQLException {
    String sql = "SELECT id, fullname, email, phone FROM users WHERE id = ? AND role = 'user'";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, id);

        try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                User student = new User();
                student.setId(rs.getInt("id"));
                student.setFullname(rs.getString("fullname"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                return student;
            }
        }
    }
    return null;
}

public int updateStudent(Connection conn) throws SQLException {
    String sql = "UPDATE users SET fullname = ?, email = ?, phone = ? WHERE id = ? AND role = 'user'";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, this.fullname);
        pstmt.setString(2, this.email);
        pstmt.setString(3, this.phone);
        pstmt.setInt(4, this.id);

        return pstmt.executeUpdate();
    }
}

public int addTeacher(Connection conn) throws SQLException {
    String sql = "INSERT INTO users (fullname, email, password, phone, role) VALUES (?, ?, ?, ?, 'teacher')";
    try (PreparedStatement pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
        pstmt.setString(1, this.fullname);
        pstmt.setString(2, this.email);
        pstmt.setString(3, this.password);
        pstmt.setString(4, this.phone);

        int rowsAffected = pstmt.executeUpdate();

        try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                this.id = generatedKeys.getInt(1);
            }
        }

        return rowsAffected;
    }
}

public int getCount(Connection conn, String role) throws SQLException {
    
    String sql = "SELECT COUNT(*) AS count FROM users WHERE role = ?";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, role);
        try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("count");
            }
        }
    }
    return 0;
}

public int getTeacherCount(Connection conn) throws SQLException {
    return getCount(conn, "teacher");
}

public int getStudentCount(Connection conn) throws SQLException {
    return getCount(conn, "user");
}



}