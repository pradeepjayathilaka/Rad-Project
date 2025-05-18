
package classes;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Subject {
    private int id;
    private String name;
    private String description;
    private int duration; 
    private int teacherId;

    
    public Subject(String name, String description, int duration) {
        this.name = name;
        this.description = description;
        this.duration = duration;
    }

    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public int getDuration() {
        return duration;
    }

    public int getTeacherId() {
        return teacherId;
    }

    
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

  
    public static boolean addSubject(Subject subject) {
        String query = "INSERT INTO Subject (name, description, duration, teacher_id) VALUES (?, ?, ?, ?)";
        try (Connection con = DbConnector.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, subject.getName());
            ps.setString(2, subject.getDescription());
            ps.setInt(3, subject.getDuration());
            ps.setInt(4, subject.getTeacherId());
            return ps.executeUpdate() > 0; 
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false; 
        }
    }

    
    public static List<Subject> getAllSubjects() {
        List<Subject> subjectList = new ArrayList<>();
        String query = "SELECT * FROM Subject";
        try (Connection con = DbConnector.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int duration = rs.getInt("duration");
                int teacherId = rs.getInt("teacher_id");

                Subject subject = new Subject(name, description, duration);
                subject.setId(id);
                subject.setTeacherId(teacherId);
                subjectList.add(subject);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return subjectList; 
    }
    
    public boolean update() {
        String query = "UPDATE Subject SET name = ?, description = ?, duration = ? WHERE id = ?";
        try (Connection con = DbConnector.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, this.name);
            ps.setString(2, this.description);
            ps.setInt(3, this.duration);
            ps.setInt(4, this.id);
            return ps.executeUpdate() > 0; 
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false; 
        }
    }
    public static int getQuizCount(Connection conn) throws SQLException {
    String sql = "SELECT COUNT(*) AS count FROM Subject";
    try (PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
            return rs.getInt("count");
        }
    }
    return 0;
}

}
